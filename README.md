# Java Login Application

This is a simple Java login application that demonstrates a login functionality with user roles and restricted access for manager users. The application follows the MVC (Model-View-Controller) pattern and uses Java for the backend and a web-based UI.

## Features

- User authentication: Users can log in using their username and password.
- Role-based access: The application supports two roles: manager and user. Managers have access to a restricted page.
- Database storage: User data is stored in a MySQL database.
- Multi-language support: The application supports multiple languages, including English and Mandarin.

## Technologies Used

- Java
- Servlet
- JDBC
- MySQL
- HTML/CSS
- JavaScript 

## Setup and Usage

1. Clone the repository or download the source code.
2. Set up a MySQL database with the required tables. 
-- Create the users table
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    role VARCHAR(20) NOT NULL
);

-- Insert sample users
INSERT INTO users (name, username, password, role)
VALUES
    ('John Doe', 'johndoe', 'password', 'user'),
    ('Jane Smith', 'janesmith', 'password', 'user'),
    ('Manager', 'manager', 'password', 'manager');



3. Configure the database connection settings in the `UserDAO` class.
4. Build and deploy the application using an appropriate Java web server (e.g., Apache Tomcat).
5. Access the application in your web browser by entering the URL provided by your web server.
6. Use the provided login page to log in with valid user credentials.
7. Upon successful login, you will be redirected to the welcome page, which displays your name, username, and role.
8. If you have a manager role, you will see a link to the restricted page. Clicking on the link will grant you access to the restricted page.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

