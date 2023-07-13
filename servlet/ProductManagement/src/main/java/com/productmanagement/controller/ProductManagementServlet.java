package com.productmanagement.controller;

import com.productmanagement.model.Product;
import com.productmanagement.service.IProductService;
import com.productmanagement.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductManagementServlet", urlPatterns = "/Product")
public class ProductManagementServlet extends HttpServlet {
    private final IProductService ProductService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "showFormCreate":
                showFormCreate(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "detail":
                showDetailedProduct(request, response);
                break;
            case "searching":
                showSearchingList(request, response);
                break;
            default:
                showList(request, response);
        }
    }

    private void showSearchingList(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("searchName");
        List<Product> products = ProductService.searchByName(name);
        request.setAttribute("products", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/product/search_by_name.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addNewProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "edit":
                updateProduct(request, response);
                break;

        }
    }

    private void showDetailedProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        RequestDispatcher dispatcher = request.getRequestDispatcher("/product/detail.jsp");
        Product product = ProductService.findById(id);
        request.setAttribute("product", product);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        float price = Float.parseFloat(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String description = request.getParameter("description");
        Product product = ProductService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            product.setName(name);
            product.setPrice(price);
            product.setQuantity(quantity);
            product.setDescription(description);
            ProductService.update(id, product);
            request.setAttribute("product", product);
            request.setAttribute("message", "Product was updated");
            dispatcher = request.getRequestDispatcher("/product/edit.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = ProductService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("/product/edit.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        ProductService.remove(id);
        request.setAttribute("message", "Delete successfully");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/product/delete.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }


    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = ProductService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            request.setAttribute("message", "Not Found ID: " + id);
        } else {
            request.setAttribute("product", product);
        }
        dispatcher = request.getRequestDispatcher("/product/delete.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }


    }


    private void addNewProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        if (ProductService.findById(id) != null) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/product/create.jsp");
            request.setAttribute("message", "ID: " + id + " already existed!");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            String name = request.getParameter("name");
            float price = Float.parseFloat(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String description = request.getParameter("description");
            Product product = new Product(id, name, price, quantity, description);
            ProductService.save(product);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/product/create.jsp");
            request.setAttribute("message", "Add successfully");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }


    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Product> products = ProductService.getAll();
        request.setAttribute("products", products);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


}
