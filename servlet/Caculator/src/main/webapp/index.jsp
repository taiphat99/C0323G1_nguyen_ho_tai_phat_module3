<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>Calculator</h1>
<br/>
<form action="/Calculator" method="get">
    <fieldset>
        <legend>Calculator</legend>
        <table>
            <tr>
                <td>First Operand:</td>
                <td><input type="number" name="firstOperand"></td>
            </tr>
            <tr>
                <td>Second Operand:</td>
                <td><input type="number" name="secondOperand"></td>
            </tr>
            <tr>
                <td></td>
                <td>
            <select name="operator">
                <option value="+">Addition</option>
                <option value="-">Subtraction</option>
                <option value="*">Multiplication</option>
                <option value="/">Division</option>
            </select>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <button type="submit" value="submit">Calculate</button>
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>