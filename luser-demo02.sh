#!/bin/bash
#Display the UID of the user

echo "Your UID is ${UID}"
#Display the username
USER_NAME=$(id -un)
echo "Your username is ${USER_NAME}"

#Check if you are root
if [[ "${UID}" -eq 0 ]]
then
	echo 'You are root.'
else
	echo 'You are not root.'
fi
echo "$!"

