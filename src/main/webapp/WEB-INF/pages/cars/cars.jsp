<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Car list</title>
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


<a href="/cars/createcar">Create a car</a>
<a href="/details">Detail list</a>



<table align="left" style="padding-left: 300px;">
    <tr>
        <td
                style="font-family: 'arial'; font-size: 16px; font-weight: bold;">Car list</td>
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
                   <c:forEach items="${carList}" var="car">
                    <tr>
                        <td class="td"><s:url value="carID" var="carinfo">
                            <s:param name="carID" value="${car.id}" />
                        </s:url>
                            <a href="cars/carinfo${car.id}">${car.name}</a></td>
                        <td class="td">
                            <a href="/car?cAction=delete&carId=${car.id}"
                               style="color: green">Delete</a>
                            <a href="/cars/editcar/${car.id}"
                               style="color: green">Edit</a>
                        </td>
                    </tr>
                   </c:forEach>
            </table>
        </td>
    </tr>

</table>




</body>
</html>
