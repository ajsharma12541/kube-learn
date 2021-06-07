FROM maven:3.8.1-adoptopenjdk-11 as build
WORKDIR /app

COPY . /app/kube-learn
WORKDIR /app/kube-learn
CMD ["mvn","clean","package"]

FROM adoptopenjdk:11-jre-hotspot
WORKDIR /app
COPY --from=build /app/kube-learn/target/*.jar /app/
CMD ["java", "-cp", "/app/kube-learn-1.0-SNAPSHOT.jar", "Simple"]