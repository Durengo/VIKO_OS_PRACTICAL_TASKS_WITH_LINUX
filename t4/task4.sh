#!/bin/bash

echo "(1) List all directories in working directory; (2) Determine which file is the largest one in the current directory; (3) Determine which folder has the highest amount of files."
read IO
if [ $IO -eq 1 ]
then
	echo "(1) List all directories in working directory or (2) select different directory? "
	read IO2
	
	if [ $IO2 -eq 1 ]
	then
		echo "Working directory:"
		echo ""
		find /home/studentai/PI21E/s.termen -type d
	elif [ $IO2 -eq 2 ]
	then
		echo "Please enter a directory: "
		read WDir
		find $WDir -type d
	fi
	
elif [ $IO -eq 2 ]
then
	echo "(1) Determine which file is the largest file in working directory; (2) select different directory?"
	read IO2

	if [ $IO2 -eq 1 ]
	then
		echo "Working directory selected."
		echo "Listing all directories and files:"
		ls /home/studentai/PI21E/s.termen -R
		echo ""
		echo "Largest file in working directory: "
		echo ""
		find $HOME -type f -printf '%s %p\n' | sort -nr | head -1

		#Directory_Array_Count=$(ls /home/studentai/PI21E/s.termen -R | wc -l)
		#Directory_Array=$(find /home/studentai/PI21E/s.termen)
		#for ((i=0; i<1; i++))
		#do
		#stat -c%s $Directory_Array[$i]
		#done
		#Directory=$(find ./)
		#stat -c%s $Directory
		#echo "Largest file in working directory:"
		#echo ""
	elif [ $IO2 -eq 2 ]
	then
		echo "Please enter a directory:"
		read WDir
		echo "Directory "$WDir" selected."
		ls $WDir -R
		echo ""
		echo "Largest file in directory: "
		echo ""
		find $WDir -type f -printf '%s %p\n' | sort -nr | head -1
	fi
elif [ $IO -eq 3 ]
then
	echo "Please select a directory (0 for $HOME): "
	read WDir
	if [ $WDir -eq 0 ]
	then
	WDir=$HOME
	fi
	#ls $WDir | wc -l
	TFA=$(ls $WDir | wc -l)
	echo "Total folder amount: "$TFA
	echo ""
	Arr=()
	for ((i=1; i<=$TFA; i++))
	do
		Arr[$i]+=$(find $WDir -type d | sed -n "$i"p"")
		#find $WDir -type d | head -$TFA
		#echo ${Arr[$i]}
	done
		#Arr[0]+=$(find $WDir -type d | sed -n 1p)
		#Arr[1]+=$(find $Wdir -type d | sed -n 2p)
	Count=()
	for ((i=1; i<=$TFA; i++))
	do
		#echo ${Arr[$i]}
		Count[$i]+=$(ls ${Arr[i]} | wc -l)
	done
	for ((i=1; i<=$TFA; i++))
	do
		echo "Directory "${Arr[$i]}" has "${Count[$i]}" files."
	done
	max=${Count[1]}
	for n in "${Count[@]}" ;
	do
		((n > max)) && max=$n
	done
	for ((i=1; i<=$TFA; i++))
	do
		if [ ${Count[$i]} -eq $max ]
		then
			ArrTrack=${Arr[$i]}
		fi
	done
	echo ""
	echo "Directory "$ArrTrack" has the most files ("$max")"
	#echo $max
	#echo $ArrTrack
fi
