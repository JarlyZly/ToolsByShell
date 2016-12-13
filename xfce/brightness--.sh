#!/bin/bash

# xfce环境下笔记本屏幕亮度调节
# 请用超级用户执行
# 功能:降低亮度

light_conf="/sys/class/backlight/intel_backlight/brightness"
min_day_light=100
min_night_light=10
old_light=`cat $light_conf`

if [ $old_light -gt $min_day_light  ];then
	new_light=$(($old_light - 100))
	sudo su << EOF
	echo $new_light > $light_conf
	exit
EOF
elif [ $old_light -le $min_day_light ] && [ $old_light -gt $min_night_light ];then
	new_light=$(($old_light - 10))
	sudo su << EOF 
	echo $new_light > $light_conf 
	exit
EOF
fi 

