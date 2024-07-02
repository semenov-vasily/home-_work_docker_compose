FROM python:3.10-alpine

COPY ./requirements.txt /src/requirements.txt
RUN pip3 install --no-cache-dir --upgrade -r /src/requirements.txt

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

COPY . /src
COPY ./main/ /src/main/
COPY ./phones/ /src/phones/
#RUN python src/manage.py makemigrations
#RUN python src/manage.py migrate
# RUN python manage.py loaddata db.json

EXPOSE 7000

WORKDIR src

#CMD sh -c "python manage.py migrate && gunicorn main.wsgi:application --bind 0.0.0.0:7000"
#CMD ["python", "manage.py", "runserver", "0.0.0.0:7000"]