#!/bin/bash

set -euxo pipefail

while true
do
    inotifywait -e modify README.md || true
    pandoc -t revealjs -s -o README.html --metadata-file README.yaml README.md
    pandoc -t pdf -s --toc -o README.pdf --metadata-file README.yaml README.md
done
