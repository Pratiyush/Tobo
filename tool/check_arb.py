#!/usr/bin/env python3
"""Checks every lib/l10n/app_*.arb against the English template.

Same keys, same {placeholders}, ICU plurals keep an `other` branch, no empty
strings, the brand name left in Latin letters. Exit code 1 on any problem.
Run: python3 tool/check_arb.py
"""
import glob, json, re, sys

L10N = 'lib/l10n'
BRAND = 'Wortschatz'
en = json.load(open(f'{L10N}/app_en.arb', encoding='utf-8'))
keys = {k for k in en if not k.startswith('@')}

def placeholders(s):
    # Top-level {name} and the selector of {name, plural|select, ...}.
    return set(re.findall(r'\{([A-Za-z_][A-Za-z0-9_]*)(?:\}|,\s*(?:plural|select))', s))

problems = []
for path in sorted(glob.glob(f'{L10N}/app_*.arb')):
    if path.endswith('app_en.arb'):
        continue
    arb = json.load(open(path, encoding='utf-8'))
    have = {k for k in arb if not k.startswith('@')}
    name = path.rsplit('/', 1)[1]
    for k in sorted(keys - have):
        problems.append(f'{name}: missing {k}')
    for k in sorted(have - keys):
        problems.append(f'{name}: unknown key {k}')
    for k in sorted(keys & have):
        v, e = arb[k], en[k]
        if not isinstance(v, str) or not v.strip():
            problems.append(f'{name}: {k} is empty')
            continue
        if placeholders(v) != placeholders(e):
            problems.append(f'{name}: {k} placeholders {sorted(placeholders(v))} != {sorted(placeholders(e))}')
        if 'plural,' in e and 'other{' not in v.replace(' ', ''):
            problems.append(f'{name}: {k} plural lacks other')
        if '‎' in v or '‏' in v or '‪' in v or '‫' in v:
            problems.append(f'{name}: {k} has invisible bidi marks')
        if BRAND in e and BRAND not in v:
            problems.append(f'{name}: {k} must keep the brand "{BRAND}"')

print('\n'.join(problems) or f'OK: {len(glob.glob(L10N + "/app_*.arb"))} ARB files match the template')
sys.exit(1 if problems else 0)
