#!/bin/bash
# =================================================================================
# Install Dotnet 6.0
# =================================================================================
# Make dotnet package repository available
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
# Update all install packages
apt-get -y update
# Install dotnet 5.0
apt-get -y install dotnet-sdk-6.0
# Configure DOTNET Home
export DOTNET_CLI_HOME=/root
# =================================================================================
# Install Boogie
# =================================================================================
dotnet tool install --global boogie
