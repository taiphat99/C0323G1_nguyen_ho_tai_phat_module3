<%--
  Created by IntelliJ IDEA.
  User: dannynguyen
  Date: 30/06/2023
  Time: 08:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customer List</title>
    <style>
        table, th, td, tr {
            border: solid black;
            border-collapse: collapse ;
        }

        img {
            width: 150px;
            height: auto;
        }
    </style>
</head>
<body>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Date Of Birth</th>
        <th>Address</th>
        <th>Image</th>
    </tr>
    <c:forEach var="customer" items="${list}">
        <tr>
            <td><c:out value="${customer.id}"/></td>
            <td><c:out value="${customer.name}"/></td>
            <td><c:out value="${customer.dateOfBirth}"/></td>
            <td><c:out value="${customer.address}"/></td>
            <td><img src="${customer.image}" alt=""></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
