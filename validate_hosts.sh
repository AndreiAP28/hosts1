#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Folosire: $0 <fisier_hosts>"
    exit 1
fi

HOSTS_FILE="$1"

if [ ! -f "$HOSTS_FILE" ]; then
    echo "Eroare: fisierul '$HOSTS_FILE' nu exista."
    exit 1
fi

while read -r ip rest; do
    if [[ "$ip" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
        echo "Valid: $ip"
    else
        echo "Invalid: $ip"
    fi
done < "$HOSTS_FILE"
