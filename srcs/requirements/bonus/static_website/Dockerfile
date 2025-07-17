FROM debian:bullseye

RUN apt update && apt install -y openjdk-17-jre

COPY ./tools/static_website-0.0.1-SNAPSHOT.jar /static_website.jar

CMD ["java", "-jar", "/static_website.jar"]
