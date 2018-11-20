#!/bin/bash
#Check if the user are root or not
if [[ "${UID}" -ne 0 ]]
then
	echo 'You are not root!'
	exit 1
fi
	
#Ask for the username
read -p 'Enter the username to create: ' USER_NAME

#Ask for the real name
read -p 'Enter the name of the person or application that will be using this account: ' COMMENT

#Ask for the password
read -p 'Enter the password for the account: ' PASSWORD

#Create the user
useradd -c "${COMMENT}" -m "${USER_NAME}" 

#Check the succesful creation of user
if [[ "${?}" -ne 0 ]]
then
	echo 'The user creation is not complete'
	exit 1
fi

#Set the password for the user
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

#Check the succesgul creation a password
if [[ "${?}" -ne 0 ]]
then
	echo 'The password creation is not complete'
	exit 1
fi

#Force password change on first login
passwd -e ${USER_NAME}

#Display the username,password and the host where the user was created
echo "Your username is ${USER_NAME}"
echo "Your password is ${PASSWORD}"
echo "Your hostname is ${HOSTNAME}"
exit 0

 
