#!/bin/bash

path="$1"
namespace=${path////-}

if [ ! -d "$path" ]; then
    echo $path not found. Operation cancelled.
    exit
fi

duplicateSkeleton ()
{
    cp ./skeleton/* $path
}


echo Creating a new elm skeleton
echo Path: $path
echo Namespace: "$namespace"

echo "Include a new elm-package.json?"
select opt in "Yes" "No"; do
   if [ "$opt" = "Yes" ]; then
    duplicateSkeleton
    echo TODO
    exit
   elif [ "$opt" = "No" ]; then
    duplicateSkeleton
    exit
   else
    echo please enter 1 or 2
   fi
done
