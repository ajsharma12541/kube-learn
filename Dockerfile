FROM maven:3.8.1-adoptopenjdk-11 as build
WORKDIR /app

COPY . /app/kube-learn
WORKDIR /app/kube-learn
CMD ["mvn","clean","package"]

FROM adoptopenjdk:11-jre-hotspot
COPY --from=build /app/kube-learn/target/kube-learn-1.0-SNAPSHOT.jar /app/
#CMD ["java", "-cp", "/app/kube-learn-1.0-SNAPSHOT.jar", "Simple"]