# The stick number of 8_1: proof and partial Lean formalization

This repository accompanies a computer-assisted argument for `stick(8_1)=10`.
Read the [draft PDF](paper/main.pdf) or [LaTeX source](paper/main.tex).
The author is Griffith Wang (contact: griffithgwang@gmail.com), with no
affiliation listed. The manuscript remains a draft pending arXiv submission
and license selection. Posting the code does not constitute peer review.

## Precisely what Lean establishes

The audit release records a successful rebuild of all **59 local Lean
modules** on Windows, with the pinned upstream mathlib cache. The per-module
source hashes and timings are in the Release asset
`LEAN_RELEASE_VERIFICATION.json`. This is distinct from an incremental build
of only the final theorem and is not a claim that every platform was tested.

`Stick81.Submission.geometric_exclusion_eleven` derives a contradiction for
a positive generic normalized real frame whose source evaluation satisfies
nine ear conditions and two target conditions. The other **2,283 of 2,294**
source roots follow from real geometry in Lean. **All 2,294** source roots
have a verified Boolean/counter encoding, and the fixed 76,298-clause CNF
has a certified LRAT refutation.

The global roof construction, ear elimination, Conway interpretation, and
external knot classification are ordinary mathematics in the paper. They are
not concealed Lean axioms. There is no end-to-end theorem about `stick(K81)`.
Native reflection uses `Lean.ofReduceBool`, so the compiler/runtime is part
of the trusted base. The audited theorem has no `sorryAx` dependency.

## Reproduce

Use Python 3.13 and install `requirements.txt` in an isolated environment.
Install Lean **4.19.0** (for example with elan), then run:

```text
python setup_mathlib.py
python fetch_assets.py --repository griffithwang/stick8-1-certificate --tag v0.1.0-audit
python verify_public.py
python verify_partial_formalization.py --full
```

Use the fixed release accompanying this version of the paper.
Asset download checks every file against its expected
SHA-256 before installing it. The uncompressed dense LRAT certificate and
the hex-encoded compressed Lean certificate are separate Release assets.
Their filenames and hashes are in `ASSETS.json`.

Set `LEAN_BIN` to the pinned toolchain's `bin` directory if Lean is not on
PATH. `setup_mathlib.py` fetches mathlib at commit
`c44e0c8ee63ca166450922a373c7409c5d26b00b` and its package cache.
The full build compiles all local modules in dependency order; it does not
trust bundled local `.olean` files (none are distributed). Mathlib's upstream
cache is used. Compilation of the embedded proof and large counter modules
can take several minutes each and requires substantial memory and disk space.
The build driver supports Windows and POSIX path selection; the measured
local verification platform is Windows. Other platforms need their own run.

`verify_public.py` checks source/data hashes, replays the exact upper-bound
trace, reconstructs the base CNF, compares it modulo line endings, and checks
every gate clause. It rejects Python `-O`, because arithmetic checkers use
assertions. The Lean build is a separate step, explicitly recorded in its
verification JSON. Neither a hash check nor random controls prove the global
geometric reduction.

The optional `check_named_target.py` compares the trace's target with
Spherogram's named `8_1` table, preserving plane orientation and over/under
parity. Install `requirements-knot-table.txt` to run it. This table check is
separate from the standard-library Reidemeister trace replay.

For an independent C replay on a system with a C compiler:

```text
cc -O2 lrat-check.c -o lrat-check
./lrat-check roof_direct.cnf roof_base_dense.lrat
```

## Contents and provenance

The vector illustration in `paper/tengon.pdf` is included for TeX compilation.
To regenerate it, run `paper/draw_tengon.py` with matplotlib 3.11.0 and NumPy.
These plotting packages are optional and are not used for proof verification.

The source dependency closure includes model-generation utilities inherited
from the research development. Optional model flags are not used by this
proof. Earlier search outputs, solver binaries, personal session logs, and
local toolchain caches are excluded. Pinned source data and small local
counter certificates are included; the large fixed certificate is external.
`SOURCE_MANIFEST.json` records the exact published file bytes.

`lrat-check.c` retains its upstream copyright and MIT permission notice.
Lean, mathlib, Z3, Spherogram, and the solver tools retain their own licenses;
their installations are not vendored here. No new license for the author's
original work has yet been selected. A public repository alone does not
grant a general reuse license.

AI assistance was used in drafting, implementation, and audit. The human
author is responsible for the mathematical claims and the submitted version.
