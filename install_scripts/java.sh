#!/usr/bin/env bash
# Install Java

# Java
if java -v >/dev/null; then
	echo "Java already installed. Skipping installation."
else
	echo "Java is not installed. Installing Java 1.8.0"
	yum -y install java-1.8.0-openjdk
fi
