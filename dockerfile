# Use Maven image with Java 21 installed
FROM jelastic/maven:3.9.5-openjdk-21

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml file and download dependencies
COPY pom.xml .
# RUN mvn dependency:go-offline

# Copy the entire project source code into the container
COPY src ./src

# Build the application
RUN mvn clean install

# Expose the port that the application will run on
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "target/hello-0.0.1-SNAPSHOT.jar"]
