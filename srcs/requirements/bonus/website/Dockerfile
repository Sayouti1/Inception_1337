FROM debian:bullseye

RUN apt update && apt install -y openjdk-17-jre

COPY ./tools/website-0.0.1-SNAPSHOT.jar /website.jar

ENTRYPOINT ["java", "-jar", "/website.jar"]
