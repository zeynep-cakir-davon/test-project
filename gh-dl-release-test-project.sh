#!/bin/bash
#Source: https://gist.github.com/maxim/6e15aa45ba010ab030c4

#!/usr/bin/env bash
#
# gh-dl-release! It works!
# 
# This script downloads an asset from latest or specific Github release of a
# private repo. Feel free to extract more of the variables into command line
# parameters.
#
# PREREQUISITES
#
# gh
#
# USAGE
#
# Set all the variables inside the script, make sure you chmod +x it, then
# to download specific version to my_app.tar.gz:
#
#     gh-dl-release 2.1.1 my_app.tar.gz
#

if [ $(gh 2>/dev/null | grep -c "Work seamlessly") -eq 0 ];
then
  echo "Please install github cli https://github.com/cli/cli#installation"
  exit 1
fi

if [ -z "$1" ]
  then
    echo "The version argument is not supplied."
    exit 1
fi

if [ -z "$2" ]
  then
    echo "The file name argument is not supplied."
    exit 1
fi


FILE="$2"      # the name of your release asset file, e.g. build.tar.gz
VERSION=$1                       # tag name or the word "latest"
DOWNLOAD_FOLDER="./downloaded_packages/$1"

gh release download $VERSION --pattern $FILE -D $DOWNLOAD_FOLDER -R git@github.com:kayhanogretir/su.git
