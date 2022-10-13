FROM openjdk:8
copy target/config-server-*.jar config-server-0.0.1-RELEASE.jar
EXPOSE 8888
CMD ["java","-jar","/config-server-0.0.1-RELEASE.jar"]