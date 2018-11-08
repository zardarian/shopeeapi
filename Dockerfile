FROM python:3.4-alpine
ADD . /code
WORKDIR /code
RUN apk --no-cache add --virtual build-dependencies \
      build-base \
      py-mysqldb \
      gcc \
      libc-dev \
      libffi-dev \
      mariadb-dev \
      && pip install -qq -r requirements.txt \
      && rm -rf .cache/pip \
      && apk del build-dependencies
RUN apk -q --no-cache add mysql-client-libs
CMD ["python", "shopeeapi.py"]
