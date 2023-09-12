# В репозитории хранятся файлы для выполнения тестового задания

1. Работа выполнялась на одном хосте с использованием системы виртуализации virtualbox. В качестве сервера A использовалась виртуальная машина с образом Ubuntu-server 22.04 с предустановленным ssh-сервером и docker. В качестве сервера B использоваль домашняя система Ubuntu 22.04. Для их взаимодействия в одной сети на виртуальной машине был прокинут сетевой мост.

2. Сборка [Java-приложения](https://github.com/monodot/spring-boot-with-metrics) в Docker-образ выполняется с использованием [Dockerfile](https://github.com/Antoshik143/test_JustAI/Dockerfile) и выполнением следующей команды:
```
docker build -t java-app .
```

3. Разворачиваем контейнер на основе собранного docker-образа при помощи файла [docker-compose.yml](https://github.com/Antoshik143/test_JustAI/docker-compose.yml), используя команду:

```
docker-compose up
```