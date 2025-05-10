#!/bin/bash

num1=$1
num2=$2

echo $(( num1+num2 ))

DATE=$(date +%d-%m-%Y)

echo "$DATE"


## Read The data from terminal using read command

echo "Please Enter your Username"

read -s USERNAME

echo "My username is $USERNAME"

echo "Please Enter your Password"

read -s PASSWORD

echo "My Password is $PASSWORD"
