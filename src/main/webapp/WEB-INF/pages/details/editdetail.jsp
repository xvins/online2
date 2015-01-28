<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="mytag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Edit detail</title>
    <style type="text/css">
        .td {
            font-family: 'arial';
            font-size: 12px;
            vertical-align: top;
        }
    </style>
</head>
<body>
<form:form modelAttribute="detail" method="PUT">
    <table align="left" style="padding-left: 300px;">
        <tr>
            <td
                    style="font-family: 'arial'; font-size: 16px; font-weight: bold;"
                    align="left">Detail</td>
        </tr>
        <tr align="left">
            <td>
                <table class="border" cellpadding="10">
                    <%--<tr>--%>
                        <%--<td class="td"><b>Id:</b></td>--%>
                        <%--<td class="td"><mytag:inputField name="id" readonly/></td>--%>
                    <%--</tr>--%>
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
                        <td class="td"><input type="submit" value="Save" /> &nbsp;
                            &nbsp;<a
                                    href="${pageContext.request.contextPath}/details"
                                    style="color: green"><b>Go Back</b></a></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</form:form>
</html>