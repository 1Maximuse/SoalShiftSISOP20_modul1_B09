#!/bin/bash

a=$(awk -F '	' '
{
	if ($13 != "Region")
		data[$13] += $21
}
END {
	for (i in data) {
		print data[i] " " i
	}
}' Sample-Superstore.tsv | sort -g -k 1 | grep -oP '(?<=[0-9.] ).*' | head -n 1)
echo "Region dengan profit minimum:"
echo "$a"
b=$(awk -F '	' -v a="$a" '
$13 == a {
	data[$11] += $21
}
END {
	print a
	for (i in data) {
		print data[i] " " i
	}
}' Sample-Superstore.tsv | sort -g -k 1 | grep -oP '(?<=[0-9.] ).*' | head -n 2)
echo "State dengan profit minimum:"
echo "$b"
c=$(awk -F '	' -v b="$b" '
BEGIN {
	split(b, check, "\n")
}
$11 == check[1] || $11 == check[2] {
	data[$17] += $21
}
END {
	for (i in data) {
		print data[i] " " i
	}
}' Sample-Superstore.tsv | sort -g -k 1 | grep -oP '(?<=[0-9.] ).*' | tr -d '"' | head -n 10)
echo "Produk dengan profit minimum:"
echo "$c"
