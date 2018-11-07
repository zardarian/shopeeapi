FROM python:3.4-alpine
ADD . /code
WORKDIR /code
RUN sudo apt-get install libmysqlclient-dev
RUN pip install -r requirements.txt
CMD ["python", "shopeeapi.py"]
