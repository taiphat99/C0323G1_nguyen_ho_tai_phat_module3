<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="/discount_calculator" method="post">
    <h1>Product Discount Calculator</h1>
    <br/>
    <h4>Product Description:</h4>
    <input type="text" name="product_name">
    <br>
    <h4>List Price:</h4>
    <input type="number" name="list_price">
    <br>
    <h4>Discount Percent:</h4>
    <input type="number" name="discount_percent">
    <button id="submit" type="submit">Submit</button>
</form>
</body>
</html>