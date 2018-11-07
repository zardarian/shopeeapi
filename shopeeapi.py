import MySQLdb
import flask
from flask import Flask, json, request
from flask_cors import CORS
from flaskext.mysql import MySQL

mysql = MySQL()
app = Flask(__name__)
mysql.init_app(app)


def mySqlConnection():
    mysqlconn = MySQLdb.connect(
        database="shopeedb",
        user="root",
        password="zarda123",
        host="localhost"
    )
    return mysqlconn

# GET


@app.route("/getListOfExchangeRatesWeekly/<date>", methods=['GET'])
def getListOfExchangeRatesWeekly(date):
    dbconn = mySqlConnection()
    cursor = dbconn.cursor(MySQLdb.cursors.DictCursor)
    if (flask.request.method == 'GET'):
        query = "SELECT c.id, e.BEGDA, e.EXRT0, e.EXRT1, e.RATES from exchrate e LEFT JOIN currexch c ON (e.EXRT0 = c.EXRT0 and e.EXRT1 = c.exrt1) where (BEGDA <= '" + \
            date + \
                "' and BEGDA > date_add('" + date + \
            "', interval -7 day)) ORDER BY id ASC"
        cursor.execute(query)
        data = cursor.fetchall()
        print(data[0]['RATES'])
        if not data:
            output = {"data": data,
                      "message": "failed to fetch data", "status": "failed"}
        else:
            output = {"data": data,
                      "message": "success to fetch data", "status": "success"}
    cursor.close()
    dbconn.close()
    return json.dumps(output)


@app.route("/getListOfExchangeRates7Latest", methods=['GET'])
def getListOfExchangeRates7Latest():
    dbconn = mySqlConnection()
    cursor = dbconn.cursor(MySQLdb.cursors.DictCursor)
    if (flask.request.method == 'GET'):
        query = "SELECT * from exchrate ORDER BY id DESC LIMIT 7"
        cursor.execute(query)
        data = cursor.fetchall()
        if not data:
            output = {"data": data,
                      "message": "failed to fetch data", "status": "failed"}
        else:
            if (len(data) < 7):
                output = {"data": data, "variance": "insufficient data",
                          "average": "insufficient data", "message": "insufficient data", "status": "success"}
            else:
                avg = 0
                maxi = data[0]['RATES']
                mini = data[0]['RATES']
                for i in data:
                    avg = avg + i['RATES']
                    if (i['RATES'] > maxi):
                        maxi = i['RATES']
                    elif (i['RATES'] <= mini):
                        mini = i['RATES']
                output = {"data": data, "variance": maxi-mini, "average": avg /
                          7, "message": "success to fetch data", "status": "success"}
    cursor.close()
    dbconn.close()
    return json.dumps(output)

# POST


@app.route("/postDailyExchangeRate", methods=['POST'])
def postDailyExchangeRate():
    dbconn = mySqlConnection()
    cursor = dbconn.cursor(MySQLdb.cursors.DictCursor)
    dataPost = request.get_json(force=True)
    if (flask.request.method == 'POST'):
        query = "SELECT * from currexch WHERE EXRT0 = '" + \
            dataPost['EXRT0'] + "' AND EXRT1 = '" + dataPost['EXRT1'] + "'"
        cursor.execute(query)
        data = cursor.fetchall()
        if not data:
            output = {
                "data": data, "message": "currency exchange is not listed", "status": "failed"}
            return output
        else:
            cursor.execute("INSERT INTO exchrate (BEGDA, EXRT0, EXRT1, RATES) VALUES (%s, %s, %s, %s)",
                           (dataPost['BEGDA'], dataPost['EXRT0'], dataPost['EXRT1'], dataPost['RATES']))
            dbconn.commit()
            cursor.close()
            dbconn.close()
            return "success to insert data"
    return "failed to insert data"


@app.route("/postCurrencyExchange", methods=['POST'])
def postCurrencyExchange():
    dbconn = mySqlConnection()
    cursor = dbconn.cursor(MySQLdb.cursors.DictCursor)
    dataPost = request.get_json(force=True)
    if (flask.request.method == 'POST'):
        query = "SELECT * from currexch WHERE EXRT0 = '" + \
            dataPost['EXRT0'] + "' AND EXRT1 = '" + dataPost['EXRT1'] + "'"
        cursor.execute(query)
        data = cursor.fetchall()
        if not data:
            cursor.execute("INSERT INTO currexch (EXRT0, EXRT1) VALUES (%s, %s)",
                           (dataPost['EXRT0'], dataPost['EXRT1']))
            dbconn.commit()
        else:
            return "data exist"
        cursor.close()
        dbconn.close()
        return "success to insert data"
    return "failed to insert data"

# DELETE


@app.route("/deleteCurrencyExchange/<exrt0>/<exrt1>", methods=['DELETE'])
def deleteCurrencyExchange(exrt0, exrt1):
    dbconn = mySqlConnection()
    cursor = dbconn.cursor(MySQLdb.cursors.DictCursor)
    if (flask.request.method == 'DELETE'):
        cursor.execute("DELETE from currexch WHERE EXRT0 = '" +
                       exrt0 + "' AND EXRT1 = '" + exrt1 + "'")
        dbconn.commit()
        cursor.close()
        dbconn.close()
        return "success to delete data"
    return "failed to delete data"


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')
