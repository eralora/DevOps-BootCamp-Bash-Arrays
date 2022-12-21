#!/bin/bash

# Place your code here
arg=$1
declare -a arr
declare -a res
count=0

#Making array with letters a to z
for i in {a..z}; do
	arr+=($i)
done

#Using For loop for creating folders by input arguments.
for (( i=0; i < $arg; i++ )); do
	
	#Should be only up to 26 folders. If more break the loop.
	if [ $i -eq 26 ]; then
		break
	fi
	
	#If folder with the same name exist so add it res array then continue next itteration.
	if [ -d folder_${arr[$i]} ]; then
		res+=(folder_${arr[$i]})
		continue
	fi

	#Making folder and add created folder's name to res array.
	mkdir  folder_${arr[$i]}
	res+=(folder_${arr[$i]})

	#Tracking how many folders are created
	count=$((count+1))
	
done

#Using Pattern substitution to adding comma between each arrays
result="${res[*]}"
if [ $count -le 1 ]; then
	echo "$count folder created: ${result//${IFS:0:1}/, }"
else 
	echo "$count folders created: ${result//${IFS:0:1}/, }"

fi
