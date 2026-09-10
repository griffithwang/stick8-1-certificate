"""Reproducible local builds with explicit modules, logs, and source hashes."""
from pathlib import Path
import argparse,subprocess,os,sys,json,hashlib,time,shutil
sys.stdout.reconfigure(encoding='utf-8',errors='backslashreplace')
ROOT=Path(__file__).resolve().parent
BIN=ROOT.parent/'lean_toolchain'/'lean-4.19.0-windows'/'bin'
if os.environ.get('LEAN_BIN'):
    BIN=Path(os.environ['LEAN_BIN']).resolve()
elif not BIN.exists():
    found=shutil.which('lean')
    if not found: raise SystemExit('Install Lean 4.19.0 or set LEAN_BIN to its bin directory.')
    BIN=Path(found).resolve().parent
SUFFIX='.exe' if os.name=='nt' else ''
PURE={'CertificateCodec','CNFParser','FixedCertificate','PBCrossings','PBA2'}
ORDER=['CertificateCodec','CNFParser','FixedCertificate','Geometry','ProjectiveAlgebra','Wheel','SignRules','Circuit','CircuitData','CircuitExclusion','Counter','CounterBV','LocalReduction','SourceLinks','SourceSemantics','Expression','Permutation4','GeometricInput','ChiGeometry','RoofFrame','RoofPositivity','MixedSigns','HomogeneousAcyclic','ProjectedAcyclic','HeightPlanes','LineDefinitions','LineGeometry','HeightExpressions','FourHeight','MinorProducts','FiveHeight','LineGPGeometry','LineRelations','SourceData','PointGP','LineGP','LineBracket','LineIncidence','AcyclicRoots','ProjectedAcyclicRoots','NormalizationRoot','BasicRoots','FourHeightRoots','FiveHeightRoots','AlgebraicRoots','PBCrossings','PBA2','PBGlobalCrossings','PBGlobalA2Fast','SourceCorrect','Topology','FormalAudit']
ORDER.insert(ORDER.index('LineGPGeometry'),'CrossingGeometry')
ORDER.insert(ORDER.index('LineGPGeometry'),'CrossingOrder')
ORDER.insert(ORDER.index('LineGPGeometry'),'SegmentCrossing')
ORDER.insert(ORDER.index('PBCrossings'),'DirectionRoots')
ORDER.insert(ORDER.index('PBCrossings'),'OrderRoots')
ORDER.extend(['SubmissionTheorem','SubmissionAudit'])
ALLOWED=ORDER+['PBGlobalA2']

def main():
    ap=argparse.ArgumentParser()
    ap.add_argument('modules',nargs='*',default=ORDER)
    args=ap.parse_args()
    out=ROOT/'build_logs'; out.mkdir(exist_ok=True)
    env=os.environ.copy(); env['PATH']=str(BIN)+os.pathsep+env['PATH']; env['LEAN_PATH']=str(ROOT)
    manifest=out/'manifest.json'
    records=json.loads(manifest.read_text(encoding='utf-8')) if manifest.exists() else {}
    for name in args.modules:
        if name not in ALLOWED: raise ValueError(name)
        source=ROOT/(name+'.lean')
        cwd=ROOT if name in PURE else ROOT/'mathlib'
        command=[str(BIN/('lean'+SUFFIX)),'--root='+str(ROOT),'-o',str(ROOT/(name+'.olean')),str(source)]
        if name not in PURE: command=[str(BIN/('lake'+SUFFIX)),'env',*command]
        start=time.monotonic()
        run=subprocess.run(command,cwd=cwd,env=env,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,
                           creationflags=getattr(subprocess,'CREATE_NO_WINDOW',0))
        output=run.stdout.decode('utf-8',errors='replace')
        (out/(name+'.log')).write_text(output,encoding='utf-8')
        records[name]={'exit_code':run.returncode,'seconds':time.monotonic()-start,
                       'source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),
                       'command':command,'cwd':str(cwd)}
        manifest.write_text(json.dumps(records,indent=2),encoding='utf-8')
        print(f'{name}: exit {run.returncode}, {records[name]["seconds"]:.2f}s',flush=True)
        if run.returncode:
            print('\n'.join(output.splitlines()[-25:]),flush=True)
            sys.exit(run.returncode)
        if output.strip(): print(output.strip(),flush=True)

if __name__=='__main__': main()
