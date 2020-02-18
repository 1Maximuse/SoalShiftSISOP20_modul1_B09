#!/bin/bash

mkdir duplicate
mkdir kenangan
for ((i = 1; i <= 28; i++))
do
	if [ -f "pdkt_kusuma_$i" ]
	then
		for ((j = $(($i+1)); j <= 28; j++))
		do
			if [ -f "pdkt_kusuma_$j" ]
			then
				if cmp -s "pdkt_kusuma_$i" "pdkt_kusuma_$j"
				then
					mv "pdkt_kusuma_$j" "./duplicate/duplicate_$j"
				fi
			fi
		done
	fi
done
mv -t "./kenangan" `ls | grep "pdkt_kusuma_"`
cd kenangan
for f in pdkt_kusuma_*
do
	mv "$f" "kenangan_`echo $f | grep -oP '(?<=pdkt_kusuma_)[0-9]*'`"
done
cd ..
cp "wget.log" "wget.log.bak"
