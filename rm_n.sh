#!/bin/bash

# Usage statement
usage() {
    echo "usage: $0 <dir> <n>" 1>&2
}

# Check for correct number of arguments
if [ $# -ne 2 ]; then
    usage
    exit 1
fi

# Check if directory exists
if [ ! -d "$1" ]; then
    echo "$1: No such directory" 1>&2
    usage
    exit 1
fi

# Remove files larger than n bytes
find "$1" -type f -size "+${2}c" -delete

