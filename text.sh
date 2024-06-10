#!/bin/bash
for file in $(ls)
do
Extension=${file##*.}
case "$Extension" in
  sh) echo "Shell script: $file";;
  md) echo "A markdown file: $file";;
  png) echo "PNG image file: $file";;
  txt) echo "A text file: $file";;
  zip) echo "An archive: $file";;
  conf) echo "A configuration file: $file";;
  py) echo "A Python script: $file";;
  *) echo "Unknown file type: $file";;
esac
done
