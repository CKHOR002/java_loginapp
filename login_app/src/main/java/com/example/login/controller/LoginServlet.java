package com.example.login.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.example.login.dao.UserDAO;
import com.example.login.model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
 

        User user = userDAO.getUserByUsernameAndPassword(username, password);
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("welcome");
        } else {
        	 HttpSession session = request.getSession();
        	 String language = (String) session.getAttribute("language");
             String errorMessage = "Invalid username or password";
             if (language != null && language.equals("zh")) {
                 errorMessage = "无效的用户名或密码";
             }
             request.setAttribute("error", errorMessage);
             request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
