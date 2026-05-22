from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)

# Dummy credentials for demo
USERNAME = "admin"
PASSWORD = "password123"

@app.route("/")
def home():
    return redirect(url_for("login"))

@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        user = request.form["username"]
        pwd = request.form["password"]
        if user == USERNAME and pwd == PASSWORD:
            return "✅ Login successful! Welcome, {}.".format(user)
        else:
            return "❌ Invalid credentials. Try again."
    return render_template("login.html")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
