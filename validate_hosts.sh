#!/bin/bash

HOSTS_FILE="$HOME/etc/hosts"

if [ ! -f "$HOSTS_FILE" ]; then
    echo "Fisierul $HOSTS_FILE nu exista!"
    exit 1
fi

while read -r ip rest; do
    if [[ "$ip" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
        echo "Valid: $ip"
    else
        echo "Invalid: $ip"
    fi
done < "$HOSTS_FILE"
