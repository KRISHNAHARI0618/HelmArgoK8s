## Shell Scripting

- For accessing the virtual machine ```ssh -i priavte-key username@publicip```
- keygeneration ```ssh-keygen -t rsa 2048 -f peddireddydevOps```
- *.ssh* directory --> create a file called config

```
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/peddireddy.pem

Host github.com-t
  HostName github.com
  User git
  IdentityFile ~/.ssh/peddireddy.pem
```
- How to push existing directory to github


```
git init **Initializes the git repo in local**
create a repo in git hub server
git commit -m "commit id "
git branch -M main
git remote add origin github-repo-url
git push -u origin main

```

## Shebang 
- ```#!/bin/bash/```
- How to excute the scripts we need to give shebang

## Concepts :
- *Variables*
  - var1=$1, var2=$2 echo "$2"
  - *Special Varibales*
    - $@ --> All Variables
    - $# --> Count Variables
    - $VAR --> Variables name
    - $0 --> Will Give the File Name
  
- *Data Types*
  - We dont have data types in shell script 
  - Boolean 
    - 0 --> Failure
    - 1 --> Success
  - Array = ("shell" "bash" "zsh" "sh" "ksh")
- *Conditions*
- *Loops*
- *Functions*

## read command 
- Read command will read the data from terminal and it will store data in variable

## Exit Status
- $? --> Syntax to check whether previous command is success or not 
- $? == 0 --> Then Previous Command is Success
- $? == 1 - 127  --> Then Previous Command is Failure 

## Functions 
- When you are Running Repeated command/code multiples times we can keep all in one place and call when ever required
- 
```
validate(){
  # It will take the $1 argument by default
  if [ $1 -eq 0 ]
  then 
      echo "The installation Is Sucess"
  else
      echo "The install is Failure"
  fi

}
```

## Redirections
- 1> it will take success output/messages to the files
- 2> It will take the failure messages/output to files
- &> will push the output changes to file and everytime i will over write and delete old ones
- &>> Will append the output and add at the end of the file
- < is the input section

## Colors

- echo -e "\e[30mHello World" --> Grey Color
- echo -e "\e[31mHello World" --> Red Color
- echo -e "\e[32mHello World" --> Green Color
- echo -e "\e[33mHello World" --> Yellow Color
- echo -e "\e[34mHello World" --> Blue Color
- echo -e "\e[35mHello World" --> Pink Color
- echo -e "\e[36mHello World" --> Dark Blue 
- echo -e "\e[37mHello World" --> White Color

## For Loops : 
```
for i in list
do
  echo "$i"
done
```

## Process Management 
- `ps` this is to check the only application process 
- `ps aux` to check for all process in Liunx it will show cpu and memory utilization
- `ps -ef` to check all process and it will not show cpu and memory utilization
- `ps aux | wc -l` or `ps aux | wc -l` to cound the process
- `kill` to kill any process normally
- `kill -9 pid` to forcefully kill the process 
- `ps aux | grep 8080` it will check the all 8080 port running instances
- `kill -STOP pid` to stop any running process
- `kill -CONT pid` to continus the process
- `renice -n -5 -p <pid>` to make this process as priority one
- `renice -n 10 -p <pid>` to make this process pririty as 10 th place 

## Monitoring or Memory Related Commands
- `top` to check the status and memory etcc things in linux
- `htop` human readable of status of machine memory cpu utilization etc..
- `free -h` comamnd used to check the free memory resourecs in linux
- `df -h` used to find the disk free in linux
- `vmstat` shows the statisics of vm 
- 