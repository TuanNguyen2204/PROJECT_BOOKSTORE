package controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import dal.AccountDAL;
import javax.servlet.http.Cookie;

public class SignInServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pr = response.getWriter();
        request.setAttribute("check", "null");
        Cookie arr[] = request.getCookies();
        for(Cookie o : arr){
            if(o.getName().equals("user")){
                request.setAttribute("username", o.getValue());
            }
            if(o.getName().equals("pass")){
                request.setAttribute("password", o.getValue());
            }
        }
        request.getRequestDispatcher("signIn.jsp").include(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pr = response.getWriter();
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String remember = request.getParameter("rememberMe");
        AccountDAL accdal = new AccountDAL();
        HttpSession session = request.getSession();
        Account a = accdal.checkAccount(user, pass);
        if (a != null) {
            session.setAttribute("user", user);
            session.setAttribute("pass", pass);
            Cookie userCookie = new Cookie("user", user);
            Cookie passCookie = new Cookie("pass", pass);
            Cookie rememberCookie = new Cookie("remember", remember);
            if (remember != null) {
                userCookie.setMaxAge(60 * 60 * 24 * 30);
                passCookie.setMaxAge(60 * 60 * 24 * 30);
                rememberCookie.setMaxAge(60 * 60 * 24 * 30);
            } else {
                userCookie.setMaxAge(0);
                passCookie.setMaxAge(0);
                rememberCookie.setMaxAge(0);
            }
            response.addCookie(userCookie);
            response.addCookie(passCookie);
            response.addCookie(rememberCookie);
            response.sendRedirect("home");
        } else {
            request.setAttribute("check", "fail");
            request.getRequestDispatcher("signIn.jsp").forward(request, response);
        }
    }

}
