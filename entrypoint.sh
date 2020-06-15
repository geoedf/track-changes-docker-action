#!/bin/bash -l

cd /github/workspace 

changed_files=$(git diff-tree --no-commit-id --name-only -r $GITHUB_SHA)

indx=0
declare -a res

for path in $changed_files
echo "changed file: $path"
do
  if [ `basename $path` != $path ]
  then
      val=$(echo $path | tr "/" "\n" | head -1)
      if [ $val != '.github' ]
      then
         if [[ ! " ${res[@]} " =~ " ${val} " ]];
         then
           res[indx]=$val
           ((indx++))
         fi
      fi
  fi
done
echo "::set-output name=folders::${res[*]}"
