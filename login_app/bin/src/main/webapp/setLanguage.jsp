<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Get the selected language from the request parameter
    String language = request.getParameter("language");

    // Set the selected language in the session
    session.setAttribute("language", language);
%>
