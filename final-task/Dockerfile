FROM openjdk:8-alpine
WORKDIR /app

COPY ./jars/calc-client-1.0-SNAPSHOT-jar-with-dependencies.jar /app

CMD ["sh", "-c", "java -cp calc-client-1.0-SNAPSHOT-jar-with-dependencies.jar CalcClient ${ELB_DNS}"]