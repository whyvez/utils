#!/usr/bin/env bash

set -o errexit
set -o pipefail

mapfile -t repos < <( gh repo list whyvez --json name --jq .[].name )

for r in "${repos[@]}"; do
    echo "Deleting ${r}... Are you sure you want to continue? [y/n]"
    read ans
    if [[ "$ans" == "y" ]]; then
        gh repo delete "$r" --confirm
    fi
done