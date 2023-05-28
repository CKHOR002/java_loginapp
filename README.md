# 1. TextEncoder

The TextEncoder is a Java class that provides methods for encoding and decoding text using a reference table and an offset value. It allows you to perform simple character substitution encryption and decryption.

## Usage

### Encoding

To encode a plain text string, use the `encode` method of the `TextEncoder` class. Pass the plain text and an offset character as parameters. The method returns the encoded text.

```java
String plainText = "HELLO WORLD";
char offset = 'F';
String encodedText = encoder.encode(plainText, offset);
```
### Decoding
To decode an encoded text string, use the decode method of the TextEncoder class. Pass the encoded text as a parameter. The method returns the decoded text.

```java
String decodedText = encoder.decode(encodedText);
```
### Example
Here's an example of how to use the TextEncoder class:


```java

TextEncoder encoder = new TextEncoder();
String plainText = "HELLO WORLD";
char offset = 'F';
String encodedText = encoder.encode(plainText, offset);
System.out.println("Encoded text: " + encodedText);

String decodedText = encoder.decode(encodedText);
System.out.println("Decoded text: " + decodedText);
```
### Output:

```
Encoded text: FC/GGJ RJMG.
Decoded text: HELLO WORLD
```
### Customization
You can customize the reference table used for encoding and decoding by modifying the referenceTable field in the TextEncoder class. Make sure to keep the table characters unique and in the desired order.

```java
private final String referenceTable = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789()*+,-./";
```



# 2. Java Login Application

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

<br>
#################################################################
<br>
SQL Script
<br>
-- Create the users table
<br>
CREATE TABLE users (<br>
    id INT PRIMARY KEY AUTO_INCREMENT,<br>
    name VARCHAR(50) NOT NULL,<br>
    username VARCHAR(50) NOT NULL,<br>
    password VARCHAR(50) NOT NULL,<br>
    role VARCHAR(20) NOT NULL<br>
);<br>

-- Insert sample users
<br>
INSERT INTO users (name, username, password, role)<br>
VALUES<br>
    ('John Doe', 'johndoe', 'password', 'user'),<br>
    ('Jane Smith', 'janesmith', 'password', 'user'),<br>
    ('Manager', 'manager', 'password', 'manager');<br>
#################################################################
<br>


3. Configure the database connection settings in the `UserDAO` class.
4. Build and deploy the application using an appropriate Java web server (e.g., Apache Tomcat).
5. Access the application in your web browser by entering the URL provided by your web server.
6. Use the provided login page to log in with valid user credentials.
7. Upon successful login, you will be redirected to the welcome page, which displays your name, username, and role.
8. If you have a manager role, you will see a link to the restricted page. Clicking on the link will grant you access to the restricted page.



