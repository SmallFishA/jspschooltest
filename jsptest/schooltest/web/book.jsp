<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<%--导入java.sql包--%>
<html>
<head>
    <title>从db_book数据库中读出book表</title>
</head>
<body>
<style>
    .box{
        display: flex;
        height: 100px;
        width: 100%;
        border-bottom:1px solid black;
        text-align: left;
        font-size: 16px;
        color:black;
        padding: 0;
        margin:10px;
        margin-left: 0;
        align-items: center; /* 垂直居中 */
    }
    .book-image {
        width: 100px; /* 确保图片不会超出容器宽度 */
        height: auto; /* 保持图片比例 */
    }
    img{
        margin-right: 10px;
    }
</style>
    <%
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/xlbook"; //数据库名
            String username = "root"; //数据库用户名
            String password = "root"; //数据库用户密码
            Connection conn = DriverManager.getConnection(url, username, password); //连接状态
    %>
            <%
				Statement stmt = null;
					ResultSet rs = null;
					String sql = "SELECT * FROM books;"; //查询语句
					stmt = conn.createStatement();
					rs = stmt.executeQuery(sql);
					while (rs.next()) {
			%>
            <div class="box">
            <img class="book-image" src="<%=rs.getString("image")%>" alt="Image"><br>
            <%=rs.getString("bookname")%><br>
            <%=rs.getString("author")%><br>
            <%=rs.getString("publish")%><br>
            <%=rs.getFloat("price")%><br>
            </div>
            <%
				}
                    rs.close(); // 关闭ResultSet
                    stmt.close(); // 关闭Statement
                    conn.close(); // 关闭Connection
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
</body>
</html>


