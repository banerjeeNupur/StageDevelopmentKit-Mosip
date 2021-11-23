FROM openjdk:11.0.4-jre-slim-buster
COPY commons/kernel/kernel-auth-adapter/target/kernel-auth-adapter-1.1.5.3.jar kernel-auth-adapter-1.1.5.3.jar
COPY commons/kernel/kernel-auth-service/target/kernel-auth-service-1.1.5.3.jar kernel-auth-service-1.1.5.3.jar
CMD java -jar -Dloader.path=/kernel-auth-adapter-1.1.5.3.jar -jar -Dspring.profiles.active=local /kernel-auth-service-1.1.5.3.jar
