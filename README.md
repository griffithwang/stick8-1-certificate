# The stick number of 8_1 is 10

This project gives a **computer-assisted proof that the knot $8_1$ has stick
number ten**, resolving the previously open question of whether nine or ten
straight segments are required:

$$
\operatorname{stick}(8_1)=10.
$$

Ten segments suffice to form this knot in three-dimensional space, and no
embedded polygon with fewer segments represents the same knot. The central
contribution is a universal exclusion of nine-stick realizations, combined
with an exact ten-stick construction.

**Griffith Wang** · griffithgwang@gmail.com

[Read the paper](paper/main.pdf) · [LaTeX source](paper/main.tex) ·
[Proof certificates and verification records](https://github.com/griffithwang/stick8-1-certificate/releases/tag/v0.1.0-audit)

## The problem

The stick number of a knot is the smallest number of straight segments that
can form a closed, non-self-intersecting polygon of that knot type. It measures
the complexity of a spatial realization, rather than the number of crossings
in a drawing. In the name $8_1$, the eight refers to the knot's crossing number.

For $8_1$, the existing bounds left two possibilities: nine or ten sticks.
[Calvo's classification of octagonal knots, Theorem 1(iv)](https://arxiv.org/abs/math/9904037v2)
excludes realizations with at most eight sticks. The two-bridge construction of
[Huh, No, and Oh, Theorem 1.1](https://arxiv.org/abs/1411.1850)
gives a ten-stick upper bound. The question remained open in the 2025 survey
[New Upper Bounds for Stick Numbers](https://arxiv.org/abs/2508.18263):
Appendix A lists a ten-stick realization of $8_1$, without marking its exact
stick number as known.

The proof presented here closes that gap by ruling out every nine-stick
representative, including polygons with arbitrary real coordinates.

## How the proof works

The lower bound begins with a hypothetical nine-stick representative. An
exposed vertex and a projective change of coordinates put it into a form whose
planar diagram has eight shadow edges, with the closing shadow edge passing
over every crossing. That closing shadow edge represents two spatial segments.
The geometry, the obstruction to removing an ear triangle, and the knot's
diagram invariants impose a finite collection of necessary sign constraints.

These constraints are inconsistent. A fixed proof certificate establishes
their inconsistency, so a geometric nine-stick counterexample cannot exist.
The argument covers all real-coordinate configurations through the geometric
reduction; it does not infer a lower bound from an unsuccessful numerical search.

For the upper bound, the repository supplies an explicit rational ten-gon.
Exact arithmetic checks its embeddedness and crossing data, and a sequence of
thirty checked Reidemeister moves identifies its diagram with $8_1$.
Together, the two bounds establish the stated equality.

The [paper](paper/main.pdf) develops the mathematical argument. Its appendix
collects the certificate identifiers and reproduction details. The code and
data below make the computational part available for independent checking.

## Tools and verification

The finite model uses **142 geometric signs** and **2,294 source constraints**.
Its CNF encoding has **18,597 variables and 76,298 clauses**. CaDiCaL produced
a refutation, which was checked independently and converted to an LRAT
certificate. Lean 4 verifies the fixed refutation and the translation from
the source constraints to the encoded formula.

The Lean development also formalizes a substantial part of the real geometry.
Its precise scope is as follows.

`Stick81.Submission.geometric_exclusion_eleven` derives a contradiction for
a positive generic normalized real frame whose source evaluation satisfies
nine ear conditions and two target conditions. The other **2,283 of 2,294**
source roots follow from real geometry in Lean. **All 2,294** source roots
have a verified Boolean/counter encoding, and the fixed 76,298-clause CNF
has a certified LRAT refutation.

The global roof construction, ear elimination, Conway interpretation, and
external knot classification are ordinary mathematics in the paper. The
overall result is a computer-assisted proof with **partial Lean formalization**;
there is no end-to-end Lean theorem about `stick(K81)`. Native reflection uses
`Lean.ofReduceBool`, so the compiler/runtime is part of the trusted base.
The audited theorem has no `sorryAx` dependency.

All **59 local Lean modules** were rebuilt successfully on Windows with the
pinned upstream mathlib cache. Per-module source hashes and timings are
recorded in the release asset `LEAN_RELEASE_VERIFICATION.json`. Separate
records document the arithmetic checks, C LRAT replay, and verification of
the publicly downloaded source package. These computational checks are
distinct from independent human peer review; the manuscript is a preprint.

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
their installations are not vendored here. Original code is licensed under
the **MIT License**; the manuscript and original figures are licensed under
**CC BY 4.0**. See [LICENSES.md](LICENSES.md) for the precise scope.

Generative AI was used extensively in developing and reviewing mathematical
arguments, implementing the computational and Lean components, and drafting
the manuscript. The author is responsible for the mathematical claims, code,
references, and submitted version.
