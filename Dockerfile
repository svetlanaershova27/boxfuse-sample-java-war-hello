FROM ubuntu:18.04
RUN apt-get update
RUN apt install tomcat9 -y
FROM maven:3.6-jdk-11 as build
WORKDIR /tmp/
COPY src ./src
COPY pom.xml .
RUN mvn clean package
FROM tomcat:9.0-jre11-openjdk
COPY --from=build /tmp/target/hello-1.0.war /var/lib/tomcat9/webapps/hello-1.0.war
WORKDIR /var/lib/tomcat9/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
