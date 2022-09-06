import base64
import io
from PIL import Image
from flask import Flask
import requests
from flask import jsonify
from flask import Flask, request
import json as j

app = Flask(__name__)


@app.route('/users')
def hello_world():  # put application's code here
    res = requests.get(url="https://jsonplaceholder.typicode.com/users")
    return jsonify(res.json())


@app.route('/poster', methods=['POST'])
def poster():  # put application's code here
    res = requests.get(url="https://jsonplaceholder.typicode.com/users")
    content_type = request.headers.get('Content-Type')
    print(request.get_data())
    image = Image.open(io.BytesIO(request.get_data()))
    image.save("img.png")
    data = {"id": 20, "name": "superman"}
    return jsonify(data)


if __name__ == '__main__':
    app.run(port=5000)
