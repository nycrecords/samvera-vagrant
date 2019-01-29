#!/usr/bin/env bash

## Set up multitenancy for Hyku

# dnsmasq (for resolving localhost subdomains)
yum -y install dnsmasq

echo "address=/localhost/127.0.0.1" >/etc/dnsmasq.d/localhost.conf

sed -i -e 's/#prepend domain-name-servers 127.0.0.1;/prepend domain-name-servers 127.0.0.1;/' /usr/lib/dracut/modules.d/40network/dhclient.conf

service dnsmasq restart
dhclient
