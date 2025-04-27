#!/bin/bash

if [ "$#" -lt 2 ]; then
    exit 1
fi

input_dir="$1"
output_dir="$2"

max_depth=""
if [ "$#" -eq 4 ] && [ "$3" == "--max_depth" ]; then
    max_depth="-maxdepth $4"
fi

mkdir -p "$output_dir"

process_files() {
    local dir="$1"
    local output="$2"

    find "$dir" $max_depth -type f | while read file; do
        base_name=$(basename "$file")
        dest_file="$output/$base_name"
        counter=1
        while [ -f "$dest_file" ]; do
            dest_file="${output}/${base_name%.*}_$counter.${base_name##*.}"
            ((counter++))
        done
        cp "$file" "$dest_file"
    done
}

process_files "$input_dir" "$output_dir"
