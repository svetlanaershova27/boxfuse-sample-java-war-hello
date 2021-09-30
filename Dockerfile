FROM maven:3.6-jdk-11
WORKDIR /tmp/
COPY src ./src
COPY pom.xml .
RUN mvn clean package


