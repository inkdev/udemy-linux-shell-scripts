#!/bin/bash

echo "Your UID is ${UID}"
UID_TO_TEST_FOR='1000'
if [[ "${UID}" -ne "${UID_TO_TEST_FOR}" ]]
then
	echo "Your UID does not match ${UID_TO_TEST_FOR}."
	exit 1
fi
#Display the username
USER_NAME=$(id -un)
if [[ "${?}" -ne 0 ]]
then
	echo 'The id command did not execute successfully.'
	exit 1
fi
echo "Your username is ${USER_NAME}"

#Use a string test conditional
USER_NAME_TO_TEST_FOR='alexis'
if [[ "${USER_NAME}" = "${USER_NAME_TO_TEST_FOR}" ]]
then
	echo "Your username matches ${USER_NAME_TO_TEST_FOR}."
fi


#Test for !=
if [[ "${USER_NAME}" != "${USER_NAME_TO_TEST_FOR}" ]]
then
	echo "Your username does not match ${USER_NAME_TO_TEST_FOR}."
	exit 1
fi

exit 0
