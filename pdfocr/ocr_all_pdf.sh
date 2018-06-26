#!/bin/bash

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for f in $(find . -iname '*.pdf' 2> /dev/null); do
  if [[ $f = *"- Original.pdf"* ]]; then
    echo "ignoring $f"
  else
    pdfocr2.sh $f
  fi
done
IFS=$SAVEIFS

rm -r /tmp/cuneiform*
