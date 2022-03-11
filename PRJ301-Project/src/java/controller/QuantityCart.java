/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.ProductDAL;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Tuan
 */
public class QuantityCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet QuantityCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuantityCart at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pid = request.getParameter("pid");
        HashMap<String, Integer> hashCart = new HashMap<String, Integer>();
        ProductDAL pDAL = new ProductDAL();
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("user");
        session.removeAttribute("maxMsg");
        if (username != null) {
            hashCart = pDAL.getCart(username);
        }
        if (hashCart.containsKey(pid)) {
            if (hashCart.get(pid) >= 1) {
                hashCart.put(pid, (hashCart.get(pid) - 1));
                pDAL.updateCart(username, pid, hashCart.get(pid));
            }
            if (hashCart.get(pid) == 0) {
                hashCart.remove(pid);
                pDAL.removeProductCart(username, pid);
            }
        }
        session.setAttribute("hashCart", hashCart);
        response.sendRedirect("cart");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pid = request.getParameter("pid");
        HashMap<String, Integer> hashCart = new HashMap<String, Integer>();
        ProductDAL pDAL = new ProductDAL();
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("user");
        if (username != null) {
            hashCart = pDAL.getCart(username);
        }
//        if (hashCart.containsKey(pid) && hashCart.get(pid) < pDAL.getProductById(pid).getQuantity()) {
//            hashCart.put(pid, (hashCart.get(pid) + 1));
//            pDAL.updateCart(username, pid, hashCart.get(pid));
//            session.setAttribute("hashCart", hashCart);
//            session.removeAttribute("maxMsg");
//        }
        if (hashCart.containsKey(pid) && hashCart.get(pid) >= pDAL.getProductById(pid).getQuantity()) {
            session.setAttribute("maxMsg", "The product has maximum quantity");
        } else if (hashCart.containsKey(pid) && hashCart.get(pid) < pDAL.getProductById(pid).getQuantity()) {
            hashCart.put(pid, (hashCart.get(pid) + 1));
            pDAL.updateCart(username, pid, hashCart.get(pid));
            session.setAttribute("hashCart", hashCart);
            session.removeAttribute("maxMsg");
        }
        response.sendRedirect("cart");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
