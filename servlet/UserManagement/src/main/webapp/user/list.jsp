<%--
  Created by IntelliJ IDEA.
  User: dannynguyen
  Date: 04/07/2023
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Account List</title>
    <style>
        table, tr, td, th {
            border-collapse: collapse;
            border: solid black 1px;
            padding: 10px;
        }

        table {
            margin: 20px;
        }
    </style>
</head>
<body>
<h1>Account List</h1>
<form action="/UserManagement?action=searchByCountry" method="post">
    <input style="margin-left: 20px" type="text" name="country" placeholder="Search By Country">
    <input type="submit" value="Search">
</form>
<button style="margin-left: 20px" href="/UserManagement?action=sort">Sort By Name</button>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
    </tr>
    <c:forEach items='${requestScope["userList"]}' var="user">
        <tr>
            <td>${user.getId()}</td>
            <td>${user.getName()}</td>
            <td>${user.getEmail()}</td>
            <td>${user.getCountry()}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
