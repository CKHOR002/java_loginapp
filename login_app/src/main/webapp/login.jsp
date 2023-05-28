<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Get the selected language from the session or set a default language
    String language = (String) session.getAttribute("language");
    if (language == null) {
        language = "en"; // Default language is English
        session.setAttribute("language", language);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f1f1f1;
        }

        h1 {
            text-align: center;
        }

        form {
            max-width: 300px;
            margin: 20px auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        p.error-message {
            color: red;
            text-align: center;
        }
    </style>
    <script>
        function toggleLanguage() {
            var langElement = document.getElementById("lang");
            var lang = langElement.getAttribute("data-lang");
            if (lang === "en") {
                langElement.setAttribute("data-lang", "zh");
                langElement.innerHTML = "English";
            } else {
                langElement.setAttribute("data-lang", "en");
                langElement.innerHTML = "中文";
            }
            updateLanguage();
            updateFormLanguage();
        }

        function updateLanguage() {
            var langElement = document.getElementById("lang");
            var lang = langElement.getAttribute("data-lang");

            // Send the selected language to the server
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "setLanguage.jsp?language=" + lang, true);
            xhr.send();
        }

        function updateFormLanguage() {
            var langElement = document.getElementById("lang");
            var lang = langElement.getAttribute("data-lang");
            
            var usernameInput = document.getElementById("username");
            var passwordInput = document.getElementById("password");
            var loginButton = document.getElementById("login-button");
            var heading = document.getElementById("heading");

            
            if (lang === "en") {
                usernameInput.setAttribute("placeholder", "Username");
                passwordInput.setAttribute("placeholder", "Password");
                loginButton.setAttribute("value", "Login");
                heading.innerHTML = "Login";
            } else {
                usernameInput.setAttribute("placeholder", "用户名");
                passwordInput.setAttribute("placeholder", "密码");
                loginButton.setAttribute("value", "登录");
                heading.innerHTML = "登录";
            }
        }
    </script>
</head>
<body>
<h1 id="heading"><%= (language.equals("en")) ? "Login" : "登录" %></h1>
    <form action="login" method="post"  onsubmit="return validateForm()">
        <input type="text" id="username" name="username" placeholder="<%= (language.equals("en")) ? "Username" : "用户名" %>" required><br>
        <input type="password" id="password" name="password" placeholder="<%= (language.equals("en")) ? "Password" : "密码" %>" required><br>
        <input type="submit"  id="login-button"value="<%= (language.equals("en")) ? "Login" : "登录" %>">
    </form>
    <p class="error-message">${error}</p>
    <button id="lang" data-lang="<%= language %>" onclick="toggleLanguage()"><%= (language.equals("en")) ? "中文" : "English" %></button>
    <script>
        // Update the form language when the page loads
        window.onload = function() {
            updateFormLanguage();
        };
        
        function validateForm() {
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;

            if (username.trim() == "" || password.trim() == "") {
                alert("Please fill in all the fields.");
                return false; 
            }

            if (username.endsWith(" ")) {
                alert("Username should not have trailing whitespace.");
                return false; 
            }
            

            
            return true; 
        }
    </script>
</body>
</html>
