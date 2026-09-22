# Sabse best tarika: Kyunki project ko Java 17 chahiye
FROM maven:3.9.11-eclipse-temurin-17 AS builder


WORKDIR /app
COPY . .

# Ab bina kisi extra flag ke seedhe build ho jayega
RUN mvn package -DskipTests


from eclipse-temurin:17-jdk-alpine
workdir app/
copy --from=builder /app/target/spring-petclinic-4.0.0-SNAPSHOT.jar  /app/target/spring-petclinic-4.0.0-SNAPSHOT.jar

EXPOSE 8080
CMD ["java", "-jar", "target/spring-petclinic-4.0.0-SNAPSHOT.jar", "--server.address=0.0.0.0"]


