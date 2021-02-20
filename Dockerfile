FROM openjdk:8-jdk-alpine
VOLUME /tmp
COPY target/rest-app-0.0.1-SNAPSHOT.jar app.jar
CMD ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]
