#!/bin/bash

echo "Script for running automatic my own tests "
echo "------------------------------------------------"
echo "Getting python3 executable loc"
python_exec_loc=$(which python3)
if [ $? -eq 0 ]; then echo "OK"; else echo "Problem getting python3 exec location"; exit 1; fi
echo "$python_exec_loc"
echo "------------------------------------------------"
echo "Checking if public ip is available for connection to internet"
curl ifconfig.co
if [ $? -eq 0 ]; then echo "OK"; else echo "Can't resolve a public ip address, check if server is conencted to internet"; exit 1; fi
echo "------------------------------------------------"
echo "Running asteroid naked tests"
$python_exec_loc test_for_naked.py
if [ $? -eq 0 ]; then echo "OK"; else echo "Naked test FAILED"; exit 1; fi
echo "------------------------------------------------"

echo "YES SIR! All the tests worked! Launch your program now!"
echo "$python_exec_loc naked.py"
