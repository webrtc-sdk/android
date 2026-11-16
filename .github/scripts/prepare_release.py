#!/usr/bin/env python3
"""Bump the android repository to a new WebRTC release.

    prepare_release.py --version 150.7871.08 [--commit <webrtc sha>] \
        [--webrtc-repo webrtc-sdk/webrtc] [--date 2026.11.16]

Updates VERSION_NAME in gradle.properties, the dependency versions in
README.md and adds a CHANGES.md entry.
"""

import argparse
import datetime
import os
import re

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
ARTIFACTS = ['android', 'android-prefixed', 'android-prefixed-stripped']


def sub(path: str, pattern: str, repl: str, count: int = 1, flags=0):
    with open(path) as f:
        text = f.read()
    new, n = re.subn(pattern, repl, text, count=count, flags=flags)
    if n == 0:
        raise SystemExit(f'{os.path.basename(path)}: pattern not found: {pattern}')
    with open(path, 'w', newline='\n') as f:
        f.write(new)


def main():
    p = argparse.ArgumentParser(description=__doc__.split('\n')[0])
    p.add_argument('--version', required=True)
    p.add_argument('--commit', default='', help='webrtc commit the binaries were built from')
    p.add_argument('--webrtc-repo', default='webrtc-sdk/webrtc')
    p.add_argument('--date', default=datetime.date.today().strftime('%Y.%m.%d'))
    args = p.parse_args()

    v = args.version
    if not re.fullmatch(r'\d+\.\d+\.\d+', v):
        raise SystemExit(f'invalid version {v!r}')
    path = lambda name: os.path.join(ROOT, name)

    sub(path('gradle.properties'), r'^VERSION_NAME=.*$', f'VERSION_NAME={v}', flags=re.M)
    for artifact in ARTIFACTS:
        sub(path('README.md'), rf"(io\.github\.webrtc-sdk:{re.escape(artifact)}:)[0-9.]+", rf'\g<1>{v}', count=0)

    milestone, branch, patch = v.split('.')
    entry = f'[{v}] - {args.date}\n\n* Upgrade to WebRTC-SDK M{milestone}.{branch}.{patch}\n\n'
    if args.commit:
        entry += f'Corresponds to https://github.com/{args.webrtc_repo}/commit/{args.commit}\n\n'
    sub(path('CHANGES.md'), r'(-{10,}\n)', rf'\g<1>{entry}')


if __name__ == '__main__':
    main()
