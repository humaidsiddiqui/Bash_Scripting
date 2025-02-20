
# multi line comments starts with << comment(name any word for the comment) end with same word 
# ex: << comment
# this is
# Humaid
# siddiqui

# comment

# Variables: the meaning of VARIable means the value can vary 
name="humaid"
echo"my name is $name and today's date is $(date)"

# taking input from the user
echo "enter your age"
read userage
echo "you entered $userage"

# another way for taking input from user
read -p "Enter your username" username
echo "you entered $username"

# How to add user to the group
sudo useradd -m $username
echo "new user added"
# to know where the user is added type this command cat /etc/passwd

# arguements in shell:
# the user can enter arguements when writing commands. the address of arguements are 0 1 and 2 
# echo $0 and $1

# loops in bash scripting
#!/bin/bash
read -p "enter your age " age
if [[ $age -ge 18 ]]; then
        echo "you can vote"
else
        echo "you cannot vote"
fi

elif condition:
elif [[$age -ge 18]]
then  

# loops in bash scripting
#!/bin/bash
#this is loop concept

for((num=1;num<=5;num++));
do
        mkdir "demo$num"
done

# write a script to build folder from start and end arguement command such as loops 1 100 (build driectory from 1 to 100 through CLI arguement)

#!/bin/bash
for (nums=$2nums<$3;num++)
do
    mkdir "day$nums"
done
rm -r day* (this will delete all day folders)

while loops
#!/bin/bash

# Read the limit from the user
read -p "Enter the limit: " limit

echo "Even numbers:"
for ((i = 2; i <= limit; i += 2)); do
    echo "$i"
done

echo "Odd numbers:"
for ((i = 1; i <= limit; i += 2)); do
    echo "$i"
done



