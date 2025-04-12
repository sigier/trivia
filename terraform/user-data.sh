#!/bin/bash

dnf install -y iptables

echo 1 > /proc/sys/net/ipv4/ip_forward
sysctl -w net.ipv4.ip_forward=1
sed -i '/^#net.ipv4.ip_forward=1/s/^#//' /etc/sysctl.conf


iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
