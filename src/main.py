#!/usr/bin/env python2
from flask import Flask, request, redirect
from multiprocessing import Process

app = Flask(__name__)


# make development easier and disable browser-cache
@app.after_request
def add_header(response):
    response.headers["Cache-Control"] = "public, max-age=0"
    return response


@app.route('/')
def index():
    return app.send_static_file('index.html')


@app.route('/<path:path>')
def static_file(path):
    return app.send_static_file(path)


@app.errorhandler(404)
def page_not_found(e):
    return index()

if __name__ == "__main__":
    Process(target=lambda: app.run(host="192.168.1.2", port=443, ssl_context='adhoc', threaded=True)).start()
    app.run(host="192.168.1.2", port=80, threaded=True)
