"""Install the pinned mathlib dependency without replacing an existing checkout."""
from pathlib import Path
import os
import shutil
import subprocess

ROOT = Path(__file__).resolve().parent
DEST = ROOT / 'lean_formalization' / 'mathlib'
COMMIT = 'c44e0c8ee63ca166450922a373c7409c5d26b00b'
flags = getattr(subprocess, 'CREATE_NO_WINDOW', 0)
env = os.environ.copy()
if env.get('LEAN_BIN'):
    env['PATH'] = env['LEAN_BIN'] + os.pathsep + env['PATH']
lean, lake = shutil.which('lean', path=env['PATH']), shutil.which('lake', path=env['PATH'])
if not lean or not lake:
    raise SystemExit('Install Lean 4.19.0 and lake, or set LEAN_BIN.')
version = subprocess.check_output([lean, '--version'], env=env, text=True)
if 'version 4.19.0' not in version:
    raise SystemExit(f'Wrong Lean version: {version}')
if not DEST.exists():
    subprocess.run(['git', 'clone', '--branch', 'v4.19.0', '--depth', '1',
                    'https://github.com/leanprover-community/mathlib4.git', str(DEST)],
                   check=True, creationflags=flags)
actual = subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=DEST, text=True).strip()
if actual != COMMIT:
    raise SystemExit('Existing mathlib has wrong commit; it was not changed.')
subprocess.run([lake, 'exe', 'cache', 'get'], cwd=DEST, env=env, check=True, creationflags=flags)
