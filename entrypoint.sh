#!/bin/sh -l

res = $(git diff-tree --no-commit-id --name-only -r $GITHUB_SHA)

echo $res
