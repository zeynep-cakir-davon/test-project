#!/bin/bash

source ./docker-down.sh

echo "dockercomposesample_su-ear_1 and dockercomposesample_sql-biopro_1 are stopped."

cd deployments/

sudo rm *

cd ..

cd downloaded_packages

VERSION="$1"
FILE="$2"

if [ -d $VERSION ]; 
then
	echo "The $VERSION directory exists."
else
	echo "The $VERSION directory does not exists"
fi




if [ ! -d $VERSION ]; then
  mkdir -p $VERSION;
  echo "The $VERSION directory created."

fi

cd $VERSION


	if [ ! -d $FILE ]
	cd ..
	cd ..
	source gh-dl-release-test-project.sh $1 $2				#$1= v3.2.XX 		#$2= su-ear.ear
	source set-env-with-S3-DB-NAME.sh		#$3(S3)= sql-tek-tesis-xxx-xxx-xxx 	# I wrote 'S3' because '$' sign is not appropriate for a file name. 
	then 
		echo "The $FILE file downloaded in downloded_packages/$VERSION"
		sudo cp ./downloaded_packages/$VERSION/su-ear.ear ./deployments/su-ear.ear
	else 
		echo "The $FILE exists in downloaded_packages/$VERSION"
		sudo cp ./downloaded_packages/$VERSION/su-ear.ear ./deployments/su-ear.ear
		echo "The $FILE file coppied to deployments folder"
	fi


 

source docker-up.sh

docker-up start
