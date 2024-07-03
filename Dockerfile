FROM python:3.10-alpine

COPY ./requirements.txt /src/requirements.txt
RUN pip3 install --no-cache-dir --upgrade -r /src/requirements.txt

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

COPY . /src
COPY ./main/ /src/main/
COPY ./phones/ /src/phones/



EXPOSE 7015

WORKDIR src

