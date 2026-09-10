"""Optional named-table check, separate from the Reidemeister trace checker."""
import importlib.metadata
import json
from pathlib import Path
import spherogram
from check_reidemeister import TARGET, pd_graph, isomorphism

def main():
    version=importlib.metadata.version('spherogram')
    if version!='2.4.1':
        raise SystemExit(f'Expected Spherogram 2.4.1, got {version}')
    pd=spherogram.Link('8_1').PD_code()
    iso=isomorphism(pd_graph(TARGET),pd_graph(pd))
    if iso is None:
        raise RuntimeError('Named table diagram does not match target rotation system with over/under parity')
    report={'status':'PASS','spherogram':version,'named_knot':'8_1','table_PD':pd,
            'plane_orientation':iso[0],
            'scope':'Target PD identification against a pinned external named table; not a Lean isotopy theorem.'}
    print(json.dumps(report,indent=2))

if __name__=='__main__':
    main()
