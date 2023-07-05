<%--
  Created by IntelliJ IDEA.
  User: dannynguyen
  Date: 04/07/2023
  Time: 23:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Create new User</title>
</head>
<body>
<h1 style="text-align: center">Create New User</h1>
<div>
    <a class="btn btn-outline-success" href="/UserManagement">Back to User List</a>
</div>
<div style="margin: 20px 50px">
    <form action="/UserManagement?action=add" method="post">
        <fieldset>
            <legend>USER INFORMATION</legend>
            <table>
                <tr>
                    <td>ID:</td>
                    <td><input type="number" name="id"></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="name" ></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="text" name="email" ></td>
                </tr>
                <tr>
                    <td>Country:</td>
                    <td><input type="text" name="country"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Create"></td>
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
