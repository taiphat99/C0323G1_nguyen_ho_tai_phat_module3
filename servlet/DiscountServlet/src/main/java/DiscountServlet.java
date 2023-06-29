import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountServlet", value = "/discount_calculator")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float list_price = Float.parseFloat(request.getParameter("list_price"));
        float discount_percent = Float.parseFloat(request.getParameter("discount_percent"));
        String product_name = request.getParameter("product_name");
        float discount_price = list_price * discount_percent * 0.01f;
        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h4>"+product_name+"<h4>");
        writer.println("<h4>Discount Amount:" + discount_price + "</h4>");
        writer.println("<h4>Discount Price:" + (list_price - discount_price) + "</h4>");
        writer.println("</html>");
    }
}
