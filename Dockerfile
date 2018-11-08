FROM python:3.4-alpine
ADD . /code
WORKDIR /code
RUN apk add --no-cache --virtual .build-deps mariadb-dev ... \
    && apk add --virtual .runtime-deps mariadb-client-libs \
    && pip install -r requirements.txt\
    && apk del .build-deps
CMD ["python", "shopeeapi.py"]
