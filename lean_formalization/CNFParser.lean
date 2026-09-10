import Std.Tactic.BVDecide.LRAT.Checker
import Std.Tactic.BVDecide.LRAT.Parser

open Std.Sat
open Std.Tactic.BVDecide

/-- Parse the one-clause-per-line DIMACS emitted by this project.
    Lean CNF variables are zero-based; the LRAT conversion shifts them back. -/
def parseProjectCNF (text : String) : Except String (CNF Nat) := do
  let mut header : Option (Nat × Nat) := none
  let mut clauses : Array (CNF.Clause Nat) := #[]
  for raw in text.splitOn "\n" do
    let line := raw.trim
    if line.isEmpty || line.startsWith "c" then
      continue
    let tokens := (line.splitOn " ").filter (fun s => !s.isEmpty)
    if line.startsWith "p" then
      if header.isSome then throw "duplicate header"
      match tokens with
      | ["p", "cnf", vars, count] =>
        match vars.toNat?, count.toNat? with
        | some n, some m => header := some (n, m)
        | _, _ => throw "invalid header numbers"
      | _ => throw "invalid header"
    else
      let some (n, _) := header | throw "clause before header"
      let mut clause : CNF.Clause Nat := []
      let mut ended := false
      for token in tokens do
        if ended then throw "tokens after clause terminator"
        let some lit := token.toInt? | throw "invalid literal"
        if lit == 0 then
          ended := true
        else
          if lit.natAbs > n then throw "literal exceeds header bound"
          clause := (lit.natAbs - 1, decide (lit > 0)) :: clause
      if !ended then throw "missing clause terminator"
      clauses := clauses.push clause.reverse
  let some (_, m) := header | throw "missing header"
  if clauses.size != m then throw "wrong clause count"
  return clauses.toList

