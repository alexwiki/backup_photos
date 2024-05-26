#!/bin/bash

# 1st argument -> source directory
# 2nd argument -> destination directory
SRC_DIR=$1
DEST_DIR=$2

# Find and copy files modified within the last year.
find "$SRC_DIR" -type f -mtime -365 -exec bash -c '
  for filepath do
    # Compute relative path
    relative_path="${filepath#"$SRC_DIR/"}"
    dest_path="$DEST_DIR/$relative_path"

    # Create the destination directory if it doesn't exist
    mkdir -p "$(dirname "$dest_path")"

    # Copy the file
    cp -p "$filepath" "$dest_path"
  done
' bash {} +

echo "Files copied from $SRC_DIR to $DEST_DIR if modified within the last year."
