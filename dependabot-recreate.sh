#!/bin/bash

prs=$@

for pr in $prs; do
  gh pr comment -b "@dependabot recreate" $pr
done