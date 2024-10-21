# #!/bin/bash

# # Determine master IP (assuming it has an interface like eth0)
# MASTER_IP=$(ifconfig | grep -A 1 'eth0' | tail -1 | awk '{print $2}')

# # You can customize the method to retrieve the node IP, e.g., using a second interface or network configuration
# # Here we use eth1 as an example for the node
# NODE_IP=$(ifconfig | grep -A 1 'eth1' | tail -1 | awk '{print $2}')

# # Define ansible user and password
# ANSIBLE_USER="avishay"
# ANSIBLE_PASSWORD="Aa135799"

# # Write the results to hosts.ini file
# cat <<EOF > hosts.ini
# [all]
# $MASTER_IP
# $NODE_IP

# [all:vars]
# ansible_user=$ANSIBLE_USER
# ansible_password=$ANSIBLE_PASSWORD

# node=$NODE_IP
# master=$MASTER_IP
# EOF

# echo "[+] Updated hosts.ini with dynamically determined IP addresses:"
# echo "Master IP: $MASTER_IP"
# echo "Node IP: $NODE_IP"


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
