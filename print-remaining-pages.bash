#!/usr/bin/env bash

# Print untranslated page numbers and its percentage by section.

sections=(tutorials setup tasks contribute concepts)

for section in ${sections[@]}; do
    todo=$(grep '/'$section'/' todo.txt | wc -l)
    done=$(grep '/'$section'/' done.txt | wc -l)
    total=$(expr $todo + $done)
    percent=$(expr $todo '*' 100 / $total)
    echo $section ':' $todo '/' $total '(' $percent '%)'
done
