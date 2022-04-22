#!/bin/bash

Help()
{
   # Display Help
   echo "Creates a new directory structure and copies the template files to the new folder"
   echo
   echo "Syntax: create_file_from_template.sh [-p|f]"
   echo "options:"
   echo "p     The parent folder"
   echo "f     The child folder"
   echo
}

while getopts ":hp:f:" option; do
   case $option in
      h) Help
         exit;;
      p) Parent=$OPTARG;;
      f) Folder=$OPTARG;;
      \?) echo "Error: Invalid option"
         Help
         exit;;
   esac
done

Path="$Parent/$Folder"
if [ -d "$Path" ]; then
   echo "$Path already exists"
   exit 1
else
   echo $Path
   mkdir -p $Path
   cp -r template/. $Path
fi
