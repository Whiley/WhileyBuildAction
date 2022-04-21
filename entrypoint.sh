#!/bin/bash

# Configure USER.  On Docker this is unset, but on the GitHub action
# it is set.
if [ -z $USER ]
then
    USER=root
fi
#
echo "================================================================================"
echo "Running wy build ..."
echo "================================================================================"
# Run Whiley build
wy --verbose build
