# Используем в качестве базового образа OpenJDK 11
FROM adoptopenjdk:11-jdk-hotspot

# Установим рабочую директорию внутри контейнера
WORKDIR /app

# Копируем директорию внутрь контейнера
COPY /spring-boot-with-metrics/ /app/
RUN apt-get update && apt-get install -y maven

# Установим переменную среды JAVA_OPTS
ENV JAVA_OPTS=""

# Запустите приложение при запуске контейнера
ENTRYPOINT mvn clean spring-boot:run