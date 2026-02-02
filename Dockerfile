# Use official Java 17 JDK image
FROM eclipse-temurin:17-jdk

# Set working directory inside container
WORKDIR /app

# Copy all project files into container
COPY . .

# Make Maven wrapper executable
RUN chmod +x mvnw

# Build the project without tests
RUN ./mvnw clean package -DskipTests

# Expose port if your app runs a web server (change 8080 if needed)
EXPOSE 8080

# Run the packaged jar (update the jar name if needed)
CMD ["java", "-jar", "target/your-app.jar"]
