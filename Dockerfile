FROM openjdk:8-jdk-alpine
VOLUME /tmp
COPY target/rest-app-0.0.1-SNAPSHOT.jar app.jar
CMD ["java", "-Dserver.port=$PORT -Xmx300m -Xss512k -XX:CICompilerCount=2 -Dfile.encoding=UTF-8 -XX:+UseContainerSupport -Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]
