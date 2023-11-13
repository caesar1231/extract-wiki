#!/bin/bash

mkdir data
mkdir wiki
echo "Downloading wiki dump..."
curl https://dumps.wikimedia.org/jawiki/latest/jawiki-latest-pages-articles-multistream-index.txt.bz2 -o ./data/wiki-index.txt.bz2
curl https://dumps.wikimedia.org/jawiki/latest/jawiki-latest-pages-articles-multistream.xml.bz2 -o ./data/wiki.xml.bz2
echo "Decompressing wiki dump..."
bzip2 -d ./data/wiki-index.txt.bz2
echo "Done"
