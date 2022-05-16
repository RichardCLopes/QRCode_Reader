from flask import Flask, request, jsonify
from producer import *

app = Flask(__name__)

@app.route('/my_Get', methods = ['GET'])
def my_Get200():
    resp = jsonify(success="OK")
    return resp

@app.route('/my_Post', methods=['POST'])
def my_Post200():
    print("Recebendo Json")
    data2 = request.get_json(force=True)
    print(data2)
    SendJson(data2)
    resp = jsonify(success="OK")
    return resp

if __name__ =="__main__":
    app.run()
