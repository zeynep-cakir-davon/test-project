#!/bin/bash

source ./docker-down.sh

echo "dockercomposesample_su-ear_1 and dockercomposesample_sql-biopro_1 are stopped."

cd deployments/

sudo rm *

cd ..

cd downloaded_packages

sudo rm *

cd ..

echo "Files that downloaded before were removed from deployments and downloaded_packages folders."


VERSION="$1"				#$1= v3.2.XX
FILE="$2"					#$2= su-ear.ear

source gh-dl-release.sh

echo "$VERSION $FILE downloaded in downloded packages."

sudo cp ./downloaded_packages/su-ear.ear ./deployments/su-ear.ear

echo "Downloaded $VERSION $FILE file coppied to deployments folder"

source set-env-with-S3-DB-NAME.sh		#$3(S3)= sql-tek-tesis-xxx-xxx-xxx 	# I wrote 'S3' because '$' sign is not appropriate for a file name. 

source docker-up.sh

docker-up start

