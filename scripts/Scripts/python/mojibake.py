#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.14"
# dependencies = [
#     "ftfy>=6.3.1",
# ]
# ///

import ftfy

print("paste fucked up text:")

text2fix = input()

fixed = ftfy.fix_text(text2fix)

print(fixed)
