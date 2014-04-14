#!/usr/bin/env bash

version=$1

if [ "$version" = "" ]; then
    version=$(date -u '+%Y%m%d')
fi
echo "version = $version"

dir="color-theme-radicalized-${version}"

mkdir $dir

cp *.el $dir
sed -i "s/%%version%%/$version/" "$dir/color-theme-radicalized-pkg.el"

tar cf color-theme-radicalized-${version}.tar $dir
