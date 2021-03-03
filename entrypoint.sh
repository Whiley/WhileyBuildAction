#!/bin/bash

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
