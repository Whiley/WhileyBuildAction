#!/bin/sh

cd ${GITHUB_WORKSPACE}
echo "${WHILEYHOME}"
/bin/sh ${WHILEYHOME}/bin/wy --verbose build
