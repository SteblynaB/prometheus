#!/bin/bash

# Проверка, существует ли SSH-ключ
if [ ! -f ~/.ssh/id_rsa ]; then
    echo "SSH-ключ не найден. Создание нового ключа..."
    ssh-keygen -t rsa -b 4096 -N "" -f ~/.ssh/id_rsa
    echo "Ключ создан."
fi

# Копирование SSH-ключа на удаленный сервер
echo "Копирование SSH-ключа на удаленный сервер..."
ssh-copy-id -o StrictHostKeyChecking=no root@65.109.134.69

# Получение IP-адреса текущего сервера
SERVER_IP=$(hostname -I | awk '{print $1}')
read -p "Введите SERVER_NAME: " SERVER_NAME

# Подключение к удаленному серверу и добавление конфигурации
ssh -o StrictHostKeyChecking=no root@65.109.134.69 << EOF
{
  echo "      - targets:"
  echo "          - '$SERVER_IP:9100'"
  echo "        labels:"
  echo "          instance: '$SERVER_IP'"
  echo "          nodename: '$SERVER_NAME'"
} | sudo tee -a /etc/prometheus/prometheus.yml
EOF

echo "Конфигурация успешно обновлена!"
