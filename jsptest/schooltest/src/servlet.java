import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/loginServlet")
public class servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // JDBC 驱动名及数据库 URL
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/xlbook";

    // 数据库的用户名与密码，需要根据自己的设置修改
    static final String USER = "root";
    static final String PASS = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            // 注册 JDBC 驱动
            Class.forName(JDBC_DRIVER);

            // 打开链接
            Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

            // 查询数据库
            String sql = "SELECT * FROM customer WHERE username = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            // 展开结果集数据库
            if (rs.next()) {
                // 用户正确
                // 重定向到欢迎页面，并传递书籍列表
                List<Book> books = getBooksFromDatabase(conn);
                request.setAttribute("books", books);
                response.sendRedirect("welcome.jsp");
            } else {
                // 用户错误
                request.setAttribute("error", "用户名或密码错误");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

            // 完成后关闭
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception se) {
            // 处理 JDBC 错误
            se.printStackTrace();
            out.println("<h2>Error: " + se.getMessage() + "</h2>");
        } finally {
            out.close();
        }
    }



    private List<Book> getBooksFromDatabase(Connection conn) throws SQLException {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT bookname, author, publish , price FROM books";
        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Book book = new Book();
                book.setBookname(rs.getString("bookname"));
                book.setAuthor(rs.getString("author"));
                book.setPublish(rs.getString("publish"));
                book.setPrice(rs.getString("price"));
                books.add(book);
            }
        }
        return books;
    }
}
