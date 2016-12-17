#!/bin/bash

# current directory stuff from http://stackoverflow.com/a/246128
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

path="$1"
namespace=${path////-}
module_prefix=${path////.}

if [ ! -d "$path" ]; then
    echo Path $path not found. Operation cancelled.
    exit
fi

prefixModuleNames ()
{
  for elmfile in "$1/*.elm"
  do
    sed -i '' "s/module /module $module_prefix./g" $elmfile
    # TODO: Clean up these replacements.
    sed -i '' "s/import Flags/import $module_prefix.Flags as Flags/g" $elmfile
    sed -i '' "s/import Model/import $module_prefix.Model as Model/g" $elmfile
    sed -i '' "s/import Styles/import $module_prefix.Styles as Styles/g" $elmfile
    sed -i '' "s/import Update/import $module_prefix.Update as Update/g" $elmfile
    sed -i '' "s/import View/import $module_prefix.View as View/g" $elmfile

  done
}


duplicateSkeleton ()
{
    echo Copying skeleton to path: $1
    cp $DIR/skeleton/* $1
    sed -i '' "s/{{NAMESPACE}}/$namespace/" $1/Styles.elm
}

duplicateElmPackage ()
{
    echo Copying elm-package.json to path: $1
    cp $DIR/elm-package.json $1
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
    prefixModuleNames $1
}

echo Creating a new elm skeleton
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
