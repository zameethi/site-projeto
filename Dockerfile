FROM python:3.9-slim
ENV PYTHONUNBUFFERED 1
ENV DJANGO_SECRET_KEY='zp@!%h23y7k+%vg-e4wr)hbx!3snt=qb$#26^o%@td24m8ahk3'
ENV DEBUG=True
ENV PROD_USER='"azigaib"'
ENV PROD_USER_EMAIL='"azigaib"'
ENV PROD_USER_PASS='"azigaib"'
    
RUN mkdir /webapps
WORKDIR /webapps

# Installing OS Dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
libsqlite3-dev
RUN pip install -U pip setuptools
COPY pyproject.toml poetry.lock ./

# Installing poetry
RUN pip install poetry

RUN  poetry config virtualenvs.create false \
	&& poetry install \
	&& pip uninstall --yes poetry

# Copy files to folder inside container
ADD . /webapps/

# Django service
EXPOSE 8000