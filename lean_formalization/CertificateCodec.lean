import Lean

/- The decoder is a total pure Lean function. Its output is still checked by
   Std's sound LRAT checker. Compression is not an extra logical assumption. -/
namespace Stick81

def hexNibble (b : UInt8) : Nat :=
  if b.toNat ≤ 57 then b.toNat - 48 else b.toNat - 87

def fromHex (s : String) : ByteArray := Id.run do
  let input := s.toUTF8
  let mut out := ByteArray.emptyWithCapacity (input.size / 2)
  for i in [:input.size / 2] do
    out := out.push (UInt8.ofNat (16 * hexNibble input[2*i]! + hexNibble input[2*i+1]!))
  return out

def extendedLength (input : ByteArray) (pos base : Nat) : Except String (Nat × Nat) := do
  if base != 15 then return (base, pos)
  let mut n := base
  let mut p := pos
  for _ in [:input.size] do
    if p ≥ input.size then throw "truncated length"
    let b := input[p]!.toNat
    p := p + 1
    n := n + b
    if b < 255 then return (n,p)
  throw "unterminated length"

def decompressLZ4 (input : ByteArray) (expected : Nat) : Except String ByteArray := do
  let mut pos := 0
  let mut out := ByteArray.emptyWithCapacity expected
  for _ in [:input.size] do
    if pos ≥ input.size then break
    let token := input[pos]!.toNat
    pos := pos + 1
    let (len,p) ← extendedLength input pos (token / 16)
    pos := p
    if pos + len > input.size || out.size + len > expected then throw "literal overflow"
    for j in [:len] do out := out.push input[pos+j]!
    pos := pos + len
    if pos == input.size then break
    if pos + 2 > input.size then throw "truncated offset"
    let offset := input[pos]!.toNat + 256 * input[pos+1]!.toNat
    pos := pos + 2
    if offset == 0 || offset > out.size then throw "invalid back reference"
    let (len,p) ← extendedLength input pos (token % 16)
    pos := p
    if out.size + len + 4 > expected then throw "match overflow"
    for _ in [:len+4] do out := out.push out[out.size-offset]!
  if pos != input.size || out.size != expected then throw "wrong decompressed size"
  return out

end Stick81

open Lean Elab Term in
elab "embed_text% " path:str : term => do
  let text ← IO.FS.readFile path.getString
  return mkStrLit text
