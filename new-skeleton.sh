#!/bin/bash

path="$1"
namespace=${path////-}

if [ ! -d "$path" ]; then
    echo Path $path not found. Operation cancelled.
    exit
fi

duplicateSkeleton ()
{
    cp ./skeleton/* $1
}

duplicateElmPackage ()
{
    cp elm-package.json $1
}

createNewProject ()
{
    srcPath=$1/src
    if [ ! -d "$srcPath" ]; then
        mkdir $srcPath
    fi
    duplicateSkeleton $srcPath
    duplicateElmPackage $1

}

addFeature ()
{
    duplicateSkeleton $1
}

echo Creating a new elm skeleton
echo Path: $path
echo Namespace: "$namespace"

echo "Include a new elm-package.json?"
select opt in "Yes" "No"; do
   if [ "$opt" = "Yes" ]; then
    createNewProject $path
    exit
   elif [ "$opt" = "No" ]; then
    addFeature $path
    exit
   else
    echo please enter 1 or 2
   fi
done
