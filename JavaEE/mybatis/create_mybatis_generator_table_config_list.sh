#!/bin/bash

if [[ x$1 = x || x$2 = x ]];then
echo "Usage:
	bash $0 {DatabaseName} {mysqldump.sql}"
	exit 2;
fi
part1="<table schema=\"$1\" tableName=\"";
part2="\" enableSelectByPrimaryKey=\"true\" enableDeleteByPrimaryKey=\"true\" enableUpdateByPrimaryKey=\"true\" enableInsert=\"true\"/>"
grep CREATE $2 | awk '{print $3 }' | sed -n 's/`/#/gp' | sed -n "s/#/${part1}/p" | sed -n "s%#%${part2}%p" > ${2}_table.xml
