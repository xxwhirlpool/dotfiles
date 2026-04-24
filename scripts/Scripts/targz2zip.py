#!/usr/bin/env -S uv run --script
#
# by someone on stackoverflow:
# https://stackoverflow.com/questions/6301885/convert-tar-gz-to-zip/43940597#43940597

import sys, tarfile, zipfile, glob

def convert_one_archive(file_name):
    out_file = file_name.replace('.tar.gz', '.zip')
    with tarfile.open(file_name, mode='r:gz') as tf:
        with zipfile.ZipFile(out_file, mode='a', compression=zipfile.ZIP_DEFLATED) as zf:
            for m in tf.getmembers():
                f = tf.extractfile( m )
                fl = f.read()
                fn = m.name
                zf.writestr(fn, fl)

for f in glob.glob('*.tar.gz'):
    convert_one_archive(f)
