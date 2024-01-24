package com.example.ems;

import DBConnection.DBConnection;
import DBConnection.UserDao;
import Model.AppMessage;
import Model.Mystore;
import Model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "com.example.ems.UserServlet", urlPatterns = "/users/*")
public class UserServlet extends HttpServlet {

    private UserDao userDao;

    public UserServlet(){
        this.userDao = new UserDao();
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getPathInfo();
        switch (action) {
            case "/insert":
                insertUser(request, response);
                break;
            case "/update":
                updateUser(request, response);
                break;
            default:
                listUser(request, response);
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getPathInfo();
        switch (action){
            case "/new":
                showNewForm(request, response);
                break;
            case "/edit":
                showEditForm(request, response);
                break;
            case "/delete":
                try {
                    deleteUser(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            default:
                listUser(request, response);
                break;
        }
    }

//    private void listUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<User> listUser = userDao.selectALlUsers();
//        request.setAttribute("listUser", listUser);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/user-list.jsp");
//        dispatcher.forward(request, response);
//    }
private void listUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int page = 1;
    int recordsPerPage = 10;
    if(request.getParameter("page") != null) {
        page = Integer.parseInt(request.getParameter("page"));
    }
    List<User> listUser = userDao.selectALlUsers((page-1)*recordsPerPage, recordsPerPage);
    int noOfRecords = userDao.getNoOfRecords();
    int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
    request.setAttribute("listUser", listUser);
    request.setAttribute("noOfPages", noOfPages);
    request.setAttribute("currentPage", page);
    RequestDispatcher dispatcher = request.getRequestDispatcher("/user-list.jsp");
    dispatcher.forward(request, response);
}


    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String department = request.getParameter("department");
        String password = request.getParameter("password");
        User user = new User();
        user.setName(name);
        user.setAddress(address);
        user.setDepartment(department);
        user.setPassword(password);
        user.setId(id);
        AppMessage message = userDao.updateUser(user);
        if (message.isSuccess()) {
            listUser(request, response);
            return;
        }

        request.setAttribute("user", user);
        request.setAttribute("errorMessage", message.getMessage());
        request.getRequestDispatcher("/user-form.jsp").forward(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
        throws SQLException, IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        userDao.deleteUser(id);
        response.sendRedirect("list");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = userDao.selectUser(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/user-form.jsp");
        request.setAttribute("user", existingUser);
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
        RequestDispatcher dispatcher = request.getRequestDispatcher("/user-form.jsp");
        dispatcher.forward(request, response);
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String department = request.getParameter("department");
        String password = request.getParameter("password");
        // TODO: do input validation
        User newUser = new User(name, email, address, department, password);
        AppMessage message = userDao.insertUser(newUser);
        System.out.println("got response as, " + message);
        if (message.isSuccess()) {
            listUser(request, response);
            return;
        }

        request.setAttribute("errorMessage", message.getMessage());
        request.getRequestDispatcher("/user-form.jsp").forward(request, response);
    }


}
