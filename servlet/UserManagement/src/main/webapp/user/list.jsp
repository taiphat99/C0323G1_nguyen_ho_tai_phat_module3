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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">

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
<a style="margin-left: 20px" class="btn btn-outline-success" href="/UserManagement?action=add">Add New User</a>
<a style="margin-left: 20px" class="btn btn-outline-success" href="/UserManagement?action=sort">Sort By Name</a>
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
                <td class="text-center">
                    <a class="btn btn-outline-warning" data-bs-toggle="modal" data-bs-target="#viewModal"
                       onclick="sendInfoToViewModal('${user.getId()}','${user.getName()}','${user.getEmail()}','${user.getCountry()}')">View
                    </a>
                </td>
                <td class="text-center">
                    <a class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editModal"
                       onclick="sendInfoToEditModal('${user.getId()}','${user.getName()}','${user.getEmail()}','${user.getCountry()}')">Edit
                    </a>
                </td>
                <td class="text-center">
                    <a class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteModal"
                       onclick="sendInfoToDeleteModal('${user.getId()}','${user.getName()}')">Delete
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<%--Delete modal--%>
<div class="modal" id="deleteModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Notification</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div style="text-align: center" class="modal-body">
                <p>Are you sure to delete username <b><span id="deletedName"></span></b>?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                <%--                <div id="confirm"></div>--%>
                <a onclick="remove()">
                    <button type="button" class="btn btn-primary">Yes</button>
                </a>
            </div>
        </div>
    </div>
</div>

<%--View Modal--%>
<div class="modal" id="viewModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Notification</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div style="text-align: center" class="modal-body">
                <h4>USER INFORMATION</h4>
                <table class="container">
                    <tr>
                        <td>ID:</td>
                        <td><span id="viewId"></span></td>
                    </tr>
                    <tr>
                        <td>Name:</td>
                        <td><span id="viewName"></span></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><span id="viewEmail"></span></td>
                    </tr>
                    <tr>
                        <td>Country:</td>
                        <td><span id="viewCountry"></span></td>
                    </tr>
                </table>
            </div>

        </div>
    </div>
</div>


<%--Edit Modal--%>
<div class="modal" id="editModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/UserManagement?action=edit" method="post">
                <div class="modal-header">
                    <h5 class="modal-title">Notification</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div style="text-align: center" class="modal-body">
                    <h4>USER INFORMATION</h4>
                    <table class="container m-auto">
                        <input type="hidden" name="id" id="editId">
                        <tr>
                            <td>Name:</td>
                            <td><input type="text" name="name" id="editName"></td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td><input type="text" name="email" id="editEmail"></td>
                        </tr>
                        <tr>
                            <td>Country:</td>
                            <td><input type="text" name="country" id="editCountry"></td>
                        </tr>
                        <tr>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Done</button>
                </div>
            </form>
        </div>
    </div>
</div>


<form id="deletedForm">
    <input type="hidden" name="action" value="delete"/>
    <input type="hidden" name="id" id="deletedId"/>
</form>


<script>
    // First Solution
    function sendInfoToDeleteModal(id, name) {
        document.getElementById("deletedName").innerText = name;
        document.getElementById("deletedId").value = id;
    }

    function remove() {
        document.getElementById("deletedForm").submit();
    }

    // Second Solution

    // let target_id = 0;
    // function getId(id) {
    //     target_id = id;
    // }
    // function deleteModal() {
    //     window.location.href = "/UserManagement?action=delete&id=" + target_id;
    // }

    // Third Solution:

    // let element = document.getElementById("confirm");
    // element.innerHTML = ""; // Mỗi lần click vào nó sẽ clear code HTML trong trong thẻ có id = "confirm"
    // let a = document.createElement("a"); // Tạo thẻ <a>
    // a.href = "/UserManagement?action=delete&id=" + id; // Tạo thuộc tính href
    // a.innerText = "Yes";  // Thêm Text vào trong thẻ <a>
    // a.className = "btn btn-success"; // Thêm class vào thẻ <a>
    // element.appendChild(a); // khai báo thẻ <a> làm con của biến element cụ thể nó trỏ đến id = "confirm"

    function sendInfoToViewModal(id, name, email, country) {
        document.getElementById("viewId").innerText = id;
        document.getElementById("viewName").innerText = name;
        document.getElementById("viewEmail").innerText = email;
        document.getElementById("viewCountry").innerText = country;
    }

    function sendInfoToEditModal(id, name, email, country) {
        document.getElementById("editId").value = id;
        document.getElementById("editName").value = name;
        document.getElementById("editEmail").value = email;
        document.getElementById("editCountry").value = country;
    }


</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
</script>
</body>
</html>
