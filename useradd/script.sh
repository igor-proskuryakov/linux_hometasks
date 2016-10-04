#!/bin/bash
checkgroup()
{
	if `groupadd $2`; then echo "There wasn't group $2 . Group was added"; else echo "The group is already exists";fi
	if [[ -n $3 ]]; then dir=" -d $3"; fi
	if [[ -n $4 ]]; then password=" -p $4"; fi
	command="$1 -g $2 $dir $password"
	echo $command
	useradd $command
}




cat list.txt | while read line
do
checkgroup $line
done

