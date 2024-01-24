//package com.example.ems;
//
//import DBConnection.DBConnection;
//import Model.Mystore;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//
//@WebServlet(name = "com.example.ems.LoginServlet", urlPatterns = "/login")
//public class LoginServlet extends HttpServlet {
//
//
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//        String email = request.getParameter("email");
//        String password = request.getParameter("password");
//        if (email.equals(null) || email == "" || password.equals(null) || password == "") {
//            request.setAttribute("msg", "All fields are necessary");
//            getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
//
//        } else {
//            Mystore mystore = new Mystore();
//            mystore.setEmail(email);
//            mystore.setPassword(password);
//            boolean result = DBConnection.loginuser(mystore);
//            if (result) {
//                request.setAttribute("msg", "success");
//                request.getRequestDispatcher("index.jsp").include(request, response);
//                System.out.println("correct");
//            } else {
//                request.setAttribute("msg", "Either user name or password is incorrect");
//                getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
//            }
//        }
//    }
//
//
//
//}

package com.example.ems;

import DBConnection.DBConnection;
import Model.Mystore;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(name = "com.example.ems.LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            request.setAttribute("msg", "All fields are necessary");
            getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
        } else {
            Mystore mystore = new Mystore();
            mystore.setEmail(email);
            mystore.setPassword(password);
            boolean result = DBConnection.loginuser(mystore);
            if (result) {
                // Set up session and track user's activity time
                HttpSession session = request.getSession();
                session.setAttribute("userId", mystore.getId());
                session.setAttribute("lastActivityTime", new Timestamp(System.currentTimeMillis()));
                request.setAttribute("msg", "success");
                request.getRequestDispatcher("index.jsp").include(request, response);
                System.out.println("correct");
            } else {
                request.setAttribute("msg", "Either user name or password is incorrect");
                getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("userId") != null) {
            Timestamp lastActivityTime = (Timestamp) session.getAttribute("lastActivityTime");
            long timeDiff = System.currentTimeMillis() - lastActivityTime.getTime();
            if (timeDiff > 2 * 60 * 1000) {
                // Invalidate session if user is inactive for more than 2 minutes
                session.invalidate();
                response.sendRedirect(request.getContextPath() + "/login.jsp");
                return;
            } else {
                // Update user's activity time
                session.setAttribute("lastActivityTime", new Timestamp(System.currentTimeMillis()));
            }
        }
        // Proceed with request handling
        doPost(request, response);
    }
}


