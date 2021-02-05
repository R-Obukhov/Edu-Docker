FROM maven:3.6.1-jdk-8-alpine AS MAVEN_BUILD

COPY ./ ./
RUN mvn package

FROM tomcat:8.0-alpine
#RUN apt install tomcat9
COPY --from=MAVEN_BUILD target/hello-1.0.war /usr/local/tomcat/webapps/hello-1.0.war
RUN ls /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
