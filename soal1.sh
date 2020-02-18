#!/bin/bash

a=$(awk '
{
	if ($13 != "Region")
		data[$13] += $21
}
END {
	for (i in data) {
		print data[i] " " i
	}
}' FPAT='([^,]*)|(".*")' Sample-Superstore.csv | sort -g -k 1 | grep -oP '(?<=[0-9.] ).*' | head -n 1)
echo "Region dengan profit minimum:"
echo "$a"
b=$(awk -v a="$a" '
$13 == a {
	data[$11] += $21
}
END {
	print a
	for (i in data) {
		print data[i] " " i
	}
}' FPAT='([^,]*)|(".*")' Sample-Superstore.csv | sort -g -k 1 | grep -oP '(?<=[0-9.] ).*' | head -n 2)
echo "State dengan profit minimum:"
echo "$b"
c=$(awk -v b="$b" '
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
}' FPAT='([^,]*)|(".*")' Sample-Superstore.csv | sort -g -k 1 | grep -oP '(?<=[0-9.] ).*' | tr -d '"' | head -n 10)
echo "Produk dengan profit minimum:"
echo "$c"
