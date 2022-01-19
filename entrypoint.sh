#!/bin/bash

# Configure USER.  On Docker this is unset, but on the GitHub action
# it is set.
if [ -z $USER ]
then
    USER=whiley
fi
# Configure version of WDK to use.
if [ -z $INPUT_VERSION ] || [ "$INPUT_VERSION" == "latest" ] ;
then
    # Download LATEST indicator
    INPUT_VERSION=`wget -O - https://github.com/Whiley/WhileyDevelopmentKit/raw/master/dist/LATEST`
fi
# =================================================================================
# Install Z3
# =================================================================================
Z3_BASE="z3-4.8.10"
Z3_PKG="$Z3_BASE-x64-ubuntu-18.04"
Z3_URL="https://github.com/Z3Prover/z3/releases/download/$Z3_BASE/$Z3_PKG.zip"
# Download and install Z3
wget $Z3_URL
unzip $Z3_PKG.zip
mv $Z3_PKG z3
export PATH="$PATH:/home/$USER/z3/bin"
# Test Z3
z3 --version
# =================================================================================
# Install Dotnet 5.0
# =================================================================================
# Make dotnet package repository available
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
# Update all install packages
apt-get -y update
# Install dotnet 5.0
apt-get -y install dotnet-sdk-5.0
# Configure DOTNET Home
export DOTNET_CLI_HOME=/home/$USER
# =================================================================================
# Install Boogie
# =================================================================================
dotnet tool install --global boogie
#
export PATH="$PATH:/home/$USER/.dotnet/tools"
# =================================================================================
# Install Whiley
# =================================================================================
cargo install whiley
# =================================================================================
# Run Whiley
# =================================================================================
echo "================================================================================"
echo "Running wy build ..."
echo "================================================================================"
# Run Whiley build
wy --verbose build
# Run Whiley QuickCheck (if requested)
if [ "$INPUT_CHECKING" = true ] ;
then
    echo "================================================================================"
    echo "Running wy check ..."
    echo "================================================================================"    
    wy --verbose check
fi
