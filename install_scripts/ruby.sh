#!/usr/bin/env bash
# Setup the Ruby Environment

# Setup proxy
# shellcheck disable=SC1091
source /etc/profile.d/proxy.sh || true

echo "Setting up ruby environment"

# pre-requisites
yum -y install ImageMagick
yum -y install ImageMagick-devel
yum -y install readline-devel
yum -y install libyaml-devel
yum -y install sqlite-devel
yum -y install rh-nodejs8-nodejs
yum -y install rh-nodejs8-npm
yum -y install zlib-devel
yum -y install rh-redis32-redis

# Ruby and the development libraries (so we can compile nokogiri, kgio, etc)
yum -y install rh-ruby24 rh-ruby24-scldevel rh-ruby24-ruby-devel

# Enable SCL
source /opt/rh/rh-ruby24/enable

# gems
gem install bundler --no-ri --no-rdoc
gem install rails -v '~> 5.1.6' --no-ri --no-rdoc

# Enable SCL
source /opt/rh/rh-nodejs8/enable
npm link phantomjs-prebuilt

# Setup automatic loading of SCL Files
bash -c "printf '#\!/bin/bash\nsource /opt/rh/rh-ruby24/enable\nsource /opt/rh/rh-nodejs8/enable\nsource /opt/rh/rh-redis32/enable\n
' >> /etc/profile.d/nginx18.sh"
cat >>"$HOME"/.bash_profile <<EOF
source /opt/rh/rh-ruby24/enable\nsource /opt/rh/rh-nodejs8/enable\nsource /opt/rh/rh-redis32/enable\n
EOF
