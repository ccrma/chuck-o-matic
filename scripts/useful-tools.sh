#!/bin/bash
#
# name: useful-tools.sh
# desc: print a list of useful tools for chugin's development
#
# usage: from chuck-o-matic/ root
#      > sh ./scripts/useful-tools

# print
echo "--------------------------------------------"
echo "check runtime dylib dependencies (macOS):"
echo "    otool -L FILE"
echo ""

echo "created a universal binary (macOS):"
echo "    lipo -create -output OUTFILE x86_FILE ARM_FILE"
echo ""

echo "determine file type (macOS):"
echo "    file FILE"
echo ""

echo "check supported architecture(s) (macOS):"
echo "    lipo -archs FILE"
echo ""

echo "check codesigning (macOS):"
echo "    codesign -dvvv FILE"
echo "--------------------------------------------"
