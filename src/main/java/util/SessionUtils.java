package util;

import javax.servlet.http.HttpSession; // Change this line to javax
import model.Product;
import java.util.List;
import java.util.ArrayList;

public class SessionUtils {
    @SuppressWarnings("unchecked")
    public static List<Product> getCart(HttpSession session) {
        Object cartObj = session.getAttribute("cart");
        if (cartObj instanceof List<?>) {
            return (List<Product>) cartObj;
        } else {
            List<Product> newCart = new ArrayList<>();
            session.setAttribute("cart", newCart);
            return newCart;
        }
    }

    public static void setCart(HttpSession session, List<Product> cart) {
        session.setAttribute("cart", cart); // Store the updated cart in the session
    }
}

