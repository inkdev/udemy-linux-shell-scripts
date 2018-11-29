#!/bin/bash
#The script creates a new user on the local system
#Enforce, that script execute with root privileges
if [[ "${UID}" -ne 0 ]]
then
	echo "You dont have the root permissions. Please, run it with sudo" >&2
	exit 1
fi

#If they don't supply at least one argument, then give them help
if [[ "${#}" -eq 0 ]]
then
	echo "Please, enter your name in the following format: ${0} USER_NAME [COMMENT]... " >&2
	exit 1
fi 

#Binding a username as first argument.
USER_NAME="${1}"

#Adding a few arguments as comment in useradd command
shift
USER_COMMENT="${*}"

#Generate a password
PASSWORD=$(date +%s%N | sha256sum | head -c48)

#Adding a user with comment
useradd -c "${USER_COMMENT}" -m "${USER_NAME}" &> /dev/null

#Check to see if the useradd command succeeded
if [[ "${?}" -ne 0 ]]
then
	echo 'Your account cannot create completely' >&2
	exit 1
fi

#Set the password for user
echo ${PASSWORD} | passwd --stdin ${USER_NAME} &> /dev/null

#Check that password command is ok
if [[ "${?}" -ne 0 ]]
then
	echo "The password for the account could not be set" >&2
	exit 1
fi

#Force password change on first login
passwd -e ${USER_NAME} &> /dev/null

#Display the entire information about user
echo "Your username is ${USER_NAME}"
echo "Your password is ${PASSWORD}"
echo "Your hostname is ${HOSTNAME}"
exit 0   
