"""Fetch immutable release assets and verify bytes before installing them."""
from pathlib import Path
import argparse
import hashlib
import json
import re
import urllib.request

ROOT = Path(__file__).resolve().parent

def digest(path):
    h = hashlib.sha256()
    with path.open('rb') as f:
        for block in iter(lambda: f.read(1024 * 1024), b''):
            h.update(block)
    return h.hexdigest()

def main():
    p = argparse.ArgumentParser()
    p.add_argument('--repository', required=True)
    p.add_argument('--tag', required=True)
    args = p.parse_args()
    if not re.fullmatch(r'[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+', args.repository):
        raise SystemExit('Expected OWNER/REPOSITORY')
    if not re.fullmatch(r'[A-Za-z0-9_.-]+', args.tag):
        raise SystemExit('Use a simple immutable release tag')
    for row in json.loads((ROOT / 'ASSETS.json').read_text())['assets']:
        target = (ROOT / row['path']).resolve()
        if not target.is_relative_to(ROOT):
            raise SystemExit('Asset path escapes repository')
        if target.exists():
            if digest(target) != row['sha256']:
                raise SystemExit(f'Existing asset differs; refusing to overwrite {target.name}')
            print('Already verified:', row['path'])
            continue
        target.parent.mkdir(parents=True, exist_ok=True)
        tmp = target.with_suffix(target.suffix + '.download')
        url = f'https://github.com/{args.repository}/releases/download/{args.tag}/{row["name"]}'
        urllib.request.urlretrieve(url, tmp)
        if tmp.stat().st_size != row['bytes'] or digest(tmp) != row['sha256']:
            raise SystemExit(f'Asset verification failed: {row["name"]}; partial file retained')
        tmp.replace(target)
        print('Downloaded and verified:', row['path'])

if __name__ == '__main__':
    main()
