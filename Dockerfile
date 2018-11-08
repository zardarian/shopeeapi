FROM python:3.4-alpine
ADD . /code
WORKDIR /code
RUN apk -q --no-cache add mysql-client-libs
RUN pip install -r requirements.txt
CMD ["python", "shopeeapi.py"]
