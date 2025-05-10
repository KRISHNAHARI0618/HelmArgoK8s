#!/bin/bash

number=$1

if [ $number -gt 10 ]
then
    echo "The number $number is greater than 10"
else
    echo "The number $number is less than 10"
fi

number1=$2
number2=$3

if [ "$number1" -lt "$number2" ]
then
    echo "The Number $number2 Greater Than $number1"
else
    echo "The Number $number2 Less Than $number1"
fi

# -ge greater than equal -le less than equal -gt greater than -lt less than 
# -eq equal to 

number3=$4
number4=$5

if [[ "$number3" < "$number4" ]]
then
    echo "$number3 is less than $number4"
else
    echo "$number4 is greater than $number3"
fi