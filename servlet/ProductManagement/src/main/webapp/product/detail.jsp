<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dannynguyen
  Date: 03/07/2023
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detail Information</title>
</head>
<body>
<fieldset>
    <legend>Detail Product Information</legend>
    <table>
        <tr>
            <td>ID:</td>
            <td>${requestScope["product"].getId()}</td>
        </tr>
        <tr>
            <td>Name:</td>
            <td>${requestScope["product"].getName()}</td>
        </tr>
        <tr>
            <td>Price:</td>
            <td>${requestScope["product"].getPrice()}</td>
        </tr>
        <tr>
            <td>Quantity:</td>
            <td>${requestScope["product"].getQuantity()}</td>
        </tr>
        <tr>
            <td>Description:</td>
            <td>${requestScope["product"].getDescription()}</td>
        </tr>
        <tr>
            <td></td>
            <td><a href="/Product">Back to Product List</a></td>
        </tr>
    </table>
</fieldset>

</body>
</html>
