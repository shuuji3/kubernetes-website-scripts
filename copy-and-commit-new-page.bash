#!/usr/bin/env bash

# Copy the English page to the Japanese directory for translation.

function usage() {
    echo "$0 <path>"
    echo "  path: page path to copy"
}

if [[ $# != 1 ]]; then
    usage
    exit 1
fi

PATH_EN="content/en/docs/${1}.md"
PATH_JA="content/ja/docs/${1}.md"

# Check any existing Japanese file
if [[ -e $PATH_JA ]]; then
    echo "The copy destination file '$PATH_JA' exists."
    exit 1
fi

cp $PATH_EN $PATH_JA
git add $PATH_JA
git commit -m "Copy ${PATH_EN} for translation"
open $PATH_JA
