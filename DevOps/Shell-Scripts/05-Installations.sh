#!/bin/bash

userid=$(id -u)

echo "the user is $userid"

if [ $userid -ne 0 ]
then
    echo "You Are Not A Root User"
else
    echo "Congratulations You are Root User $userid"
    # exit 1
fi

apt install git -y 

if [ $? -ne 0 ]
then
    echo "$? Git Installation Is Failure"
else
    echo "$? Git Installation Is Success"
fi

apt upgrade -y

if [ $? -eq 0 ]
then
    echo "$? Installation is Success"
else
    echo "$? Installation is Failure"
fi