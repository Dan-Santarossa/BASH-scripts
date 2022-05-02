#!/bin/bash

while [ $# -eq 0 ]; do
    echo "Must enter at least one name as argument"
    sleep 2
    exit 1
done    

for name in $*; do
	egrep "^$name" /etc/passwd >/dev/null
   
    if [ $? -eq 0 ]; then
    echo "Username already exists! Please select new user name."
    
    else
         sudo useradd -m "$name"
         [ $? -eq 0 ] && echo "Users added to system."
    fi
done
