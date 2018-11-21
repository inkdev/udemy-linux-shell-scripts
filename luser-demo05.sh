#!/bin/bash
#This script genereates a list of random passowrds

#A random number is a password
PASSWORD="${RANDOM}"
echo "${PASSWORD}"

#Three random numbers together
PASSWORDS="${RANDOM}${RANDOM}${RANDOM}"
echo "${PASSWORDS}"

#Use the current date/time as the basis for the password.
PASSOWRD=$(date +%s)
echo "${PASSWORD}"

#Use nanoseconds to act as random
PASSWORD=$(date +%s%N)
echo "${PASSWORD}"

#A better password
PASSWORD=$(date +%s%N | sha256sum | head -c32)
echo "${PASSWORD}"

#An even better password
PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c48)
echo "${PASSWORD}"

#Append a special character to pass
SPECIAL_CHARACTER=$(echo '!@#$%^&*()_+=' | fold -w1 | shuf | head -c1)
echo "${PASSWORD}${SPECIAL_CHARACTER}" 
