# Stage 1: Build the app with Maven and Java 21
FROM public.ecr.aws/amazoncorretto/amazoncorretto:21 as builder
RUN yum install -y maven

WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Runtime
FROM public.ecr.aws/amazoncorretto/amazoncorretto:21
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]

