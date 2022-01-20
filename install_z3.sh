#!/bin/bash
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
# Test Z3
#z3 --version
