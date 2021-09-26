FROM maven:3.6-jdk-11 as build
WORKDIR /tmp/
COPY src ./src
COPY pom.xml .
RUN mvn clean package
FROM tomcat:9-jdk17-temurin
COPY --from=build /tmp/target/hello-1.0.war /var/lib/tomcat9/webapps/hello-1.0.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
