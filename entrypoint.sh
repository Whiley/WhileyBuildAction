#!/bin/bash
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
