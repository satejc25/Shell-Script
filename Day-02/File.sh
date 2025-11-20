#!/bin/bash
# Single line comment
<< comment
block starts we can write any thing here 
this is multiline comment
comment
#variable
<<comment
name="Satej"
echo "Name is $name, and date is $(date)"

echo "Enter your name:"
read username
echo "You entered $username"

#What is arguments
#./file.sh is $0 then we wrote anything then it is $1 after space $2 we can use that argumets in script
#

echo "The arguments in $0 are $1 $2"

#Conditional
#if condition else 
#

read -p "Enter value: " a
if [[ $a == "10" ]];
then
        echo "values matches"
elif [[ $a -ge 0 ]];
then
	echo "$a is positive"
else
        echo "values didnt matched"
fi
comment

#loop while loop
<<task
$1 is argument 1 which is folder name
$2 is start range
$3 is end range
task
<< comment
for (( i=$2 ; i<=$3; i++ ))
do
	mkdir "$1$i"
done
comment

num=0
while [[ $((num%2)) -eq0 && num -le 10 ]]
do
	echo "$num"
	num=$((num+2))
done
