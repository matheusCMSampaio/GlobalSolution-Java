# Usando uma imagem base do Maven e Java
FROM eclipse-temurin:17-jdk-alpine AS build

# Copiar todo o projeto para a imagem
COPY . /app

# Definir o diretório de trabalho
WORKDIR /app

# Usar uma imagem base do OpenJDK para rodar a aplicação
FROM openjdk:17-jdk-slim

# Copiar o JAR gerado para a imagem final
COPY --from=build /app/target/GlobalSolution-Java-0.0.1-SNAPSHOT.jar /app/GlobalSolution-Java.jar

# Definir o comando de inicialização do container
ENTRYPOINT ["java", "-jar", "/app/GlobalSolution-Java.jar"]
