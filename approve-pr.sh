#!/bin/bash

label="dependency_approved"
prs=$@

for pr in $prs; do
  gh pr review --approve $pr
  gh pr edit --remove-label $label $pr
  gh pr edit --add-label $label $pr
done