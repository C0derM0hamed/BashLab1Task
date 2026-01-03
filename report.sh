#!/bin/bash

echo "--- Sum of IDs by Group ---"
awk 'BEGIN{ FS=":" } { sum[$4]+=$3 } END{ for(g in sum) print "Group " g ": " sum[g] }' /etc/passwd

echo -e "\n--- User-Group Report ---"
awk 'BEGIN{ FS=":"; print "--------------------------" } 
{ groups[$4] = groups[$4] "\n" $1 } 
END{ for (g in groups) { print "Group ID " g " Name:" groups[g]; print "--------------------------" } }' /etc/passwd