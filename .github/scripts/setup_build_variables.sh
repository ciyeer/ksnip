#!/bin/bash

export VERSION_REGEX="([0-9]{1,}\.)+[0-9]{1,}"
export BUILD_TIME=$(date +"%a, %d %b %Y %T %z")
export BUILD_DATE=$(date  +"%a %b %d %Y")
export BUILD_NUMBER=$(git rev-list --count HEAD)-$(git rev-parse --short HEAD)
export VERSION_NUMBER=$(grep "project.*" CMakeLists.txt | egrep -o "${VERSION_REGEX}")
export VERSION_SUFFIX="continuous"
export WORKSPACE="$GITHUB_WORKSPACE"
export INSTALL_PREFIX="$WORKSPACE/tmp"

# Store variables in files that is shared among runners.
echo "BUILD_TYPE=Release" >> $GITHUB_ENV
echo "BUILD_TIME=$BUILD_TIME" >> $GITHUB_ENV
echo "BUILD_DATE=$BUILD_DATE" >> $GITHUB_ENV
echo "BUILD_NUMBER=$BUILD_NUMBER" >> $GITHUB_ENV
echo "WORKSPACE=$WORKSPACE" >> $GITHUB_ENV
echo "INSTALL_PREFIX=$INSTALL_PREFIX" >> $GITHUB_ENV
echo "VERSION_NUMBER=$VERSION_NUMBER" >> $GITHUB_ENV
echo "VERSION_SUFFIX=$VERSION_SUFFIX" >> $GITHUB_ENV
echo "VERSION=${VERSION_NUMBER}-${VERSION_SUFFIX}" >> $GITHUB_ENV

echo "UPLOADTOOL_ISPRERELEASE=true" >> $GITHUB_ENV
