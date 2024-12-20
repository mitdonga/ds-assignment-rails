# Rails API App

A Ruby on Rails API application that provides authentication functionality using Devise and JWT tokens. This API serves as a backend for a React frontend application.

## Technology Stack

- Ruby 3.1.6
- Rails 7.2.1
- PostgreSQL
- Devise for authentication
- JWT for token-based authentication
- Rack CORS for handling Cross-Origin Resource Sharing

## Setup

### Prerequisites

- Ruby 3.1.6
- PostgreSQL
- Bundler -v 2.3.27

### Installation

1. Clone the repository:
```bash
git clone git@github.com:mitdonga/ds-assignment-rails.git
cd ds-assignment-rails
```

2. Install dependencies:
```bash
bundle install
```

3. Setup database:
```bash
rails db:create
rails db:migrate
```

4. Start the server:
```bash
rails s -p 3000
```

## API Endpoints

### Authentication Routes

#### Sign Up
```
POST /signup
Content-Type: application/json

Request body:
{
  "user": {
    "name": "John Doe",
    "email": "john@example.com",
    "password": "password123",
  }
}

Response:
{
  "message": "Signed up successfully"
}
```

#### Login
```
POST /login
Content-Type: application/json

Request body:
{
  "email": "john@example.com",
  "password": "password123"
}

Response:
{
  "message": "Logged in successfully",
  "user": {
    "id": 1,
    "name": "Rahul R.",
    "email": "john@example.com",
    "referral_code": "2d514",
    "created_at": "2024-12-19T04:39:13.035Z"
  }
}
```

#### Logout
```
DELETE /logout
Authorization: Bearer <jwt_token>

Response:
no content, status OK
```

### Protected Routes

#### Get Members List
```
GET /members
Authorization: Bearer <jwt_token>

Response:
{
  "users": [
    {
      "id": 1,
      "name": "Mit R.",
      "email": "mit@yopmail.com",
      "referral_code": "c9851",
      "created_at": "2024-12-19T04:58:08.897Z"
    }
  ]
}
```

#### Invite Member
```
POST /members/invite
Authorization: Bearer <jwt_token>
Content-Type: application/json

Request body:
{
  "email": "newmember@example.com"
}

Response:
{
  "message": "Invitation sent"
}
```

#### Current User
```
GET /me
Authorization: Bearer <jwt_token>
Content-Type: application/json

Response:
{
  "user": {
    "id": 1,
    "name": "Rahul R.",
    "email": "rahul@yopmail.com",
    "referral_code": "2d514",
    "created_at": "2024-12-19T04:39:13.035Z"
  }
}
```

## Authentication

The API uses JWT (JSON Web Tokens) for authentication. After successful login, the client receives a JWT token in the Authorization header:

```
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9...
```

This token should be included in all subsequent requests to protected endpoints.

## Error Handling

The API returns appropriate HTTP status codes and error messages:

```json
{
  "error": "Invalid token"
}
```

Common status codes:
- 200: Success
- 401: Unauthorized
- 422: Unprocessable Entity
- 404: Not Found
- 500: Internal Server Error


## Development

1. Run development servers:
```bash
# API server (port 5000)
rails s -p 3000

# React development server (port 3000)
cd client && npm start
```

2. Access the application:
- API: http://localhost:0000