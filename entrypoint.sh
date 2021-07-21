#!/bin/bash
USER=whiley
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
# Install dotnet 5.0
apt-get install dotnet-sdk-5.0
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
# Construct working directory for Whiley Distribution
mkdir /home/whiley
# Determine latest version (if necessary)
if [ "$INPUT_VERSION" == "latest" ] ;
then
    # Download LATEST indicator
    INPUT_VERSION=`wget -O - https://github.com/Whiley/WhileyDevelopmentKit/raw/master/dist/LATEST`
fi
# Download Whiley Development Kit
wget -P /home/whiley https://github.com/Whiley/WhileyDevelopmentKit/raw/master/dist/wdk-${INPUT_VERSION}.tgz
# Unpack Whiley Development Kit
tar xvzf /home/whiley/wdk-${INPUT_VERSION}.tgz -C /home/whiley
# Configure WHILEYHOME
export WHILEYHOME="/home/whiley/wdk-${INPUT_VERSION}"
# Configure path
export PATH="$PATH:$WHILEYHOME/bin"
# Enter working directory
cd ${GITHUB_WORKSPACE}
# Print debug info
echo "WHILEYHOME=${WHILEYHOME}"
# =================================================================================
# Run Whiley
# =================================================================================
echo "================================================================================"
echo "Running wy build ..."
echo "================================================================================"
# Run Whiley build
/bin/bash ${WHILEYHOME}/bin/wy --verbose build
# Run Whiley QuickCheck (if requested)
if [ "$INPUT_CHECKING" = true ] ;
then
    echo "================================================================================"
    echo "Running wy check ..."
    echo "================================================================================"    
    /bin/bash ${WHILEYHOME}/bin/wy --verbose check
fi
