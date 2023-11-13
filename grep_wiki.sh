#!/bin/bash

INDEX_FILE="./data/wiki-index.txt"
WIKI_FILE="./data/wiki.xml.bz2"

lines=$(grep -n "$1" "$INDEX_FILE")
if [ -z "$lines" ]; then
  echo "No such term"
  exit 1
fi

# ask to select the line
echo "Please select the line number"
IFS=$'\n'
select line in $lines; do
  break
done

if [ -z "$line" ]; then
  echo "No such line"
  exit 1
fi

# split the line by ':'
IFS=:
set -- $line
line_number=$1
block_number=$2
article_id=$3

echo "calculating file size..."
IFS=$'\n'
tail -n +"$line_number" "$INDEX_FILE" | while IFS=: read -r current_block _ _; do
  if [ "$current_block" -gt "$block_number" ]; then
    block_size=$(( current_block - block_number ))
    echo "offset: $block_number"
    echo "file_size: $block_size"
    echo "article_id: $article_id"

    python3 extract_article.py "$block_number" "$block_size" "$article_id" "$WIKI_FILE"
    break
  fi
done
