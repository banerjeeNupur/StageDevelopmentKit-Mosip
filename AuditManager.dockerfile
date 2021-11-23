FROM openjdk:11.0.4-jre-slim-buster
COPY commons/kernel/kernel-auditmanager-service/target/kernel-auditmanager-service-1.1.5.3.jar .
COPY commons/kernel/kernel-auth-adapter/target/kernel-auth-adapter-1.1.5.3.jar .
ENV AUTH_SERVICE=http://mosip_auth_service:8091
CMD java -jar -Dloader.path=/kernel-auth-adapter-1.1.5.3.jar -jar -Dspring.profiles.active=local kernel-auditmanager-service-1.1.5.3.jar --auth.server.validate.url=${AUTH_SERVICE}/authmanager/authorize/validateToken

