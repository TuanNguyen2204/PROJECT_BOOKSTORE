/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AccountDAL;
import dal.ProductDAL;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Product;

/**
 *
 * @author Tuan
 */
public class HomeServlet extends HttpServlet {

    HashMap<String, Integer> hashCart = new HashMap<String, Integer>();

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
            out.println("<title>Servlet HomeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeServlet at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pr = response.getWriter();
        AccountDAL aDAL = new AccountDAL();
        ProductDAL pDAL = new ProductDAL();
        HttpSession session = request.getSession();
//        -------------------------------------------
        String username = (String) session.getAttribute("user");
        String password = (String) session.getAttribute("pass");
        String search = (String) request.getParameter("search");

        String category = request.getParameter("catid");
        String sort = (String) request.getParameter("sort");
        List<Product> bookList = new ArrayList<>();
        //        -------------------------------------------        
        if (category == null || category.equals("")) {
            bookList = pDAL.getAllProduct();
            if (search == null || search.equals("")) {
                bookList = pDAL.getAllProduct();
            } else {
                bookList = pDAL.getProductBySerch(search);
            }
        } else {
            bookList = pDAL.getProductByCategory(category);
        }
//        request.setAttribute("hovered", "default");

        if (category == null || category.equals("")) {
            bookList = pDAL.getAllProduct();
            if (sort == null || sort.equals("")) {
                bookList = pDAL.getAllProduct();
            } else {
                if (sort.equals("price")) {
                    request.setAttribute("price", "selected");
                    bookList = pDAL.getProductOrderByPrice(search);
                }
                if (sort.equals("bestSeller")) {
                    request.setAttribute("best", "selected");
                    bookList = pDAL.getProductOrderByBestSeller(search);
                }
                if (sort.equals("name")) {
                    request.setAttribute("name", "selected");
                    bookList = pDAL.getProductOrderByName(search);
                }
            }
            //default la de xem category da chon
            request.setAttribute("a0", "default");
        } else {
            if (category.equals("cat1")) {
                request.setAttribute("a1", "default");
            }
            if (category.equals("cat2")) {
                request.setAttribute("a2", "default");
            }
            if (category.equals("cat3")) {
                request.setAttribute("a3", "default");
            }
            bookList = pDAL.getProductByCategory(category);
        }

        ///
        int page, numperpage = 6;
        int size = bookList.size();
        int num = (size % 6 == 0 ? (size / 6) : ((size / 6)) + 1);//so trang
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numperpage;
        end = Math.min(page * numperpage, size);
        List<Product> list = pDAL.getListByPage(bookList, start, end);

        request.setAttribute("page", page);
        request.setAttribute("num", num);
        request.setAttribute("bookList", list);
//        ---------------------------------------------
        try {
            String pid = request.getParameter("pid");
            int amount = Integer.parseInt(request.getParameter("amount"));
            if (pid == null || amount == 0) {
                request.getRequestDispatcher("shop.jsp").include(request, response);
            } else {
                if (username != null) {
                    hashCart = pDAL.getCart(username);
                }
                if (hashCart.containsKey(pid)) {
                    hashCart.put(pid, (hashCart.get(pid) + amount));
                    pDAL.updateCart(username, pid, hashCart.get(pid));
                    session.setAttribute("hashCart", hashCart);
                } else {
                    hashCart.put(pid, amount);
                    pDAL.addToCart(username, pid, hashCart.get(pid));
                    session.setAttribute("hashCart", hashCart);
                }
                request.getRequestDispatcher("shop.jsp").include(request, response);
            }
        } catch (Exception e) {
            request.getRequestDispatcher("shop.jsp").include(request, response);
        }

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
        processRequest(request, response);
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
