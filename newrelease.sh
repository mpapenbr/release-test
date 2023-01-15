#! /bin/bash

step="$1"
if [ -z "$1" ]
then
  step=patch
fi

if [ "$2" ]
then
  suffix=-"$2"
fi

NEW_VERSION=$(./nextver.sh $1)$suffix
echo "MY_VERSION=$NEW_VERSION" > version.sh

# push the new version to the master
git add version.sh
git commit -m "Release v$NEW_VERSION"
git push
git tag v$NEW_VERSION -m "tag $NEW_VERSION"
git push origin v$NEW_VERSION


