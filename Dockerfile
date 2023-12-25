FROM maven:3.9.3 AS build
WORKDIR /app
#ARG  CONTAINER_PORT
COPY pom.xml /app
RUN  mvn dependency:resolve
COPY . /app
RUN  mvn clean
RUN  mvn package -DskipTests -X

#FROM openjdk:17
FROM eclipse-temurin:17-jdk
COPY --from=build /app/target/*.jar app.jar
#EXPOSE ${CONTAINER_PORT}
EXPOSE 8080
CMD ["java","-jar","app.jar"]
