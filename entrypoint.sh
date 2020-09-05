#!/bin/sh

# Enter working directory
cd ${GITHUB_WORKSPACE}
# Print debug info
echo "${WHILEYHOME}"
# Run Whiley build
${WHILEYHOME}/bin/wy --verbose build

