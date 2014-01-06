# DESCRIPTION:

[![Build Status](https://travis-ci.org/gortazar/chef-sonar.png)](https://travis-ci.org/gortazar/chef-sonar)

This cookbook basically translates the install instructions from http://docs.codehaus.org/display/SONAR/Install+Sonar#InstallSonar-Server into chef DSL. It is an updated version from the original ctrabold/chef-sonar cookbook to support sonarqube (>= 4.0). 

# REQUIREMENTS:

* `java` + `jdk`
* A database cookbook like `mysql` if you like to run sonar in production.
The built in derby database is not recommended for production.

# ATTRIBUTES:

See `attributes/default.rb` for details.

# USAGE:

The cookbook installs sonar with h2 database (default).
The sonarqube::mysql recipe creates a mysql db to use with sonarqube
Inlcude a `proxy_*` recipe to your `run_list` to access sonar over a proxy server.

# Todos

* Implement `dir` attribute to make installation path more flexible
* Implement different Database backends like MySql
* Implement plugin recipes eg. http://docs.codehaus.org/display/SONAR/PHP+Plugin
  Download jars to plugin folder, restart Sonar
* Create database with mysql LWRP
<pre>
	mysql_database "sonar" do
	  host "localhost"
	  username "root"
	  password node[:mysql][:server_root_password]
	  database "sonar"
	  action :create_db
	end
</pre>
* Set allow / deny patterns with attributes for web access
<pre>
	default['sonar']['web_deny']               = []
	default['sonar']['web_allow']              = []
</pre>
