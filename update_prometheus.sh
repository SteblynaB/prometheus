#!/bin/bash

read -p "Введите SERVER_IP: " SERVER_IP
read -p "Введите SERVER_NAME: " SERVER_NAME

ssh root@65.109.134.69 << EOF
{
  echo "      - targets:"
  echo "          - '$SERVER_IP:9100'"
  echo "        labels:"
  echo "          instance: '$SERVER_IP'"
  echo "          nodename: '$SERVER_NAME'"
} | sudo tee -a /etc/prometheus/prometheus.yml
EOF
