from flask import Flask
from flask import request
import ssl

app = Flask(__name__)

@app.route('/root')
def index() :
    return "root"

if __name__=='__main__':
    app.run(host='192.168.1.194', port=8080) #host='본인 ip'

