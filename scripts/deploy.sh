#!/bin/bash

REPOSITORY=/home/ec2-user/app/step2
PROJECT_NAME=spring-webservice

echo "> Build File Copy"
cp $REPOSITORY/zip/*.jar $REPOSITORY/
echo "> Checking Application PID Running.."

CURRENT_PID=$(pgrep -fl springboot-webservice | grep jar | awk '{print $1}')

echo "Currently Running APP PID : $CURRENT_PID"