FROM python:latest
 
COPY Pipfile* /data/
 
WORKDIR /data

RUN pip3 install pipenv

RUN pipenv install --system
