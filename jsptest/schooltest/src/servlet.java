import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/LoginServlet")
public class servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String USERNAME = "admin";
    private static final String PASSWORD = "password";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("username");
        String pwd = request.getParameter("password");

        HttpSession session = request.getSession();
        Map<String, Object> attributes = new HashMap<>();

        if (USERNAME.equals(user) && PASSWORD.equals(pwd)) {
            session.setAttribute("user", user);
            response.sendRedirect("welcome.jsp");
        } else {
            attributes.put("error", "用户名或密码错误请重新登录");
            request.setAttribute("error", attributes.get("error"));
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
