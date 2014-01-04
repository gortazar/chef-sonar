maintainer       "Patxi Gortázar"
maintainer_email "patxi.gortazar@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures sonarqube"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.6"
recipe           "sonarqube", "Includes the recipe to download and configure a sonarqube server"
recipe           "sonarqube::database_mysql", "Includes the recipe to install MySql-Server and create a database for sonar"
recipe           "sonarqube::proxy_apache", "Includes the recipe to install Apache-Webserver and proxy modules to access sonar. Creates a host for sonar."
recipe           "sonarqube::proxy_nginx", "Includes the recipe to install Nginx-Webserver and configures proxy to access sonar. Creates a host for sonar."

%w{ debian ubuntu }.each do |os|
  supports os
end

%w{ java }.each do |cb|
  depends cb
end

attribute "sonar/dir",
  :display_name => "Sonar directory",
  :description => "Path to sonar",
  :default => "/opt/sonarqube"

attribute "sonar/version",
  :display_name => "Sonar version",
  :description => "The version will be used to download the sources for the given version from 'http://dist.sonar.codehaus.org/sonarqube-#version#.zip'",
  :default => "4.0"

attribute "sonar/checksum",
  :display_name => "MD5 Checksum",
  :description => "MD5 Checksum of download file"

attribute "sonar/os_kernel",
  :display_name => "System architecture",
  :description => "Choose which CPU your running sonar on. This modifies the start-script to your architecture.",
  :default => "linux-x86-64"

attribute "sonar/runner/version"
  :display_name => "Sonar-runner version",
  :description => "The version that will be used to download the sources for the given version from 'http://repo1.maven.org/maven2/org/codehaus/sonar/runner/sonar-runner-dist/#version#/sonar-runner-dist-#version#.zip'"
  :default => "2.3"

