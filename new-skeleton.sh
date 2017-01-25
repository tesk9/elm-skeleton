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

duplicateSkeleton ()
{
    mkdir SkeletonTemp
    cp $DIR/skeleton/*.elm SkeletonTemp
    sed -i '' "s/{{NAMESPACE}}/$namespace/" SkeletonTemp/Styles.elm
}

duplicateElmPackage ()
{
    mkdir SkeletonTemp
    cp $DIR/skeleton/elm-package.json SkeletonTemp
    sed -i '' 's/"."/"src"/' SkeletonTemp/elm-package.json
}

createNewProject ()
{
    echo Creating a new project skeleton
    srcPath=$1/src
    addFolder $srcPath

    duplicateSkeleton
    elm-move SkeletonTemp $srcPath
    rm -rf SkeletonTemp

    duplicateElmPackage
    elm-move SkeletonTemp $1
    rm -rf SkeletonTemp
}

addFolder ()
{
  if [ ! -d "$1" ]; then
      echo $1
      mkdir -p $1
      echo
  fi
}

addFeature ()
{
    echo Adding a new feature skeleton
    addFolder $1
    duplicateSkeleton
    elm-move SkeletonTemp $1
    rm -rf SkeletonTemp
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
