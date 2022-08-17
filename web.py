from config import PORT
from views.view import app

if __name__ == '__main__':
    app.debug = True
    app.run(threaded=True, port=PORT, host='0.0.0.0')
