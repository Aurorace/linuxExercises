#!/bin/bash
cat Property_Tax_Roll.csv | \
grep "MADISON SCHOOLS" | \
cut -d , -f 7 | \
    { sum=0; count=0; while read n; do count=$(($count + 1)); sum=$(($sum + $n)); done; mean=$(echo "scale=6; $sum/$count" | bc); echo $mean;}