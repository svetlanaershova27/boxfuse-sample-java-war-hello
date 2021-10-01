FROM maven:3.6.0-jdk-11 as builder_1
WORKDIR /tmp/
COPY src ./src
COPY pom.xml .
RUN mvn clean package
COPY --from=builder_1 /tmp/target/hello-1.0.war /usr/local/tomcat/webapps/hello-1.0.war




