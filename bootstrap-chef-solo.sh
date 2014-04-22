#!/bin/bash

# Always do this to update indexes
apt-get update

# This is recommended for production, but can be skipped when testing
#aptitude safe-upgrade

# Install chef and berkshelf dependencies
apt-get -y install git-core curl libxslt1-dev libxml2-dev build-essential

# Install chef with the omnibus installer
\curl -L https://www.opscode.com/chef/install.sh | bash

# Install berkshelf using chef's embedded ruby
/opt/chef/embedded/bin/gem install berkshelf -v 2.0.15 --no-ri --no-rdoc

# Prepare folder for cookbooks described in Berksfile
mkdir cookbooks

# Install cookbooks
/opt/chef/embedded/bin/berks install --path ./cookbooks

# Now we can run chef-solo
chef-solo -c solo.rb



