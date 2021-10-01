FROM maven:3.6.0-jdk-11 as built
WORKDIR /tmp/
COPY src ./src
COPY pom.xml .
RUN mvn clean package
FROM tomcat:8.5.3-jre8-alpine
COPY --from-built /tmp/target/hello-1.0.war /usr/local/tomcat/webapps/hello-1.0.war
CMD ["catalina.sh", "run"]




