# docker build -t springbootapp .
# docker run -t springbootapp
FROM openjdk:8-jdk-alpine
VOLUME /tmp
COPY target/RestApp-0.0.1-SNAPSHOT.jar RestApp-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/RestApp-0.0.1-SNAPSHOT.jar"]
#EXPOSE 8080:8080
