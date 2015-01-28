<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create a new car</title>
</head>
<body>



      <form:form method="post" action="createcar" modelAttribute="car">
          <table align="left" style="padding-left: 300px;">
              <tr>
                  <td
                          style="font-family: 'arial'; font-size: 16px; font-weight: bold;"
                          align="left">Create Car</td>
              </tr>
              <tr align="left">
                  <td>
                      <table class="border" cellpadding="10">
                          <tr>
                              <td class="td"><b>Name:</b></td>
                              <td class="td"><form:input path="name" /></td>
                          </tr>
                      </table>
                  </td>
              </tr>

              <tr align="left">
                  <td>
                      <table style="padding-left: 100px;">
                          <tr align="center">
                              <td class="td"><input type="submit" value="Add a car" /></td>
                          </tr>
                      </table>
                  </td>
              </tr>
          </table>

      </form:form><br>

<a href="/">Car list</a><br>
</body>
</html>
