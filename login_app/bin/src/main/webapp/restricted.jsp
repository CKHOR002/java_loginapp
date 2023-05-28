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
    <title><%= (language.equals("en")) ? "Restricted Page" : "受限页面" %></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f1f1f1;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        p {
            text-align: center;
            margin-bottom: 20px;
        }

        a {
            display: block;
            text-align: center;
            color: #4CAF50;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1><%= (language.equals("en")) ? "Restricted Page" : "受限页面" %></h1>
    <p><%= (language.equals("en")) ? "This page can only be accessed by managers." : "此页面只能由managers访问。" %></p>
    <a href="welcome"><%= (language.equals("en")) ? "Back to Welcome Page" : "返回欢迎页面" %></a>
</body>
</html>
