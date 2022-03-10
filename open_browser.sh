#!/usr/bin/bash

echo "Welcome to brower opener"

echo "Which browser engine do you want to open: "
read browser_name
echo "Which browser do you want to open"
read browser_address

$browser_name https://$browser_address
