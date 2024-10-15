<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Product" %>
<%@ page import="util.SessionUtils" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Cart - ChromaCart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }

        .container {
            max-width: 900px;
            margin: 40px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .my-4 {
            margin-top: 40px;
            margin-bottom: 40px;
        }

        .product-card {
            margin-bottom: 20px;
        }

        .card {
            border: none;
            transition: transform 0.2s; /* Smooth scaling effect */
        }

        .card:hover {
            transform: scale(1.02); /* Scale up on hover */
        }

        .card-img-top {
            height: 200px;
            object-fit: cover;
        }

        .card-body {
            padding: 15px;
        }

        .card-title {
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }

        .card-text {
            font-size: 16px;
            color: #666;
        }

        .btn-danger {
            background-color: #dc3545;
            border: none;
            padding: 10px 20px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s; /* Transition for button hover */
        }

        .btn-danger:hover {
            background-color: #c82333;
        }

        .btn-success {
            background-color: #28a745;
            border: none;
            padding: 10px 20px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s; /* Transition for button hover */
        }

        .btn-success:hover {
            background-color: #1f7e37;
        }

        .quantity-input {
            width: 60px;
            height: 35px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        .empty-cart {
            text-align: center;
            font-size: 20px;
            color: #999;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container my-4">
        <h2 class="text-center">My Cart</h2>
        <div class="row">
            <%
                List<Product> cart = SessionUtils.getCart(session); // Ensure this returns the cart products
                if (cart.isEmpty()) {
            %>
                <div class="empty-cart">Your cart is empty.</div>
            <%
                } else {
                    for (Product product : cart) {
            %>
                <div class="col-md-4 product-card">
                    <div class="card">
                        <img src="<%= product.getImageUrl() %>" class="card-img-top" alt="<%= product.getName() %>">
                        <div class="card-body">
                            <h5 class="card-title"><%= product.getName() %></h5>
                            <p class="card-text">₹<%= product.getPrice() %></p>
                            <form action="updateQuantity.jsp" method="post" class="d-inline">
                                <input type="hidden" name="productId" value="<%= product.getId() %>">
                                <input type="number" name="quantity" value="1" class="quantity-input" min="1">
                                <button type="submit" class="btn btn-success">Update Quantity</button>
                            </form>
                            <form action="removeFromCart.jsp" method="post" class="d-inline">
                                <input type="hidden" name="productId" value="<%= product.getId() %>">
                                <button type="submit" class="btn btn-danger">Remove from Cart</button>
                            </form>
                        </div>
                    </div>
                </div>
            <%
                    }
                }
            %>
        </div>
        <div class="row">
            <div class="col-md-12 text-right">
                <form action="checkout.jsp" method="post">
                    <button type="submit" class="btn btn-success">Buy Now</button>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
