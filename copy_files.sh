#!/bin/bash

#---script to copy files from the directory to another directory---#

#source directory
src=$1

#destination directory
des=$2

#files to copy
files=("${@:3}")


echo "-----------------------------------------------------------------------"

echo "Checking for the source directory..."

#check if the source directory exist
if [[ ! -d "$src" ]]; then

	#if not exists, create it
	echo "Source directory '$src' does not exist, Creating it..."
	mkdir -p "$src" 
	echo "Source directory '$src' created successfully!"
else
	echo "Source directory '$src' already exists."
fi

echo "-----------------------------------------------------------------------"

echo "Checking for the destination directory..."

#check if the destination directory exist
if [[ ! -d "$des" ]]; then

        #if not exists, create it
        echo "Destination directory '$des' does not exist, Creating it..."
        mkdir -p "$des"
        echo "Destination directory '$des' created successfully!"
else
	echo "Destination directory '$des' already exists."
fi

echo "-----------------------------------------------------------------------"


#function to copy the files
copy_files () {

	echo "Checking for the files..."

	#create the files if not exists
	for i in "${files[@]}";
	do
		if [[ ! -f "$src/$i" ]]; then
			echo "File '$i' does not exist, Creating it..."
			touch "$src/$i"
		else
			echo "File '$i' already exists."
		fi
	done
        echo "Files checking finished successfully!"

echo "-----------------------------------------------------------------------"


	#copying the files from source to destination
	echo "Start Copying the files..."
	for i in "${files[@]}";
	do 
		echo "Copying '$i'... "
		cp "$src/$i" "$des/"
	done

	echo "All files copied successfully!"

echo "-----------------------------------------------------------------------"

}


#call the function
copy_files

