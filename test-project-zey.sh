#!/bin/bash

source ./docker-down.sh

echo "dockercomposesample_su-ear_1 and dockercomposesample_sql-biopro_1 are stopped."

cd downloaded_packages

VERSION="$1"

if [ ! -d $VERSION ]; then
  mkdir -p $VERSION;
fi

if [ -s $VERSION ]; then
	echo "The $VERSION directory exists and it is empty."
	cd ..;
fi

source gh-dl-release-test-project.sh $1 $2				#$1= v3.2.XX 		#$2= su-ear.ear

echo "$VERSION $FILE downloaded in downloded_packages/$VERSION"

sudo cp ./downloaded_packages/$VERSION/su-ear.ear ./deployments/su-ear.ear

echo "Downloaded $VERSION $FILE file coppied to deployments folder"

source set-env-with-S3-DB-NAME.sh		#$3(S3)= sql-tek-tesis-xxx-xxx-xxx 	# I wrote 'S3' because '$' sign is not appropriate for a file name. 

source docker-up.sh

docker-up start

