#!/usr/bin/env bash

function usage() {
    echo "$0 <base-dir>"
    echo "  base-dir: kubernetes/website root directory"
}

if [[ $# != 1 ]]; then
    usage
    exit 1
fi

base_dir=$1; shift
cd $base_dir/content

for page in $(find en/docs/ -type f); do
    ja=$(echo $page | sed -e 's/^en/ja/')
    if [[ -f $ja ]]; then
        echo -n 'DONE '
    else
        echo -n 'TODO '
    fi
    echo $ja
done | grep -v '/reference/' | egrep '.md$'
