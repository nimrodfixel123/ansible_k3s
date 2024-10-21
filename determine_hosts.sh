

#!/bin/bash

# Use the local machine's IP for both master and node
MASTER_IP="127.0.0.1"
NODE_IP="127.0.0.1"

# Define ansible user and password (update this to your local machine's user)
ANSIBLE_USER="your_username"
ANSIBLE_PASSWORD="your_password"

# Write the results to hosts.ini file
cat <<EOF > hosts.ini
[all]
$MASTER_IP

[all:vars]
ansible_user=$ANSIBLE_USER
ansible_password=$ANSIBLE_PASSWORD

node=$NODE_IP
master=$MASTER_IP
EOF

echo "[+] Updated hosts.ini with local machine's IP addresses for both master and node."
