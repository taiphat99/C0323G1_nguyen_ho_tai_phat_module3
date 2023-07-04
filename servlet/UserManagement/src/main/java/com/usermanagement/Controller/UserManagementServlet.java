package com.usermanagement.Controller;

import com.usermanagement.model.User;
import com.usermanagement.service.IService;
import com.usermanagement.service.Service;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserManagementServlet", urlPatterns = "/UserManagement")
public class UserManagementServlet extends HttpServlet {
    private static final IService service = new Service();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "sort":
                sortByName(request, response);
            default:
                showList(request, response);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "searchByCountry":
                searchByCountry(request, response);
                break;

        }
    }

    private void sortByName(HttpServletRequest request, HttpServletResponse response) {


    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        List<User> userList = service.getList();
        request.setAttribute("userList", userList);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }


    private void searchByCountry(HttpServletRequest request, HttpServletResponse response) {
        String country = request.getParameter("country");
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        List<User> userList = service.searchByCountry(country);
        request.setAttribute("userList", userList);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
