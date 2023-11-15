from flask import Flask
from flask import request
from flask import render_template
import folium
import datetime

microweb_app = Flask(__name__)

@microweb_app.route("/")
def main():
    return render_template("index.html" , datetime_now = datetime.datetime.now())

@microweb_app.route('/map')
def index():
    m = folium.Map(location=[50.8503, 4.3517], zoom_start=10)

    return render_template('map.html')

if __name__ == "__main__":
    microweb_app.run(host="0.0.0.0", port=5050)