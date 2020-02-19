#!/bin/bash

strip='abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz'
strip2='ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ'
amt=$(stat -c %y $1 | grep -oP '(?<=[^ ] ).*(?=:.*:)')
a=$(echo $1 | grep -oP '.*(?=\.txt)' | tr ${strip:$amt:26}${strip2:$amt:26} ${strip:0:26}${strip2:0:26})
cp $1 $a".txt"
