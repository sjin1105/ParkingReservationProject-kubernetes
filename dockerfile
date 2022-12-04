FROM python:3.7-slim
EXPOSE 8000
WORKDIR /django/mysite/
COPY requirements.txt .
RUN apt-get update
RUN apt-get -y install default-libmysqlclient-dev default-mysql-client python3-pip

RUN pip3 install -r requirements.txt --no-cache-dir
COPY ./django/mysite/ .

COPY shell.sh .
RUN chmod +x shell.sh
CMD ["./shell.sh"]
