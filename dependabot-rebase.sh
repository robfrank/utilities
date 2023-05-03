#!/bin/bash

prs=$@

for pr in $prs; do
  gh pr comment -b "@dependabot rebase" $pr
done