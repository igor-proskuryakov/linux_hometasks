#!/bin/bash
checkgroup()
{
	uname=$1
	group=$2
	directory=$3
	passw=$4
	groupadd -f $group
	if [[ -n $directory ]]; then dir=" -d $directory"; fi
	if [[ -n $passw ]]; then password=" -p $passw"; fi
	command="$uname -g $group $dir $password"
	useradd $command 
	if [[ $? -eq 0 ]];then echo "user $uname was added!";fi
}




cat $1 | while read line
do
checkgroup $line
done

