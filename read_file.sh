#!/usr/bin/bash

#This script eill read a file with names and store them in an array
#The script will then loop three times and generate a random index
file="names.txt"
i=0
while read line
do
	array[ $i ]="$line"
	(( i++ ))
done <"$file"
loop=3
for x in $(seq $loop);
do
	index=$((0 + $RANDOM % "${#array[@]}"))
done
