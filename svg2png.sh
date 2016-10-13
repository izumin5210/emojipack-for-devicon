#!/usr/bin/env bash

set -eu

yaml=$dist/devicon.yaml

echo "title: devicon" > $yaml
echo "emojis:" >> $yaml

for svg in $src/*/*-original.svg
do
    png=$dist/$(echo $svg | awk -F/ '{ print $NF }' | sed -e s/-original\.svg/\.png/)
    name=$(echo $png | awk -F/ '{ print $NF }'g | awk -F. '{ print $1 }')
    inkscape --without-gui --export-width=256 --file=$svg --export-png=$png
    echo "  - name: $name" >> $yaml
    echo "    src: https://raw.githubusercontent.com/izumin5210/emojipack-for-devicon/master$png" >> $yaml
done
