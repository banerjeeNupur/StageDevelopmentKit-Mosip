FROM openjdk:11.0.4-jre-slim-buster
RUN mkdir /config

COPY mosip-config-jar/kernel-config-server-1.1.2-rc3.jar .
COPY mosip-config/sandbox ./config


CMD java -jar -Dspring.profiles.active=native -Dspring.cloud.config.server.native.search-locations=file:/config -Dspring.cloud.config.server.accept-empty=true -Dspring.cloud.config.server.git.force-pull=false -Dspring.cloud.config.server.git.cloneOnStart=false -Dspring.cloud.config.server.git.refreshRate=0 kernel-config-server-1.1.2-rc3.jar
