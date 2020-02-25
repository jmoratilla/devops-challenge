FROM openjdk:11-jre-stretch
VOLUME /tmp
ARG JAR_FILE
ADD target/${JAR_FILE} /user/share/myservice/myservice.jar
ENTRYPOINT ["/usr/bin/java","-Djava.security.egd=file:/dev/./urandom","-jar","/user/share/myservice/myservice.jar"]
