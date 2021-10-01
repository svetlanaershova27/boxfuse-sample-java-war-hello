FROM maven:3.6.0-jdk-11 as built
WORKDIR /tmp/
COPY src ./src
COPY pom.xml .
RUN mvn clean package





