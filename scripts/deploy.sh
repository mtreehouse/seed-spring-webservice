#!/bin/bash

REPOSITORY=/home/ec2-user/app/step2
PROJECT_NAME=spring-webservice

echo "> Build File Copy"
cp $REPOSITORY/zip/*.jar $REPOSITORY/
echo "> Checking Application PID Running.."

CURRENT_PID=$(pgrep -fl springboot-webservice | awk '{print $1}')

echo "Currently Running APP PID : $CURRENT_PID"

if [ -z "$CURRENT_PID" ]; then
  echo "> There is No Running App"
else
    echo "> kill -15 $CURRENT_PID"
    kill -15 $CURRENT_PID
    sleep 5
fi

echo "> Deploy New Application"

JAR_NAME=$(ls -tr $REPOSITORY/*.jar | tail -n 1)

echo "> JAR_NAME: $JAR_NAME"

echo "> Grant Excute to JAR_NAME"

chmod +x $JAR_NAME

echo "> Run $JAR_NAME"

nohup java -jar \
  -Dspring.config.location=classpath:/application.properties,classpath:/application-real.properties,/home/ec2-user/app/application-oauth.properties,/home/ec2-user/app/application-real-db.properties \
  -Dspring.profiles.active=real \
  $JAR_NAME > $REPOSITORY/nohup.out 2>&1 &