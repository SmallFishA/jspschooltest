<!-- bookList.jsp -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Book List</title>
</head>
<body>
<h2>Welcome, ${sessionScope.username}!</h2> <!-- 假设你在登录成功后将用户名存储在了会话中 -->
<table border="1">
    <tr>
        <th>bookname</th>
        <th>author</th>
        <th>publish</th>
        <th>price</th>
    </tr>
    <c:forEach var="book" items="${requestScope.books}">
        <tr>
            <td>${book.bookname}</td>
            <td>${book.author}</td>
            <td>${book.publish}</td>
            <td>${book.price}</td>
        </tr>
    </c:forEach>
</table> 
</body>
</html>