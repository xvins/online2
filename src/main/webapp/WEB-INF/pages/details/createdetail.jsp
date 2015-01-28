<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mytag" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create a new detail</title>
</head>
<body>
<form:form method="post" modelAttribute="detail">
<table align="left" style="padding-left: 300px;">
    <tr>
        <td
                style="font-family: 'arial'; font-size: 16px; font-weight: bold;"
                align="left">New Detail</td>
    </tr>
    <tr align="left">
        <td>
            <table class="border" cellpadding="10">
                <tr>
                    <td><label class="control-label">Owner </label></td>
                    <td><c:out value="${detail.car.name}"/></td>
                </tr>
                <tr>
                    <td class="td"><b>Name:</b></td>
                    <td class="td"><mytag:inputField name="name"/></td>
                </tr>
                <tr>
                    <td class="td"><b>Color:</b></td>
                    <td class="td"><mytag:inputField name="color"/></td>
                </tr>
                <tr>
                    <td class="td"><b>Material:</b></td>
                    <td class="td"><mytag:inputField name="material"/></td>
                </tr>
            </table>
        </td>
    </tr>

    <tr align="left">
        <td>
            <table style="padding-left: 100px;">
                <tr align="center">
                    <td class="td"><button type="submit">Add Detail</button></td>
                </tr>
            </table>
        </td>
    </tr>
</table>

</form:form><br>

<a href="/">Car list</a><br>



</body>
</html>
