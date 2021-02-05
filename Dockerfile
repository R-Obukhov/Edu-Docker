FROM maven:3.6.1-jdk-8-alpine AS MAVEN_BUILD

#RUN apt update && apt upgrade -y
COPY ./ ./
RUN mvn clean package

FROM openjdk:8-jre-alpine3.9
COPY --from=MAVEN_BUILD /metamorphosis-1.6.7/target/metamorphosis-1.6.7.jar /demo.jar
CMD ["java", "-jar", "/demo.jar"]
