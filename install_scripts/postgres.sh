#!/usr/bin/env bash

echo "Installing PostgreSQL database (requirement for Hyku)"

# Necessary PostgreSQL packagesss
yum -y install rh-postgresql96
yum -y install rh-postgresql96-postgresql-libs
yum -y install rh-postgresql95-postgresql-devel

# Link Postgres Libraries
ln -s /opt/rh/rh-postgresql96/root/usr/lib64/libpq.so.rh-postgresql96-5 /usr/lib64/libpq.so.rh-postgresql96-5
ln -s /opt/rh/rh-postgresql96/root/usr/lib64/libpq.so.rh-postgresql96-5 /usr/lib/libpq.so.rh-postgresql96-5

# Initialize Postgres
/opt/rh/rh-postgresql96/root/usr/bin/postgresql-setup --initdb

# Start Postgres
sudo service rh-postgresql96-postgresql start

# As our vagrant box defaults to a user named 'vagrant',
# we have to create a corresponding 'vagrant' SUPERUSER in PostgreSQL
# shellcheck disable=SC1091
source /opt/rh/rh-postgresql96/enable
sudo -u postgres /opt/rh/rh-postgresql96/root/usr/bin/createuser vagrant --superuser

# Setup automatic loading of SCL Files
cat >>"$HOME"/.bash_profile <<EOF
source /opt/rh/rh-postgresql96/enable
EOF
