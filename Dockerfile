FROM openjdk:8-jdk

#USER root

ENV SPRING_CONFIG_NAME=application \
    SPRING_CONFIG_LOCATION=/app/config/

ARG INSTALL_LOCATION=./target

RUN ls -la ${INSTALL_LOCATION}/
COPY ${INSTALL_LOCATION}/*.jar /app/adapter.jar
#COPY ${INSTALL_LOCATION}/config/entrypoint.sh /

#RUN mkdir -p /app/properties \
#    && mkdir configs \
#    && chmod 700 /entrypoint.sh

#EXPOSE 8081
#
#RUN useradd -ms /bin/bash "user" \
#    && chown -R "user" /var/ \
#    && chown -R "user" /opt/ \
#    && chown -R "user" /app/ \
#    && chown -R "user" /configs/ \
#    && chown -R "user" /entrypoint.sh \
#    && chmod -R go-w /opt/ \
#    && chmod -R go-w /usr/local/bin \
#    && chmod -R go-w /var/lib \
#    && usermod -aG sudo "user"
#
#USER user

#ENTRYPOINT ["/entrypoint.sh"]
RUN echo $PORT
ENTRYPOINT [ "sh", "-c", "java -Dserver.port=$PORT -Xmx300m -Xss512k -XX:CICompilerCount=2 -Dfile.encoding=UTF-8 -XX:+UseContainerSupport -Djava.security.egd=file:/dev/./urandom -jar /app/adapter.jar" ]
