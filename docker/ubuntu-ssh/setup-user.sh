#!/bin/bash

# Check required environment variables
if [ -z "$USERNAME" ] || [ -z "$PASSWORD" ]; then
    echo "Error: USERNAME and PASSWORD environment variables are required"
    exit 1
fi

# Create user with sudo privileges
useradd -m -s /bin/bash "$USERNAME"
echo "$USERNAME:$PASSWORD" | chpasswd
usermod -aG sudo "$USERNAME"

# Configure sudo without password for convenience
echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > "/etc/sudoers.d/$USERNAME"

# Setup SSH directory for the user
USER_SSH_DIR="/home/$USERNAME/.ssh"
mkdir -p "$USER_SSH_DIR"
chmod 700 "$USER_SSH_DIR"

# If PUBLIC_KEY is provided, add it to authorized_keys
if [ ! -z "$PUBLIC_KEY" ]; then
    echo "$PUBLIC_KEY" > "$USER_SSH_DIR/authorized_keys"
    chmod 600 "$USER_SSH_DIR/authorized_keys"
    chown -R "$USERNAME:$USERNAME" "$USER_SSH_DIR"
fi

# Start SSH daemon
/usr/sbin/sshd -D
