#!/bin/bash

R="\e[31m"
N="\e[0m"
G="\e[32m"

for i in {0..5}
do
    echo "$i"
done

count=1

# While Loop
while [[ $count -le 5 ]]
do
    echo $count
    ((count++))
done

# Array Loop
myarray=("a" "b" "c" "d")
for i in "${myarray[@]}"
do 
    echo "$i"
done

#Even Numbers
for i in {1..10}
do
    if [[ $i%2 -eq 0 ]]
    then
        echo -e "$G $i is Even Number $N"
    else
        echo -e "$R $i Is Not Even Number $N"
    fi
done

# # C - Style For Loop
# for (( i=0; i<=5; i++))
# do
#     echo "$i"
# done

# # Nested Loop
# for i in 1 2 3 4 5
# do 
#     echo  "Outer Loop $i"
#     for j in {1..10}
#     do 
#         echo  "$j"
#     done
# done

