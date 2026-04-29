# Stage 1: Build the application using Maven
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
# Copy the pom.xml and source code
COPY pom.xml .
COPY src ./src
# Build the JAR file
RUN mvn clean package -DskipTests

# Stage 2: Create the final lightweight image
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
# Copy the JAR from the build stage
COPY --from=build /app/target/*.jar app.jar
# Expose the port Spring Boot runs on
EXPOSE 8080
# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]