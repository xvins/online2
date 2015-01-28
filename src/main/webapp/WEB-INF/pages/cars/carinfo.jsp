<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Car Information</title>
    <style type="text/css">
        .border {
            border-width: 1px;
            border-style: solid;
            border-collapse: collapse;
        }
        .td,.th {
            border: 1px solid;
            font-family: 'arial';
            font-size: 12px;
        }
        .a {
            font-family: 'arial';
            font-size: 12px;
        }
    </style>
</head>
<body>
<table align="left" style="padding-left: 300px;">
    <tr>
        <td
                style="font-family: 'arial'; font-size: 16px; font-weight: bold;">Car information</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <table class="border" cellpadding="10">
                <tr bgcolor="#99CCFF">
                    <th class="th">Name</th>
                    <th class="th">Action</th>
                </tr>
                <tr>
                    <td><b><c:out value="${car.name}" /></b></td>
                    <td class="td">
                        <a href="${pageContext.request.contextPath}/car?cAction=delete&carId=${car.id}"
                           style="color: green">Delete</a>
                        <a href="/cars/editcar/${car.id}"
                           style="color: green">Edit</a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td
                style="font-family: 'arial'; font-size: 16px; font-weight: bold;">Car's details</td>
        <td><spring:url value="{carId}/details/new.html" var="addUrl">
            <spring:param name="carId" value="${car.id}"/>
        </spring:url>
            <a href="${fn:escapeXml(addUrl)}"  class="btn btn-success">Add New Detail</a></td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <c:forEach var="detail" items="${car.carDetails}">
            <table class="border" cellpadding="10">
                <tr bgcolor="#99CCFF">
                    <th class="th">Name</th>
                    <th class="th">Color</th>
                    <th class="th">Material</th>
                </tr>
                <tr>
                    <td><b><c:out value="${detail.name}" /></b></td>
                    <td><b><c:out value="${detail.color}" /></b></td>
                    <td><b><c:out value="${detail.material}" /></b></td>
                </tr>
            </table>
            </c:forEach>
        </td>
    </tr>
</table>

</body>

</html>
