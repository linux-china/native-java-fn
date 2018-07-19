# Apache Maven docker image used for maven build
FROM maven:3.5.3-jdk-8 AS build-jar

# Add project sources
ADD src app/src/
ADD pom.xml app/

# Set workdir
WORKDIR /app

# Execute maven build
RUN mvn -DskipTests package dependency:copy-dependencies

# GraalVM docker image used for AoT compilation
FROM panga/graalvm-ce:latest as build-aot

# Copy application jars from build-jar stage
COPY --from=build-jar /app/target/*.jar /app/
COPY --from=build-jar /app/target/dependency/*.jar /app/

# Add reflection.json from function folder
ADD reflection.json /app/

# Execute native-image tool and custom settings
RUN native-image \
    --no-server \
    --static \
    -H:Name=app/fn \
    -H:ReflectionConfigurationFiles=app/reflection.json \
    -H:+ReportUnsupportedElementsAtRuntime \
    -cp "app/*" \
    com.fnproject.fn.runtime.EntryPoint

# Create new image from scratch
FROM scratch

# Set workdir
WORKDIR /app

# Copy generated native executable from build-aot stage
COPY --from=build-aot /app/fn /app/fn

# Set entrypoint to native executable
ENTRYPOINT [ "./fn" ]

# Set command to function entrypoint
CMD [ "org.mvnsearch.fn.HelloFunction::handleRequest" ]