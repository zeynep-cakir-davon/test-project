#!/bin/bash

export SU_DB_IMAGE_TAG="$1" #The DB image tag that is required to be run. 

export WILDFLY_IMAGE_VERSION=20210812 #It will only change if su-standalone-full-arge.xml changes. 
export SU_HTTP_PORT=8081 #The http protocol port that will be exposed on local system. 
export SU_HTTPS_PORT=8444 #The https protocol port that will be exposed on local system. 
export SU_DB_PORT=1640 #This is only for DB Client connection for debugging purposes.

echo $SU_DB_IMAGE_TAG
