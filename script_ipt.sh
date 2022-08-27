#!/bin/bash

# Port localhost
sudo iptables -A INPUT -i lo -j ACCEPT

# Enable port http, ssh, https
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Enable port DNS
sudo iptables -A INPUT -i eth0 -p udp --dport 53 -j ACCEPT
sudo iptables -A INPUT -i eth0 -p tcp --dport 53 -j ACCEPT
