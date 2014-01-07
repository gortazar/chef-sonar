#!/bin/bash

git clone https://github.com/SonarSource/sonar-examples.git

cd sonar-examples/projects/languages/java/sonar-runner/java-sonar-runner-simple

/opt/sonar-runner/bin/sonar-runner -Dsonar.jdbc.url="jdbc:mysql://localhost:3306/sonar?useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true" -Dsonar.jdbc.username=travis -Dsonar.jdbc.password=

if [ 0 -ne $? ]; then
  echo "Sonar-runner exited with error: $?"
  exit 1
fi

# Test sonar project connection
curl http://localhost:9000/java-sonar-runner-simple

if [ 0 -ne $? ]; then
  echo "Curl exited with error: $?"
  exit 1
fi


