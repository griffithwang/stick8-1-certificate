# A Lean-certified finite core for the (8_1) stick-number computation

**Correction, September 10, 2026:** the primary theorem is now
`Stick81.Submission.geometric_exclusion_eleven`. It combines the first 2,183
roots with 20 direction roots and 80 order roots: **2,283/2,294** geometric
root implications are proved. Exactly **11** premises remain: the nine
ear roots at [2183,2192) and two targets at [2292,2294), using zero-based
half-open slices. All 2,294 roots have a verified Boolean-to-CNF translation.
`externalRoots_count` and `full_root_partition` verify this inventory in Lean.
The new theorem and its axiom audit compiled successfully. The older
111-root theorem discussed below is retained as historical documentation;
it is no longer the strongest theorem or the current publication boundary.
`SegmentCrossing.cross_iff_intersects` has also now compiled successfully.

The English manuscript is `publication/main.tex`, currently a draft awaiting
author metadata, release verification, and submission. No arXiv publication
is claimed. The ratio of roots is not a confidence score. Ordinary proofs
of the global roof construction, ear conditions, and Conway interpretation
are still needed to apply the formal result to a knot. Native reflection
includes the Lean compiler/runtime in the trusted base.

`python verify_partial_formalization.py` is an incremental final-theorem
check; `--full` rebuilds all modules. The report distinguishes the two.

