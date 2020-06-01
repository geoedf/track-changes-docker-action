#!/bin/sh -l

cd /github/workspace 

echo `git diff-tree --no-commit-id --name-only -r $GITHUB_SHA`
