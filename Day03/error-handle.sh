#!/bin/bash

create_directory(){
	mkdir first
}

if ! create_directory; 
then
echo "Directory already exist"
exit 1
fi

echo "This shouldn't be work, code  interrupted"

