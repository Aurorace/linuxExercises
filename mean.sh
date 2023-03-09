#!/bin/bash

if [ "$#" -lt 1 ]; then
  echo "usage: $0 <column> [file.csv]" >&2
  exit 1
fi

column="$1"
file="${2:-/dev/stdin}"

sum=0
count=0

cut -d, -f"$column" "$file" | tail -n+2 | {
  while read value; do
    sum=$(echo "$sum + $value" | bc)
    count=$((count + 1))
  done

  if [ "$count" -gt 0 ]; then
    mean=$(echo "scale=10; $sum / $count" | bc)
    echo "$mean"
  else
    echo "error: no data" >&2
    exit 1
  fi
}

