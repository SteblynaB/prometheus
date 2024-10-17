1. Устанавливаем Node Exporter на все сервера, которые будем мониторить:

bash <(curl -s https://raw.githubusercontent.com/SteblynaB/prometheus/main/install.sh)


2. Выбираем один сервер, на который будем ставить сервис мониторинга, и устанавливаем на него необходимый софт:

bash <(curl -s https://raw.githubusercontent.com/SteblynaB/prometheus/main/install_main.sh)

Можно проверить все ли стало корректно:
sudo systemctl status prometheus
sudo systemctl status grafana-server


3. На основной сервер записываем данные каждого сервера, который мониториться (его IP и имя для вывода в дашборд):

bash <(curl -s https://raw.githubusercontent.com/SteblynaB/prometheus/main/update_prometheus.sh)

4. Настраиваем Grafana

Шаг 1. Переходим на http://АДРЕС_СЕРВЕРА:3000/, входим под admin/admin и сразу меняем пароль.

Шаг 2. Выбираем «Add data source» и указываем первый из списка вариант Prometheus. Заполняем поле URL значением http://localhost:9090, далее «Save & Test».

Шаг 3. Переходим на http://АДРЕС_СЕРВЕРА:3000/dashboard/import и в поле «Or paste JSON» вставляем весь текст из json файла:

https://github.com/SteblynaB/prometheus/blob/main/Grafana_model.json

Далее Load, на следующей странице можем изменить Name и далее Import
