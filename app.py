from flask import Flask, request, jsonify

app = Flask(__name__)
	    
@app.route('/')
def index():
    return "index"

@app.route('/upload', methods=['GET', 'POST'])
def receive_image():
    if request.method == 'POST':
        base64Image = request.json[0]['image']
        imageStr = base64.b64decode(base64Image)
        nparr = np.fromstring(imageStr, np.uint8)
        data = cv2.imdecode(nparr, cv2.IMREAD_COLOR)
        #data = lib>View>view_main>_getImage>image 값
        #cv2.IMREAD_COLOR in OpenCV 3.1
    else:
        data = 'not post'
    return data

@app.route('/module')
def module():
    #모델 불러와서 돌림
    return 

@app.route('/downloadresult')
def send_result():
    r = 'true' #lib>View>view_result.dart>printResult로 반환
    return r

@app.route('/downloadsimilarity')
def send_similarity():
    s = '75' #lib>View>view_search.dart>printSearchResult로 반환
    return s

if __name__=='__main__':
    app.run(host='192.168.43.236', port=5000) #host='본인 ip'
