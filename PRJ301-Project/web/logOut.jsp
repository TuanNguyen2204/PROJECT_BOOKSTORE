<%-- 
    Document   : logout
    Created on : Mar 12, 2022, 9:37:42 AM
    Author     : Tuan
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session.removeAttribute("user");
    response.sendRedirect("home");
%>
