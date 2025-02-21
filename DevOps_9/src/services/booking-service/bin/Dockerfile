FROM maven:3.8.6-openjdk-8 AS build

WORKDIR /app

COPY .mvn .mvn
COPY mvnw pom.xml ./
COPY src /app/src

RUN chmod +x mvnw

RUN ./mvnw clean package -DskipTests

FROM openjdk:8-jre-slim

WORKDIR /app

COPY --from=build /app/target/*.jar /app/app.jar

COPY wait-for-it.sh /app/wait-for-it.sh
RUN chmod +x /app/wait-for-it.sh

EXPOSE 8083

CMD ["sh", "-c", "./wait-for-it.sh localhost:5432 -- java -jar /app/app.jar"]
