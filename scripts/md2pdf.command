#!/bin/bash

cd -- "$(dirname "$0")"
if hash pandoc 2>/dev/null; then
    for f in *.md
    do
        fname="${f%.*}"
        pandoc -s -V geometry:margin=1in -o $fname.pdf $fname.md
    done
else
    echo "pandoc is not installed"
fi
