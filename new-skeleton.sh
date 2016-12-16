#!/bin/bash

pathString="$1"
namespace=${pathString////-}

echo Creating a new elm skeleton
echo Path: $pathString
echo Namespace: "$namespace"

echo "Include a new elm-package.json?"
select opt in "Yes" "No"; do
   if [ "$opt" = "Yes" ]; then
    echo TODO
    exit
   elif [ "$opt" = "No" ]; then
    echo TODO
    exit
   else
    echo please enter 1 or 2
   fi
done
