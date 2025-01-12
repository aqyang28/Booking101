import os
import json
from flask import Flask, request, jsonify
from flask_cors import CORS


app = Flask(__name__)
CORS(app)

# Path to the users JSON file
USER_FILE = 'users.json'


# Helper function to load users from the JSON file
def load_users():
    if not os.path.exists(USER_FILE):
        return []
    try:
        with open(USER_FILE, 'r') as file:
            return json.load(file)
    except json.JSONDecodeError:
        return [] 


# Helper function to save users to the JSON file
def save_users(users):
    with open(USER_FILE, 'w') as file:
        json.dump(users, file, indent=4)


# Endpoint to add a new user
@app.route('/add_user', methods=['POST'])
def add_user():
    users = load_users()  # Load users from the JSON file
    data = request.json
   
    if not data or 'name' not in data or 'email' not in data or 'username' not in data or 'password' not in data:
        return jsonify({'error': 'Missing required fields'}), 400
   
    # Check if username already exists
    for user in users:
        if user['username'] == data['username']:
            return jsonify({'error': 'Username already exists'}), 409
        if user['email'] == data['email']:
            return jsonify({'error': 'Email already in use'}), 409


    # Add the new user
    new_user = {
        'name': data['name'],
        'email': data['email'],
        'username': data['username'],
        'password': data['password'],  # Note: Store hashed passwords in production
        'appointments': []  # Empty list for appointments
    }
    users.append(new_user)
    save_users(users)  # Save updated users back to the JSON file
    return jsonify({'message': 'User added successfully'}), 201


# Endpoint to get all users and validate login
@app.route('/get_users', methods=['GET'])
def get_users():
    users = load_users()  # Load users from the JSON file
    username = request.args.get('username')
    email = request.args.get('email')
    password = request.args.get('password')


    if username and password:
        # Validate user credentials
        for user in users:
            if (user['username'] == username or user['email'] == email) and user['password'] == password:
                return jsonify({'message': 'Login successful'}), 200
        return jsonify({'error': 'Invalid username or password'}), 401

    # Return all users (excluding passwords for security)
    return jsonify([
        {key: user[key] for key in user }
        for user in users
    ]), 200

@app.route('/validate_user', methods=['GET'])
def validate_user():
    users = load_users()  # Load users from the JSON file
    # username = request.args.get('username')
    # email = request.args.get('email')
    useremail = request.args.get('username') or request.args.get('email')
    password = request.args.get('password')

    if not useremail or not password:
        return jsonify({'error': 'Username and password are required'}), 400

    # Validate user credentials
    for user in users:
        if (user['username'] == useremail or user['email'] == useremail) and user['password'] == password:
            return jsonify({'message': 'Login successful'}), 200

    return jsonify({'error': 'Invalid username or password'}), 401

@app.route("/current_user", methods=['GET'])
def current_user():
    users = load_users()
    auth_token = request.headers.get("Authorization")
    if not auth_token or auth_token not in users:
        return jsonify({"error": "Invalid user"}), 401
    
    current = users[auth_token]
    return jsonify(current)

if __name__ == '__main__':
    app.run(debug=True, port=5001)
