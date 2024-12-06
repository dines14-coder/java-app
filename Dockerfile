FROM adoptopenjdk/openjdk11:alpine-jre

WORKDIR /app

COPY . .

CMD ["java","Helloworld"]
