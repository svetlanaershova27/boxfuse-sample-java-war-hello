FROM maven:3.6-jdk-11 as builder_1
WORKDIR /tmp/
COPY src ./src
COPY pom.xml .
RUN mvn clean package
FROM tomcat:9.0.53-jre11-openjdk
COPY --from=builder_1 /tmp/target/hello-1.0.war /usr/local/tomcat/webapps/hello-1.0.war
EXPOSE 8080
CMD ["catalina.sh", "run"]



