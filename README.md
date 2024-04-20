# SessionAuthApp

SessionAuthApp is a simple Ruby on Rails application for managing user accounts and posts. It provides RESTful APIs for user authentication and post management.

## Features

- User authentication: Users can sign up, log in, and log out securely.
- Post management: Authenticated users can create, view, update, and delete posts.
- JSON APIs: All functionality is exposed via JSON APIs for easy integration with frontend frameworks or mobile applications.

## Prerequisites

Before running the application, ensure you have the following installed:

- Ruby (version 2.7.5)
- Ruby on Rails (version 6.1.4)
- PostgreSQL

## Getting Started

To get started with SessionAuthApp, follow these steps:

1. Clone this repository to your local machine:

   git clone https://github.com/Tanay-ror/Simpleauth.git

2. Make sure you have mentioned ruby and rails version on your machine.

3. Install all dependecies by running:

    ` bundle install `

4. Create database using following command:
    ` rails db:create`

5. Run all Migrations using Following commands:
    ` rails db:migrate `

6. Run FOllowing command to create a dummy set of data:
    ` rails db:seed `

7. Run Following Command to start the server:
    ` rails s `

## Testing App

1. For testing app you can run following command on terminal:
      ` rspec `
