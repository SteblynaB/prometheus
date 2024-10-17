#!/bin/bash

# Получение IP-адреса и имени сервера
read -p "Введите SERVER_IP: " SERVER_IP
read -p "Введите SERVER_NAME: " SERVER_NAME

# Добавление конфигурации в файл prometheus.yml
{
  echo "      - targets:"
  echo "          - '$SERVER_IP:9100'"
  echo "        labels:"
  echo "          instance: '$SERVER_IP'"
  echo "          nodename: '$SERVER_NAME'"
} | sudo tee -a /etc/prometheus/prometheus.yml

# Перезапуск сервиса Prometheus для применения изменений
sudo systemctl restart prometheus

echo "Конфигурация успешно обновлена!"

