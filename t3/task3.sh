#!/bin/bash

echo "Select:"
echo "(1) Check which file has more lines."
echo "(2) Check which directory has more files."
read m

if [ $m = 1 ]
then
	ls
	
	echo "We will be checking which file has more lines"
	echo "Enter the first file:"
	read F1
	F1L=$(sed -n '$=' $F1)
	
	echo "Enter the second file:"
	read F2
	F2L=$(sed -n '$=' $F2)
	echo "File "$F1" has "$F1L" lines."
	echo "File "$F2" has "$F2L" lines."
	
	if [ $F1L -gt $F2L ]
	then
		echo "The first file has more lines."
	elif [ $F1L -lt $F2L ]
	then
		echo "The second file has more lines."
	elif [ $F1L -eq $F2L ]
	then
		echo "Both files have the same ammount of lines."
	fi
elif [ $m = 2 ]
then
	pwd
	echo "We will be checking which directory has more files."
	echo "Enter the first directory location:"
	read D1
	
	echo "Enter the second directory location:"
	read D2
	
	D1L=$(find $D1 -type d | sed -n '$=')
	D2L=$(find $D2 -type d | sed -n '$=')
	echo "Directory #1 "$D1" has "$D1L" files."
	echo "Directory #2 "$D2" has "$D2L" files."
	if [ $D1L -gt $D2L ]
	then
		echo "Directory #1 has more file (-s) than Directory #2."
	elif [ $D1L -lt $D2L ]
	then
		echo "Directory #2 has more file (-s) than Directory #1."
	elif [ $D1L -eq $D2L ]
	then
		echo "Directory #1 has the same amount of files as Directory #2"
	fi
fi
echo "Complete."
