"""Serialize the high-level Boolean DAG with references to source nodes."""
from pathlib import Path
import json,sys
ROOT=Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT.parent/'solver_lib'))
import z3 as Z
nodes=json.loads((ROOT/'source_nodes.json').read_text())
kind_map={Z.Z3_OP_EQ:'e',Z.Z3_OP_NOT:'n',Z.Z3_OP_DISTINCT:'x',Z.Z3_OP_XOR:'x',
          Z.Z3_OP_AND:'a',Z.Z3_OP_OR:'o',Z.Z3_OP_IMPLIES:'i',Z.Z3_OP_ITE:'t'}
rows=[]
for n in nodes:
    k=n['kind']; args=[i+1 for i in n['children']]
    if k==49167:
        assert n['encoding']>0
        desc=f'v {n["encoding"]-1}'
    elif k in (256,257): desc=f'b c {1 if k==256 else 0}'
    elif k in kind_map: desc='b '+kind_map[k]+' '+' '.join(map(str,args))
    elif k in (2305,2308):
        bound,*weights=n['parameters']
        tag='q' if k==2308 else 'g'
        if not weights: weights=[1]*len(args)
        assert len(weights)==len(args)
        desc=' '.join(map(str,[tag,bound,*[x for a,w in zip(args,weights) for x in (a,w)]]))
    else: raise ValueError(k)
    rows.append(f'{n["encoding"]}|{desc.strip()}')
(ROOT/'source_dag.txt').write_text('\n'.join(rows),encoding='ascii')
roots=json.loads((ROOT/'source_roots.json').read_text())
(ROOT/'source_root_indices.txt').write_text(' '.join(str(r['node']) for r in roots),encoding='ascii')
print('Exported',len(rows),'nodes and',len(roots),'root indices')
