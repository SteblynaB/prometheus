read -p "Введите SERVER_IP: " SERVER_IP
read -p "Введите SERVER_NAME: " SERVER_NAME

echo "      - targets:" >> /etc/prometheus/prometheus.yml
echo "          - '$SERVER_IP:9100'" >> /etc/prometheus/prometheus.yml
echo "        labels:" >> /etc/prometheus/prometheus.yml
echo "          instance: '$SERVER_IP'" >> /etc/prometheus/prometheus.yml
echo "          nodename: '$SERVER_NAME'" >>
