FROM maven:3-jdk-11-openj9 as build
WORKDIR /
VOLUME /tmp

ADD . .
RUN cd home && ls
FROM openjdk:11

VOLUME /tmp
ARG JAR_FILE=target/*.jar
COPY --from=build ${JAR_FILE} spring-app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/spring-app.jar"]