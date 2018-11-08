FROM python:3.4-ubuntu
ADD . /code
WORKDIR /code
RUN apk -q --no-cache add mariadb-client-libs
RUN pip install -r requirements.txt
CMD ["python", "shopeeapi.py"]
