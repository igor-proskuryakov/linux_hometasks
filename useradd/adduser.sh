#!/bin/bash
subgroup()
{
        local ingroups=$1
        local subgroups=`echo $ingroups |tr ',' ' '`
        for i in $subgroups; do groupadd -f $i; done
}


checkgroup()
{
	uname=$1
	group=$2
	subgroups=$3
	directory=$4
	passw=$5
	sh=$6
	subgroup $subgroups
	groupadd -f $group
	if [[ -n $directory ]]; then dir=" -d $directory";else dir=""; fi
	if [[ $passw != "none" ]]; then password=" -p $passw"; else password=""; fi
	if [[ -n $sh ]]; then shell=" -s $sh";else shell=""; fi
	command="-g $group -G $subgroups $dir $password $shell $uname"
	useradd $command 
	if [[ $? -eq 0 ]];then echo "user $uname was added!";fi
}





cat $1 | while read line
do
checkgroup $line
done

