package servlet;

import dao.ProductDAO;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ProductServlet extends HttpServlet implements java.io.Serializable {
    private static final long serialVersionUID = 1L; // Declare serialVersionUID
    private ProductDAO productDAO = new ProductDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productDAO.getAllProducts();
        
        // Set the product list in the request attribute
        request.setAttribute("productList", productList);
        
        // Forward to the products JSP page
        request.getRequestDispatcher("products.jsp").forward(request, response);
    }
}
