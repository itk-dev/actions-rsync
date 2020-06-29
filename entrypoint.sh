#!/bin/sh

set -eu

SSHPATH="/root/.ssh"
mkdir -p "$SSHPATH"

# Setup ssh keys.
echo "$INPUT_KEY" > "$SSHPATH/id_rsa"
echo "$INPUT_CERT" > "$SSHPATH/id_rsa-cert.pub"
chmod 700 "$SSHPATH"
chmod 600 "$SSHPATH/id_rsa"
chmod 600 "$SSHPATH/id_rsa-cert.pub"

# Create known hosts.
touch "$SSHPATH/known_hosts"
chmod 600 "$SSHPATH/known_hosts"

# Start agent and add cert
eval `ssh-agent -s`
ssh-add

# Variables.
SHELL="ssh -o StrictHostKeyChecking=no -p $INPUT_PORT"
LOCAL_PATH="$GITHUB_WORKSPACE/$INPUT_SRC"

# Run the rsync command.
sh -c "rsync $INPUT_ARGS -e '$SHELL' $LOCAL_PATH $INPUT_USER@$INPUT_HOST:$INPUT_DEST"
