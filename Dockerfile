FROM python:3.6-alpine
ADD . /code
WORKDIR /code
RUN apk add mariadb-client-libs
RUN pip install -r requirements.txt
CMD ["python", "shopeeapi.py"]
