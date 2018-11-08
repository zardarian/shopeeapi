FROM python:3.6-alpine
ADD . /code
WORKDIR /code
RUN apk add python3 python3-dev mariadb-dev build-base
RUN pip install -r requirements.txt
CMD ["python", "shopeeapi.py"]
