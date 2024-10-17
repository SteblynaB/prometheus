#!/bin/bash

read -p "Введите SERVER_IP: " SERVER_IP
read -p "Введите SERVER_NAME: " SERVER_NAME

{
  echo "      - targets:"
  echo "          - '$SERVER_IP:9100'"
  echo "        labels:"
  echo "          instance: '$SERVER_IP'"
  echo "          nodename: '$SERVER_NAME'"
} >> /etc/prometheus/prometheus.yml
