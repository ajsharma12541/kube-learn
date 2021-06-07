FROM maven:3.8.1-adoptopenjdk-11
WORKDIR /app

COPY . /app/kube-learn
WORKDIR /app/kube-learn
CMD ["mvn","clean","package"]

FROM adoptopenjdk:11-jre-hotspot
WORKDIR /app
COPY --from=0 /home/travis/build/ajsharma12541/kube-learn/target/kube-learn-1.0-SNAPSHOT.jar /app/
CMD ["java", "-cp", "/app/kube-learn-1.0-SNAPSHOT.jar", "Simple"]
#RUN pwd
#RUN ls -l
#CMD ["ls","-l"]