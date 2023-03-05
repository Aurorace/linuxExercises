#!/bin/bash
total=0
for num in {1000..2000}; do
    if [[ $num == [01][01][01][01] ]]; then
        total=$(($total+$num))
    fi
done
echo $total