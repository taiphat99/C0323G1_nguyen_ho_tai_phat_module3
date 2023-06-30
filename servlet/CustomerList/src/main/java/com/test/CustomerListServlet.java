package com.test;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "TestServlet", value = "/CustomerList")
public class CustomerListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer(1, "Danny", "19/09/1999", "Quang Tri", "https://images.pexels.com/photos/872831/pexels-photo-872831.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"));
        customerList.add(new Customer(2, "Louis", "19/06/1989", "Da Nang", "https://images.pexels.com/photos/6181092/pexels-photo-6181092.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"));
        customerList.add(new Customer(3, "Bully", "10/02/2000", "Da Nang", "https://images.pexels.com/photos/346885/pexels-photo-346885.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"));
        customerList.add(new Customer(4, "Jackie", "12/12/1997", "Da Nang", "https://images.pexels.com/photos/1058959/pexels-photo-1058959.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"));
        customerList.add(new Customer(5, "Chunky", "09/02/1996", "Quang Nam", "https://images.pexels.com/photos/307006/pexels-photo-307006.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"));
        request.setAttribute("list", customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("CustomerList.jsp");
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
