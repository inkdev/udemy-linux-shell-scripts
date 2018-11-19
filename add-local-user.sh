#!/bin/bash

#Ask for the real name
read -p 'Enter username to create: ' USER_NAME

#Ask for the real name
read -p 'Enter the name of the person account: ' COMMENT

#Ask for the password
read -p 'Enter the password for the account: ' PASSWORD

#Create the user
useradd -c "${COMMENT}" -m "${USER_NAME}" 

#Set the password for the user
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

#Force password change on first login

 
