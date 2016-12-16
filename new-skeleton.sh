#!/bin/bash

current_location="`dirname \"$0\"`"              # relative
current_location="`( cd \"$current_location\" && pwd )`"  # absolutized and normalized

path="$1"
namespace=${path////-}

if [ ! -d "$path" ]; then
    echo Path $path not found. Operation cancelled.
    exit
fi

duplicateSkeleton ()
{
    echo Copying skeleton to path: $1
    cp $current_location/skeleton/* $1
    sed -i '' "s/{{NAMESPACE}}/$namespace/" $1/Styles.elm
}

duplicateElmPackage ()
{
    echo Copying elm-package.json to path: $1
    cp $current_location/elm-package.json $1
    sed -i '' 's/skeleton/src/' $1/elm-package.json
}

createNewProject ()
{
    echo Creating a new project skeleton
    srcPath=$1/src
    if [ ! -d "$srcPath" ]; then
        mkdir $srcPath
    fi
    duplicateSkeleton $srcPath
    duplicateElmPackage $1
}

addFeature ()
{
    echo Adding a new feature skeleton
    duplicateSkeleton $1
}

echo Creating a new elm skeleton
echo "* * *"
echo Path: $path
echo Namespace: "$namespace"

echo Are the path and namespace correct?
select opt in "Yes" "No"; do
   if [ "$opt" = "Yes" ]; then
    break
   else
    echo Operation cancelled.
    exit
   fi
done

echo Include a new elm-package.json?
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
