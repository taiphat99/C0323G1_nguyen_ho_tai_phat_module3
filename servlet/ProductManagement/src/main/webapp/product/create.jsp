<%--
  Created by IntelliJ IDEA.
  User: dannynguyen
  Date: 03/07/2023
  Time: 14:50
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<html>
<head>
    <title>Create new Product</title>
</head>
<body>
<h1 style="text-align: center">Create new customer</h1>
<div>
    <a class="btn btn-outline-success" href="/Product">Back to Product List</a>
</div>
<div style="margin: 20px 50px">
    <form action="/Product?action=add" method="post">
        <fieldset>
            <legend>PRODUCT INFORMATION</legend>
            <table>
                <tr>
                    <td>ID:</td>
                    <td><input type="number" name="id"></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="name" id="name"></td>
                </tr>
                <tr>
                    <td>Price:</td>
                    <td><input type="number" name="price" id="price"></td>
                </tr>
                <tr>
                    <td>Quantity:</td>
                    <td><input type="number" name="quantity" id="quantity"></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><input type="text" name="description" id="description"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Create customer"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><p style="color: crimson">
                        <c:if test='${requestScope["message"] != null}'>
                            <span class="message">${requestScope["message"]}</span>
                        </c:if>
                    </p></td>
                </tr>
            </table>
        </fieldset>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
