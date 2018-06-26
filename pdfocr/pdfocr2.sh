#!/bin/bash

set -e

minimumsize=1024

input="$1"
output="$1.output.pdf"

tmpdir="$(mktemp -d)"

trap "{ rm -rf -- "$tmpdir"; }" EXIT

pdftotext "$input"  "$tmpdir/contents.txt"
filesize=$(stat -c%s "$tmpdir/contents.txt")

if [ $filesize -le $minimumsize ]; then

   echo "$input ocring..."

   gs -SDEVICE=tiff24nc -r300x300 -sOutputFile="$tmpdir/page-%04d.tiff" -dNOPAUSE -dBATCH -- "$input"

   for page in "$tmpdir"/page-*.tiff
   do
       base="${page%.tiff}"
       cuneiform -f hocr -o "$base.html" "$page"
       hocr2pdf -i "$page" -o "$base.pdf" < "$base.html"
   done

   gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile="$output" "$tmpdir"/page-*.pdf

   mv "$input" "$input - Original.pdf"
   mv "$output" "$input"

else
   echo "$input contains ocr-text in size $filesize"

fi

rm -rf -- "$tmpdir"

