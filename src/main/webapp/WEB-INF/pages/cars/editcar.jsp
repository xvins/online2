<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="mytag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Edit car</title>
    <style type="text/css">
        .td {
            font-family: 'arial';
            font-size: 12px;
            vertical-align: top;
        }
    </style>
</head>
<body>
<form:form modelAttribute="car" method="PUT">
<table align="left" style="padding-left: 300px;">
    <tr>
        <td
                style="font-family: 'arial'; font-size: 16px; font-weight: bold;"
                align="left">Car</td>
    </tr>
    <tr align="left">
        <td>
            <table class="border" cellpadding="10">
                <tr>
                    <td class="td"><b>Name:</b></td>
                    <td class="td"><mytag:inputField name="name"/></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr align="left">
        <td>
            <table style="padding-left: 100px;">
                <tr align="center">
                    <td class="td"><input type="submit" value="Save" /> &nbsp;
                        &nbsp;<a
                                href="${pageContext.request.contextPath}/"
                                style="color: green"><b>Go Back</b></a></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</form:form>
</html>