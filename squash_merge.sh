#!/bin/bash

prs=$@

for pr in $prs; do
  gh pr merge -s $pr
done