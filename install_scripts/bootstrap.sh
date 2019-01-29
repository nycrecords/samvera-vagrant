#!/usr/bin/env bash
# Basic Development Environment Setup

SHARED_DIR=$1

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
	# shellcheck disable=SC1090
	. "$SHARED_DIR"/install_scripts/config
fi

cd "$HOME" || return 1

# Update local OS
yum -y update && yum -y upgrade

# SSH
yum -y install openssh-server

# Build tools
yum -y install build-essential

# Git vim
yum -y install git vim

# Wget, curl, libcurl and unzip
yum -y install wget curl libcurl3 unzip

# Development Tools
yum -y groupinstall "Development Tools"

cat >>"$HOME"/.bash_profile <<EOF
cd /vagrant
EOF
