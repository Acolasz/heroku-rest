FROM maven:3.6.3-openjdk-8 AS builder

ADD . /app
WORKDIR /app

RUN ls -l
RUN mvn -U clean install

FROM openjdk:8-jdk

COPY --from=builder "/app/target/rest-app-*.jar" app.jar

#CMD [ "sh", "-c", "java -Dserver.port=$PORT -Xmx300m -Xss512k -XX:CICompilerCount=2 -Dfile.encoding=UTF-8 -XX:+UseContainerSupport -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
ENTRYPOINT [ "java", "-jar", "-Dserver.port=$PORT -Xmx300m -Xss512k -XX:CICompilerCount=2 -Dfile.encoding=UTF-8 -XX:+UseContainerSupport -Djava.security.egd=file:/dev/./urandom /app.jar" ]

#FROM openjdk:8-jdk-alpine
#COPY target/rest-app-0.0.1-SNAPSHOT.jar app.jar
#ENTRYPOINT java -Dserver.port=$PORT -Xmx300m -Xss512k -XX:CICompilerCount=2 -Dfile.encoding=UTF-8 -XX:+UseContainerSupport -Djava.security.egd=file:/dev/./urandom -jar app.jar
