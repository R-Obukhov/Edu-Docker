FROM maven:3.6.1-jdk-8-alpine AS MAVEN_BUILD

RUN apt update && apt upgrade -y
COPY ./ ./
RUN mvn clean package


