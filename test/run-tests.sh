#!/bin/bash

git clone https://github.com/SonarSource/sonar-examples.git

cd sonar-examples/projects/languages/java/sonar-runner/java-sonar-runner-simple

/opt/sonar-runner/bin/sonar-runner -Dsonar.jdbc.url="jdbc:mysql://localhost:3306/sonar?useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true" -Dsonar.jdbc.username=travis -Dsonar.jdbc.password=

if [ 0 -ne $? ]; then
  echo "Sonar-runner exited with error: $?"
  exit 1
fi

# Test sonar project connection
HTTPSTATUS=`curl -s -w "%{http_code}" "http://localhost:9000/dashboard/index/java-sonar-runner-simple" -o /dev/null`
if [ 200 -ne $HTTPSTATUS ]; then
  echo "Unexpected HTTP status code: $HTTPSTATUS"
  exit 1
fi


