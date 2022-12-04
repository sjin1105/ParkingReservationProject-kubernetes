FROM ubuntu:latest
EXPOSE 8000
WORKDIR /django/mysite/
COPY requirements.txt .
RUN apt-get update
RUN apt-get -y install libmysqlclient-dev
RUN apt-get -y install python3-dev mysql-client build-essential
RUN apt-get -y install python3-pip
RUN pip3 install -r requirements.txt --no-cache-dir
COPY ./django/mysite/ .

COPY shell.sh .
RUN chmod +x shell.sh
CMD ["./shell.sh"]
