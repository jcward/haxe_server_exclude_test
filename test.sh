#!/bin/sh

# Cleanup bin dirs
rm -rf bin bin_*

# 1) Build without the compilation server
haxe build.hxml

# set results aside
mv bin bin_noserver

# Start completion server
haxe --wait 6055 &
PID=$!
sleep 0.5

# 2) Build with the compilation server
haxe --connect 6055 build.hxml

# set results aside
mv bin bin_server

# Kill completion server
kill $PID

# Compare results
echo "Built without the server:"
ls -la bin_noserver | sed 's/^/   /'

echo "Built with the server (smaller files, missing classes):"
ls -la bin_server | sed 's/^/   /'

echo "------------------------------------------"
echo "Does bin_server/class_a.js define ClassA ?"
if grep -q -i "var ClassA = function" bin_server/class_a.js ; then
 echo "YES"
else
 echo "NO - FAILED"
fi
echo "------------------------------------------"
