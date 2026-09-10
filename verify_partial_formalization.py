"""Rebuild and audit the paper-facing Lean partial formalization."""
from pathlib import Path
import hashlib
import argparse
import re
import json
import subprocess
import sys
from datetime import datetime, timezone

ROOT = Path(__file__).resolve().parent
LEAN = ROOT / "lean_formalization"

def sha(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            h.update(block)
    return h.hexdigest()

def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('--full', action='store_true', help='Recompile every release module in dependency order.')
    args = parser.parse_args()
    command = [sys.executable, "build.py"]
    if not args.full:
        command += ["SubmissionTheorem", "SubmissionAudit"]
    run = subprocess.run(command, cwd=LEAN, capture_output=True, text=True,
                         encoding="utf-8", errors="replace",
                         creationflags=getattr(subprocess, "CREATE_NO_WINDOW", 0))
    output = run.stdout + run.stderr
    (LEAN / "build_logs" / "submission_rebuild.log").write_text(output, encoding="utf-8")
    if run.returncode != 0:
        print(output)
        return run.returncode
    audit_log = (LEAN / "build_logs" / "SubmissionAudit.log").read_text(encoding="utf-8")
    if "sorryAx" in audit_log or "error:" in audit_log:
        print(audit_log)
        return 2
    declarations = re.findall(r"'([^']+)' depends on axioms: \[([^\]]*)\]", audit_log, re.S)
    allowed = {'propext', 'Classical.choice', 'Quot.sound', 'Lean.ofReduceBool'}
    if not any(name == 'Stick81.Submission.geometric_exclusion_eleven' for name, _ in declarations):
        raise RuntimeError('Final eleven-root theorem missing from axiom audit')
    for name, raw in declarations:
        if set(raw.replace('\n', '').split(', ')) - allowed:
            # Whitespace is insignificant in Lean's pretty-printed list.
            if {item.strip() for item in raw.split(',')} - allowed:
                raise RuntimeError(f'Unexpected axioms in {name}: {raw}')
    required = [
        LEAN / "SubmissionTheorem.lean",
        LEAN / "SubmissionAudit.lean",
        LEAN / "SubmissionTheorem.olean",
        LEAN / "SubmissionAudit.olean",
        ROOT / "PARTIAL_FORMALIZATION.md",
    ]
    missing = [str(path) for path in required if not path.exists()]
    if missing:
        print("Missing submission artifacts:", missing)
        return 3
    report = {
        "status": "PASS",
        "claim": "Lean-certified finite core, not a complete end-to-end proof",
        "verified_utc": datetime.now(timezone.utc).isoformat(),
        "theorem": "Stick81.Submission.geometric_exclusion_eleven",
        "formalized_root_prefix": 2183,
        "geometrically_linked_roots": 2283,
        "total_roots": 2294,
        "remaining_roots": 11,
        "remaining_slices_zero_based": [[2183,2192],[2292,2294]],
        "build_scope": 'all release modules rebuilt' if args.full else 'incremental final theorem and audit only',
        "axiom_audit": "no sorryAx; propext, Classical.choice, Quot.sound, Lean.ofReduceBool only",
        "artifacts": {str(path.relative_to(ROOT)): sha(path) for path in required},
        "rebuild_command": "python verify_partial_formalization.py",
    }
    (ROOT / "PARTIAL_FORMALIZATION_VERIFICATION.json").write_text(
        json.dumps(report, indent=2), encoding="utf-8"
    )
    print(json.dumps(report, indent=2))
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
