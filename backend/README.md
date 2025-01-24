
# Flutter Auth Backend

This is a simple Node.js backend using Express.js for login and signup functionality.

## How to run
1. Navigate to the project folder: `cd express_backend`
2. Install dependencies: `npm install`
3. Start the server: `npm start`
4. The backend will be running on `http://localhost:3000`.

## API Endpoints
- `POST /signup`: To register a new user.
  - Request Body: `{ "username": "string", "password": "string" }`
  - Response: `{ "message": "User registered successfully" }`

- `POST /login`: To login with an existing user.
  - Request Body: `{ "username": "string", "password": "string" }`
  - Response: `{ "message": "Login successful" }`
