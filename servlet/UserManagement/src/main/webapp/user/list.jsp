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
    <link rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">

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
<h1 style="text-align: center">Account List</h1>
<form action="/UserManagement?action=searchByName" method="post">
    <input style="margin-left: 20px" type="text" name="name" placeholder="Search By Name">
    <input class="btn btn-primary" type="submit" value="Search">
</form>
<form action="/UserManagement?action=searchByCountry" method="post">
    <input style="margin-left: 20px" type="text" name="country" placeholder="Search By Country">
    <input class="btn btn-primary" type="submit" value="Search">
</form>
<a style="margin-left: 20px" class="btn btn-outline-success" href="/UserManagement">Back to User List</a>
<a style="margin-left: 20px" class="btn btn-outline-success" href="/UserManagement?action=add" >Add New User</a>
<a style="margin-left: 20px" class="btn btn-outline-success" href="/UserManagement?action=sort" >Sort By Name</a>
<div class="container m-auto">
<table class="table table-striped">
    <tr>
        <th class="text-center" scope="col">ID</th>
        <th class="text-center" scope="col">Name</th>
        <th class="text-center" scope="col">Email</th>
        <th class="text-center" scope="col">Country</th>
        <th class="text-center" scope="col"></th>
        <th class="text-center" scope="col"></th>
        <th class="text-center" scope="col"></th>
    </tr>
    <c:forEach items="${userList}" var="user">
        <tr>
            <td class="text-center">${user.getId()}</td>
            <td>${user.getName()}</td>
            <td>${user.getEmail()}</td>
            <td>${user.getCountry()}</td>
            <td class="text-center"><a class="btn btn-outline-warning" href="/UserManagement?action=detail&id=${user.getId()}">View</a></td>
            <td class="text-center"><a class="btn btn-outline-primary" href="/UserManagement?action=edit&id=${user.getId()}">Edit</a></td>
            <td class="text-center"><button class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">Delete</button></td>
        </tr>
    </c:forEach>
</table>
</div>
<div class="modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Notification</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Are you sure to delete this User?</p>
            </div>
            <div class="modal-footer">
                <form method="post" action="/UserManagement?action=delete&id=${user.getId()}">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                <button type="submit" class="btn btn-primary">Yes</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
