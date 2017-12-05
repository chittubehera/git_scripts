#!/bin/bash

echo "enter the user name"
read user
echo "The user name entered is : $user"
{ var=`aws iam get-user --user-name $user`; } 2>/dev/null 

if [ $? -eq 0 ]; then
	echo "Displaying user details $var"
else 
	echo "user not found"
fi

