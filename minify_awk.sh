#!/usr/bin/env bash

sed -E -e '
    s/^[[:space:]]+//;  # Remove leading spaces
    s/^#.*$//;          # Remove comments
    s/[[:space:]]+$//;  # Remove trailing spaces
    /^$/d;              # Remove empty lines
' "$@" |
sed -E '
    :a; N; $!ba; s/\n/ /g                           # Join lines togethers
    s/[[:space:]]+/ /g;                             # Replace multiple spaces with single space
    s/[[:space:]]*([[:punct:]]+)[[:space:]]*/\1/g;  # Remove spaces around operators
    s/;}/}/g;                                       # Remove semicolon before closing brace
    s/\$/$$/g;                                      # escape $ for makefile
'
