#!/usr/bin/env python3
"""Builds a fake CDN for the content E2E test: content_version 2 in which
one Wortschatz word (de.sein.v) has a different recording (it points at
de.haben.v's real clip), everything else as in content_version 1.

  python3 -I tool/content/make_test_dist.py ../content/dist build/content-test-dist
  node ../content/tools/serve --dir build/content-test-dist --port 8787
"""
import hashlib, json, pathlib, shutil, sys

src, out = pathlib.Path(sys.argv[1]), pathlib.Path(sys.argv[2])
CHANGED, DONOR = 'de.sein.v', 'de.haben.v'
if out.exists():
    shutil.rmtree(out)
out.mkdir(parents=True)
manifest = json.loads((src / 'manifest.json').read_text())
sha = lambda b: hashlib.sha256(b).hexdigest()

def copy(rel):
    (out / rel).parent.mkdir(parents=True, exist_ok=True)
    shutil.copyfile(src / rel, out / rel)

for level in ('a1', 'a2', 'b1', 'b2'):
    copy(manifest['levels'][level]['words']['url'])
lookup = json.loads((src / manifest['lookup']['url']).read_text())
donor = lookup['clips'][DONOR]
copy(donor['url'])
lookup['clips'][CHANGED] = dict(donor)
body = json.dumps(lookup).encode()
(out / 'lookup.test.json').write_bytes(body)
manifest['lookup'] = {'url': 'lookup.test.json', 'sha256': sha(body), 'bytes': len(body), 'count': len(lookup['clips'])}
manifest['content_version'] = 2
(out / 'manifest.json').write_text(json.dumps(manifest))
print(f'{out}: content_version 2, {CHANGED} now plays {DONOR}\'s clip')
