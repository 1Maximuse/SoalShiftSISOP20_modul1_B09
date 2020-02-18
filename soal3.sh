#!/bin/bash

for ((i = 1; i <= 28; i++))
do
	wget "https://loremflickr.com/320/240/cat" -O "pdkt_kusuma_$i" -a wget.log
done
