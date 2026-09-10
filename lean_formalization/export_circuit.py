"""Export data, not a proof oracle: Lean checks the whole CNF correspondence."""
from pathlib import Path
import json,hashlib
ROOT=Path(__file__).resolve().parent
data=json.loads((ROOT.parent/'roof_direct_gates.json').read_text(encoding='utf-8'))
ops={'and':'a','eq':'e','majority':'m'}
lines=[]
for g in data['gates']:
    lines.append(' '.join(map(str,[g['out']-1,ops[g['op']],*g['args']])))
(ROOT/'gates.txt').write_text('\n'.join(lines),encoding='ascii')
(ROOT/'roots.txt').write_text(' '.join(map(str,[1,*[r['literal'] for r in data['roots']]])),encoding='ascii')
(ROOT/'input_map.json').write_text(json.dumps({k:v-1 for k,v in data['variables'].items()},indent=2))
report={'gates':len(lines),'roots_including_constant':len(data['roots'])+1,
        'source_sha256':hashlib.sha256((ROOT.parent/'roof_direct_gates.json').read_bytes()).hexdigest()}
(ROOT/'circuit_export.json').write_text(json.dumps(report,indent=2))
print(json.dumps(report))
