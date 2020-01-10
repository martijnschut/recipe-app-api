FROM python:3.7-alpine
MAINTAINER Martijn

# recommedation for running python in a docker container
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

# create user, called user with no home dir -D
# for security purposes, if root has been used and app hacked you can have a potential issue
RUN adduser -D user
USER user
