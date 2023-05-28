<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.login.model.User" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
    <title>Welcome</title>
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

        .user-info {
            max-width: 300px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        p {
            margin: 10px 0;
        }

        .restricted-link {
            display: block;
            text-align: center;
            margin-top: 20px;
        }

        a {
            color: #4CAF50;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .logout-link {
            display: block;
            text-align: center;
            margin-top: 20px;
        }
    </style>
    
</head>
<body>

   
    <div class="user-info">
     <h1><%= (language.equals("en")) ? "Welcome" : "欢迎" %> ${user.name}</h1>
    <p><%= (language.equals("en")) ? "Hello, User!" : "你好，用户！" %></p>
    <p><%= (language.equals("en")) ? "User Name:" : "用户名：" %> ${user.username}</p>
    <p><%= (language.equals("en")) ? "Role:" : "角色：" %> ${user.role}</p>
    <c:if test="${user.role eq 'manager'}">
        <a class="restricted-link" href="restricted.jsp"><%= (language.equals("en")) ? "Restricted Page" : "受限页面" %></a>
    </c:if>

        
    </div>

       <a class="logout-link" href="logout"><%= (language.equals("en")) ? "Logout" : "退出" %></a>
</body>
</html>
