#!/bin/bash

# Read JSON from stdin and use jq to parse it and set the variables
eval "$(jq -r '@sh "IP=\(.ip) OS=\(.os) USER=\(.user)"')"

if [ "$OS" == "linux" ]; then
    SSH_FOLDER="$HOME/.ssh"
    SSH_CONFIG_PATH="$HOME/.ssh/config"
elif [ "$OS" == "windows" ]; then
    SSH_FOLDER="${USERPROFILE}\\.ssh"
    SSH_CONFIG_PATH="${USERPROFILE}\\.ssh\\config"
else
    echo "Unsupported OS"
    exit 1
fi

# Ensure the SSH folder exists
mkdir -p "$SSH_FOLDER"

# Now append or create the SSH config file with the new host entry
{
    echo "Host $IP"
    echo "    HostName $IP"
    echo "    User $USER"
    echo "    IdentityFile $SSH_FOLDER/mtcazurekey"
} >> "$SSH_CONFIG_PATH"

echo "SSH config updated for host $IP" >&2

# The script needs to output a JSON object, so we'll output an empty JSON object
echo '{}'
