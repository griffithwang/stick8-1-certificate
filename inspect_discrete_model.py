"""Decode a Boolean sign candidate and check its abstract diagram planarity."""
from pathlib import Path
import json
from export_obstruction_smt import parity
from sign_cells import expand_reduced,diagram_from_signs,conway_a2,conway_a2_pair_sum
from check_reidemeister import pd_graph
from itertools import combinations
from sign_cells import adjacent

ROOT = Path(__file__).resolve().parent


def gauss_pd(visits):
    labels = {}
    signs = {}
    m = len(visits)
    for k,(c,over,s) in enumerate(visits):
        labels[c,over] = ((k-1)%m+1,k+1)
        signs[c] = s
    pd = []
    for c in sorted(signs):
        ui,uo = labels[c,False]
        oi,oo = labels[c,True]
        pd.append([ui,oi,uo,oo] if signs[c] < 0 else [ui,oo,uo,oi])
    return pd


def diagram_genus(pd):
    graph = pd_graph(pd)
    remaining = set(graph)
    faces = 0
    while remaining:
        u = next(iter(remaining))
        while u in remaining:
            remaining.remove(u)
            c,i = graph[u]
            u = (c,(i+1)%4)
        faces += 1
    return (2+len(pd)-faces)//2,faces


def decode(signs):
    model = {tuple(key):1 if value else -1 for key,value in signs}
    def v4(*key):
        return parity(key)*model[('V',*sorted(key))]
    def orient(i,j,k):
        return v4(i,j,k,9)
    reduced = {('T',*key):orient(*key) for key in combinations(range(9),3)}
    for i,j in combinations(range(9),2):
        if adjacent(i,j,9):
            continue
        reduced['D',i,j] = orient(i,(i+1)%9,(j+1)%9)
        reduced['H',i,j] = v4(i,(i+1)%9,j,(j+1)%9)
    reduced.update({key:value for key,value in model.items() if key[0] == 'C'})
    visits = diagram_from_signs(expand_reduced(reduced,9),9)
    return visits,gauss_pd(visits)


def main():
    data = json.loads((ROOT/'discrete_relaxation_result.json').read_text())
    if data['result'] != 'sat':
        print('No SAT model to inspect.')
        return
    visits,pd = decode(data['signs'])
    # A Boolean model need not be planar, so smoothing sums can be odd.
    # The formal pair sum is still the quantity constrained in the relaxation.
    a2 = conway_a2_pair_sum(visits)
    assert 2*a2 == data['twice_a2']
    genus,faces = diagram_genus(pd)
    result = {'crossings':len(pd),'formal_pair_sum':a2,'rotation_system_genus':genus,'faces':faces,
              'PD':pd,'scope':'Abstract sign model only. No coordinate realization is established.'}
    if genus == 0:
        assert conway_a2(visits) == a2
        try:
            import snappy
            result['numerical_census_matches'] = [str(x) for x in snappy.Link(pd).exterior().identify()]
        except Exception as exc:
            result['identification_error'] = str(exc)
    (ROOT/'discrete_model_diagram.json').write_text(json.dumps(result,indent=2))
    print(json.dumps(result))


if __name__ == '__main__':
    main()
