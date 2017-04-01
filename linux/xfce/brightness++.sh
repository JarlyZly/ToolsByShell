#!/bin/bash

# xfcｅ环境下笔记本亮度调节
#　请用超级用户执行
#　功能：增加亮度

light_conf="/sys/class/backlight/intel_backlight/brightness"
max_day_light=900
max_night_light=100
old_light=`cat $light_conf`

if [ $old_light -lt $max_day_light ] && [  $old_light -ge $max_night_light  ];then
	new_light=$(($old_light + 100))
	sudo su << EOF
	echo $new_light > $light_conf 
	exit 
EOF
elif [ $old_light -lt $max_night_light ];then
	new_light=$(($old_light + 10))
	sudo su << EOF
	echo $new_light > $light_conf
	exit
EOF
fi 
