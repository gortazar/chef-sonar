#!/bin/bash

git clone https://github.com/SonarSource/sonar-examples.git

cd sonar-examples/projects/languages/java/sonar-runner/java-sonar-runner-simple

/opt/sonar-runner/bin/sonar-runner

# Test sonar project connection
curl http://localhost:9000/java-sonar-runner-simple

