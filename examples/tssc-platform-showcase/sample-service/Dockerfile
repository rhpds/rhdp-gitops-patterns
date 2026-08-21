FROM registry.access.redhat.com/ubi9/openjdk-21:1.21 AS build
USER root
WORKDIR /build
COPY pom.xml ./
COPY src ./src
RUN mvn -B -DskipTests package

FROM registry.access.redhat.com/ubi9/openjdk-21-runtime:1.21
WORKDIR /deployments
COPY --from=build /build/target/sample-service-*.jar /deployments/app.jar
EXPOSE 8080
USER 185
ENTRYPOINT ["java", "-jar", "/deployments/app.jar"]
