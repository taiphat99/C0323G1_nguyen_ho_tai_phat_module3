<%--
  Created by IntelliJ IDEA.
  User: dannynguyen
  Date: 03/07/2023
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Management</title>
        <link rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <style>
        table {
            margin-top: 10px;
        }

        th, td {
            text-align: center;
        }
    </style>

</head>
<body>
<h1 style="text-align: center">Product Management</h1>
<a class="btn btn-outline-success" href="/Product?action=ShowFormCreate">Add new Product</a>
<table class="table table-striped">
    <tr>
        <th scope="col">#</th>
        <th scope="col">Name</th>
        <th scope="col">Price</th>
        <th scope="col">Quantity</th>
        <th scope="col">Description</th>
        <th scope="col"></th>
        <th scope="col"></th>
        <th scope="col"></th>
    </tr>
    <c:forEach items='${requestScope["products"]}' var="product" varStatus="loop">
        <tr>
            <th scope="row">${loop.count}</th>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getQuantity()}</td>
            <td>${product.getDescription()}</td>
            <td>
                <a class="btn btn-outline-warning" href="/Product?action=detail&id=${product.getId()}">View</a>
            </td>
            <td>
                <a class="btn btn-outline-primary" href="/Product?action=edit&id=${product.getId()}">Edit</a>
            </td>
            <td>
                <a class="btn btn-outline-danger" href="/Product?action=delete&id=${product.getId()}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
