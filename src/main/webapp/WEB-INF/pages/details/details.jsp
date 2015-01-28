<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detail List</title>
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
<a href="/">Car list</a>
<table align="left" style="padding-left: 300px;">
    <tr>
        <td
                style="font-family: 'arial'; font-size: 16px; font-weight: bold;">Detail list</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <table class="border" cellpadding="10">
                <tr bgcolor="#99CCFF">
                    <th class="th">Name</th>
                    <th class="th">Color</th>
                    <th class="th">Material</th>
                    <th class="th">Action</th>
                </tr>
                <c:forEach items="${detailList}" var="detail">
                    <tr>
                        <td class="td">${detail.name}</td>
                        <td class="td">${detail.color}</td>
                        <td class="td">${detail.material}</td>
                        <td class="td">
                            <a href="${pageContext.request.contextPath}/detail?dAction=delete&detailId=${detail.id}"
                               style="color: green">Delete</a>
                            <a href="/details/editdetail/${detail.id}"
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
