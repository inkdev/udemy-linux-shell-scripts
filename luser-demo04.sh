#!/bin/bash

#this script creates account

#ask for usernmae
read -p 'Enter the username to create: ' USER_NAME
#ask for real username
read -p 'Enter the name of the person who this account is for: ' COMMENT
#ask for a password
read -p 'Enter the password to use for the account: ' PASSWORD


#create a user
useradd -c "${COMMENT}" -m ${USER_NAME}

#set the password
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

#force change pass
passwd -e ${USER_NAME}
 
