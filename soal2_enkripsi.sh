#!/bin/bash

strip='abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz'
strip2='ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ'
a=$(echo $1 | grep -oP '.*(?=\.txt)' | tr ${strip:0:26}${strip2:0:26} ${strip:`date +%-H`:26}${strip2:`date +%-H`:26})
cp $1 $a".txt"
