# Code Usage

## Otp verification logic:
the otp is genrated through a random function when a new user is created.
This otp is then mailed to the user using node js nodemailer.
once the otp is used and is a valid otp it gets deleted from the database.This prevents reusability of the OTP.

## Backend Systems:
Run the Docker compose file for starting the postgres sql
    run the command:- **docker compose up -d**
    open pgadmin at **localhost:5050**
    login to pgadmin with:
    
        user: admin@gmail.com
        password: admin
        in the services go to test database -> schema -> tables
        for viewing tables.

    run the backend system using the command
    **npm start**

## Frontend Code:
Run the command "**flutter run**" and choose the device you want to run it on.
          
