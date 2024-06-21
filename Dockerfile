FROM ubuntu:latest

RUN apt-get update -y;apt-get upgrade -y; apt-get install python3 vim default-jre wget curl -y
RUN mkdir -p /var/www/html
WORKDIR /var/www/html
COPY . . 
EXPOSE 80
CMD ["python3","myscript.py","-p","80"]
