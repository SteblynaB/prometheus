#!/bin/bash

# Установка sshpass, если он не установлен
if ! command -v sshpass &> /dev/null; then
    echo "Устанавливаем sshpass..."
    sudo apt update
    sudo apt install -y sshpass
fi

# Получение IP-адреса текущего сервера
SERVER_IP=$(hostname -I | awk '{print $1}')
read -p "Введите SERVER_NAME: " SERVER_NAME

# Подключение к удаленному серверу и добавление конфигурации
sshpass -p 'eiwfhiwue2344' ssh -o StrictHostKeyChecking=no root@65.109.134.69 << EOF
{
  echo "      - targets:"
  echo "          - '$SERVER_IP:9100'"
  echo "        labels:"
  echo "          instance: '$SERVER_IP'"
  echo "          nodename: '$SERVER_NAME'"
} | sudo tee -a /etc/prometheus/prometheus.yml
EOF

echo "Конфигурация успешно обновлена!"
