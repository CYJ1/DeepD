from flask import Flask, request

app = Flask(__name__)
	    
@app.route('/')
def index():
    return "index"

@app.route('/upload')
def receive_image():
    data = request.get_json() #data = lib>View>view_main>_getImage>image 값
    return data

@app.route('/module')
def module():
    #모델 불러와서 돌림
    return 

@app.route('/download')
def send_result():
    result = 'true' #lib>View>view_result.dart>printResult로 반환
    return result
def send_similarity():
    similarity = '75%' #lib>View>view_search.dart>printSearchResult로 반환
    return similarity

if __name__=='__main__':
    app.run(host='172.30.1.25', port=8080) #host='본인 ip'

