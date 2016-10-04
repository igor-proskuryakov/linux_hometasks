name=$1
group=$2
dir=$3
password=$4
flag=0
echo $group
grep $group /etc/group | sed s/:.*// | while read line
do
let flag=1+1
echo $flag
done
echo $flag
