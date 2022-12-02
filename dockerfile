FROM python:3.7-alpine
EXPOSE 8000
WORKDIR /django/mysite/
COPY requirements.txt .
RUN pip3 install -r requirements.txt --no-cache-dir
COPY ./django/mysite/ /django/
ENTRYPOINT ["python3"] 
CMD ["manage.py", "runserver", "0.0.0.0:8000"]

FROM builder as dev-envs
RUN <<EOF
apk update
apk add git
EOF

RUN <<EOF
addgroup -S docker
adduser -S --shell /bin/bash --ingroup docker vscode
EOF
# install Docker tools (cli, buildx, compose)
COPY --from=gloursdocker/docker / /
CMD ["manage.py", "runserver", "0.0.0.0:8000"]
