FROM maven:3.9.3 AS build
WORKDIR /app
#ARG  CONTAINER_PORT
COPY pom.xml /app
RUN  mvn dependency:resolve
COPY . /app
RUN  mvn clean
RUN  mvn package -DskipTests -X

#FROM openjdk:17
FROM eclipse-temurin:17-jdk-apline
COPY --from=build /app/target/*.jar app.jar
ADD target/*.jar app.jar
#EXPOSE ${CONTAINER_PORT}
VOLUME /tmp
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]
CMD ["java","-jar","app.jar"]
