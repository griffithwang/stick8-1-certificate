"""Export local source/circuit witnesses; Lean must verify their validity."""
from pathlib import Path
import sys,json,hashlib,collections
ROOT=Path(__file__).resolve().parent
sys.path[:0]=[str(ROOT.parent),str(ROOT.parent/'solver_lib')]
import z3 as Z
from roof_boolean import build
from direct_cnf import Encoder

def main():
    variables,groups,*_=build()
    encoder=Encoder()
    roots=[(group,e,encoder.encode(e)) for group,es in groups.items() for e in es]
    fixed=json.loads((ROOT.parent/'roof_direct_gates.json').read_text(encoding='utf-8'))
    assert encoder.gates == fixed['gates']
    assert encoder.variables == fixed['variables']
    assert [r for _,_,r in roots] == [r['literal'] for r in fixed['roots']]
    nodes=[]; indices={}
    def visit(e):
        if e.get_id() in indices: return indices[e.get_id()]
        children=[visit(c) for c in e.children()]
        i=len(nodes); indices[e.get_id()]=i
        nodes.append({'index':i,'kind':e.decl().kind(),'children':children,
                      'encoding':encoder.memo[e.get_id()],
                      'parameters':e.params() if hasattr(e,'params') else [],
                      'name':str(e.decl().name()) if Z.is_const(e) else None})
        return i
    for _,e,_ in roots: visit(e)
    (ROOT/'source_nodes.json').write_text(json.dumps(nodes,indent=2),encoding='utf-8')
    (ROOT/'source_roots.json').write_text(json.dumps(
        [{'group':g,'node':indices[e.get_id()],'literal':lit} for g,e,lit in roots],indent=2))
    byout={g['out']:(i,g) for i,g in enumerate(encoder.gates)}
    kinds={Z.Z3_OP_NOT:'n',Z.Z3_OP_AND:'a',Z.Z3_OP_OR:'o',Z.Z3_OP_EQ:'e',
           Z.Z3_OP_DISTINCT:'x',Z.Z3_OP_XOR:'x',Z.Z3_OP_IMPLIES:'i',Z.Z3_OP_ITE:'t'}
    rows=[]; links=[]; skipped=[]; histogram=collections.Counter()
    for node in nodes:
        k=node['kind']; out=node['encoding']
        args=[nodes[j]['encoding'] for j in node['children']]
        if k in kinds: op=kinds[k]; payload=args
        elif k==Z.Z3_OP_UNINTERPRETED: op='v'; payload=[out]
        elif k==Z.Z3_OP_TRUE: op='c'; payload=[1]
        elif k==Z.Z3_OP_FALSE: op='c'; payload=[0]
        else:
            skipped.append(node['index']); continue
        boundary=sorted({abs(a) for a in (payload if op!='c' else [])}-{1})
        assert len(boundary)<=8
        cut=set(boundary)|{1}
        used=set()
        def collect(v):
            if v in cut: return
            gi,g=byout[v]
            if gi in used: return
            for a in g['args']: collect(abs(a))
            used.add(gi)
        collect(abs(out))
        gids=sorted(used)
        ids=[i-1 for i in boundary]+[0]*(8-len(boundary))
        row='|'.join([' '.join(map(str,ids)),' '.join(map(str,gids)),str(out),
                      ' '.join(map(str,[op,*payload]))])
        links.append({'source_node':node['index'],'link_row':len(rows),
                      'gates':len(gids),'boundary':len(boundary)})
        rows.append(row); histogram[len(gids)]+=1
    (ROOT/'source_links.txt').write_text('\n'.join(rows),encoding='ascii')
    (ROOT/'source_link_index.json').write_text(json.dumps(links,indent=2))
    report={'source_nodes':len(nodes),'boolean_links':len(rows),'non_boolean_nodes':skipped,
            'local_gate_histogram':dict(sorted(histogram.items())),
            'source_sha256':hashlib.sha256((ROOT.parent/'roof_boolean.py').read_bytes()).hexdigest(),
            'scope':'Export only. Each local link still requires a proved-sound Lean check.'}
    (ROOT/'source_export.json').write_text(json.dumps(report,indent=2))
    print(json.dumps(report))

if __name__=='__main__': main()
