"""Independent arithmetic/encoding replay; Lean compilation is a separate step."""
from pathlib import Path
import hashlib
import json
import subprocess
import sys
from datetime import datetime, timezone

ROOT = Path(__file__).resolve().parent

def sha(path):
    h = hashlib.sha256()
    with path.open('rb') as f:
        for block in iter(lambda: f.read(1024*1024), b''):
            h.update(block)
    return h.hexdigest()

def main():
    if not __debug__:
        raise SystemExit('Do not use Python -O; arithmetic checkers use assertions.')
    manifest = json.loads((ROOT/'SOURCE_MANIFEST.json').read_text())
    for name, expected in manifest['sha256'].items():
        path = (ROOT/name).resolve()
        if not path.is_relative_to(ROOT) or sha(path) != expected:
            raise RuntimeError(f'Source/data mismatch: {name}')
    commands = [
        [sys.executable, 'check_reidemeister.py'],
        [sys.executable, 'direct_cnf.py', '--model', 'roof', '--prefix', 'release_rebuilt'],
        [sys.executable, 'check_direct_cnf.py', '--prefix', 'release_rebuilt'],
    ]
    logs = ROOT/'verification_logs'
    logs.mkdir(exist_ok=True)
    for n, command in enumerate(commands):
        run = subprocess.run(command, cwd=ROOT, capture_output=True, text=True,
                             encoding='utf-8', errors='replace',
                             creationflags=getattr(subprocess,'CREATE_NO_WINDOW',0))
        (logs/f'step_{n}.log').write_text(run.stdout+run.stderr, encoding='utf-8')
        if run.returncode:
            raise RuntimeError(f'{command[1]} failed; see {logs.name}/step_{n}.log')
    if (ROOT/'release_rebuilt.cnf').read_text() != (ROOT/'roof_direct.cnf').read_text():
        raise RuntimeError('Reconstructed base CNF differs, even after newline normalization')
    from exact_polygon import certificate
    from sign_cells import conway_a2, geometric_visits
    vertices = [s.split() for s in (ROOT/'known_10gon.tab').read_text().splitlines()[1:]]
    cert = certificate(vertices)
    assert conway_a2(geometric_visits(cert)) == -3
    report = {'status':'PASS', 'utc':datetime.now(timezone.utc).isoformat(),
              'source_files_hashed':len(manifest['sha256']),
              'upper_bound_trace':'replayed', 'a2':-3,
              'base_cnf_reconstruction':'equal modulo line endings',
              'scope':'Arithmetic, local diagram trace, and encoding checks only; Lean and global geometry separate'}
    (ROOT/'PUBLIC_VERIFICATION.json').write_text(json.dumps(report,indent=2))
    print(json.dumps(report,indent=2))

if __name__ == '__main__':
    main()
