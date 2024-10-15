<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page import="util.SessionUtils" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>


<%
    int productId = Integer.parseInt(request.getParameter("productId"));

    // Get cart from session
    List<Product> cart = SessionUtils.getCart(session);

    // Remove product from cart by matching ID
    cart.removeIf(product -> product.getId() == productId);

    // Redirect back to cart page
    response.sendRedirect("cart.jsp");
%>
