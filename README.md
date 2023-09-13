# В репозитории хранятся файлы для выполнения тестового задания

1. Работа выполнялась на одном хосте с использованием системы виртуализации virtualbox. В качестве сервера A использовалась виртуальная машина с образом Ubuntu-server 22.04 с предустановленным ssh-сервером и docker (ip-adress = 192.168.0.159). В качестве сервера B использоваль домашняя система Ubuntu 22.04. Для их взаимодействия в одной сети на виртуальной машине был прокинут сетевой мост.

2. Сборка [Java-приложения](https://github.com/monodot/spring-boot-with-metrics) в Docker-образ выполняется с использованием [Dockerfile](https://github.com/Antoshik143/test_JustAI/blob/main/docker_files/Dockerfile) и выполнением следующей команды:
```
docker build -t java-app .
```

3. Разворачиваем контейнер на основе собранного docker-образа при помощи файла [docker-compose.yml](https://github.com/Antoshik143/test_JustAI/blob/main/docker_files/docker-compose.yml), используя команду:

```
docker-compose up
```
Для простоты развертывания с использованием Ansible мы создали пару ssh-ключей и добавили публичный ключ на виртуальную машину.
Также для использования Ansible-playbook мы дополнительно установили на сервер модули docker и docker-compose, используя команды:
```
pip install docker
pip install docker-compose
```
После чего выполнили следующую команду [ansible-playbook](https://github.com/Antoshik143/test_JustAI/blob/main/ansible_playbook.yml):

```
ansible-playbook -i hosts.ini ansible_playbook.yml
```

4. На виртуальной машине мы развернули Node exporter как демон-службу, используя следующее:
```
scp node_exporter-1.6.0.linux-amd64.tar.gz adminka@192.168.0.159:/home/adminka/
tar xvf node_exporter-1.6.0.linux-amd64.tar.gz
cd node_exporter-1.6.0.linux-amd64/
sudo chmod +x node_exporter
sudo mv node_exporter-1.6.0.linux-amd64 node_exporter
sudo cp -r node_exporter /usr/local/bin/
sudo useradd --no-create-home --shell /bin/false node_exporter
sudo chown -R node_exporter:node_exporter /usr/local/bin/node_exporter/node_exporter 
sudo vi /etc/systemd/system/node_exporter.service
```
Содержимое данного файла представлено в [файле](https://github.com/Antoshik143/test_JustAI/blob/main/systemctl_files/node_exporter.service).

```
sudo systemctl daemon-reload
sudo systemctl enable node_exporter
sudo systemctl start node_exporter
```
Результат настройки Node Exporter
![Node Exporter](https://github.com/Antoshik143/test_JustAI/blob/main/pictures/node_exporter.png)
5. 
