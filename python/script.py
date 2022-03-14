#import pandas as pd
#import matplotlib.pyplot as plt
from flask import Flask, jsonify, request, render_template, url_for 
from db_operations import get_db_values, add_identity

# data = pd.read_csv("CAC40_monthly.csv")
# df = pd.DataFrame(data, columns=['Date','Open', 'high', 'low', 'Close', 'adjclose', 'volume'])
# df['Date'] = pd.to_datetime(df['Date']).astype('datetime64[ns]')
# print(df)
# df.plot(x='Date', y='Close', kind='line')
# plt.show()

app = Flask(__name__)

@app.route('/')
def index():
    data = get_db_values()
    return render_template("index.html", all_text = data)


@app.route('/python')
def redirect():
    return index()

@app.route('/add', methods =["GET", "POST"])
def add():
    if request.method == 'POST':
        id = request.form.get("id")
        name = request.form.get("name")
        sex = request.form.get("sex")
        age = request.form.get("age")
        height = request.form.get("height")
        nationality = request.form.get("nationality")
        add_id = add_identity(id,name,sex,age,height,nationality)
        print(name)
        return redirect()
    else:
        return index()

if __name__ == '__main__':
    app.run(host='0.0.0.0', port='5000')