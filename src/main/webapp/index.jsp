<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page import="util.SessionUtils" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>E-Commerce App - ChromaCart</title>

    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }

        .main-navbar {
            border-bottom: 1px solid #ccc;
            background-color: #fff;
            padding: 10px 0;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .main-navbar .top-navbar {
            background-color: #2874f0;
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .main-navbar .top-navbar .brand-name {
            color: #fff;
            display: inline-flex;
            align-items: center;
        }

        .main-navbar .top-navbar .brand-name img {
            width: 20px; /* Adjust size as needed */
            margin-right: 8px; /* Space between flag and brand name */
        }

        .main-navbar .top-navbar .nav-link {
            color: #fff;
            font-size: 16px;
            font-weight: 500;
        }

        .product-card {
            margin: 15px 0;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .product-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .product-card .card-body {
            padding: 15px;
        }

        .product-card .card-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .product-card .card-text {
            font-size: 16px;
            color: #666;
        }

        .carousel-item img {
            width: 100%; /* Ensures images fill the carousel */
            height: auto; /* Maintain aspect ratio */
        }

        .carousel-control-prev-icon {
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23fff' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E");
        }

        .carousel-control-next-icon {
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23fff' viewBox='0 0 8 8'%3E%3Cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E");
        }

        .footer {
            background-color: #333;
            color: #fff;
            padding: 20px 0;
            text-align: center;
        }

        .footer a {
            color: #fff;
            text-decoration: none;
        }

        .footer a:hover {
            color: #ccc;
        }

        .social-links {
            margin-top: 20px;
        }

        .social-links a {
            margin-right: 20px;
        }

        .social-links i {
            font-size: 24px;
        }

        .copyright {
            margin-top: 20px;
            font-size: 14px;
        }
        .carousel-item img {
    height: 400px; /* Set a height that fits your design */
    object-fit: ; /* Ensures the image covers the area without distortion */
}
        
    </style>
</head>
<body>
    <div class="main-navbar shadow-sm sticky-top">
        <div class="top-navbar">
            <div class="container-fluid">
                <div class="row">
 <div class="col-md-2 my-auto d-none d-sm-none d-md-block d-lg-block">
                        <h5 class="brand-name">
                            <img src="https://upload.wikimedia.org/wikipedia/en/4/41/Flag_of_India.svg" alt="Indian Flag"> 
                            ChromaCart
                        </h5>
                    </div>
                    <div class="col-md-5 my-auto">
                        <form role="search">
                            <div class="input-group">
                                <input type="search" placeholder="Search your product" class="form-control" />
                                <button class="btn bg-white" type="submit">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-5 my-auto">
                        <ul class="nav justify-content-end">
                            <li class="nav-item">
                                <a class="nav-link" href="cart.jsp">
                                    <i class="fa fa-shopping-cart"></i>  %>)
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="wishlist.jsp">
                                    <i class="fa fa-heart"></i> Wishlist (0)
                                </a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fa fa-user"></i> Username 
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="profile.jsp"><i class="fa fa-user"></i> Profile</a></li>
                                    <li><a class="dropdown-item" href="myOrders.jsp"><i class="fa fa-list"></i> My Orders</a></li>
                                    <li><a class="dropdown-item" href="wishlist.jsp"><i class="fa fa-heart"></i> My Wishlist</a></li>
                                    <li><a class="dropdown-item" href="cart.jsp"><i class="fa fa-shopping-cart"></i> My Cart</a></li>
                                    <li><a class="dropdown-item" href="logout.jsp"><i class="fa fa-sign-out"></i> Logout</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand d-block d-sm-block d-md-none d-lg-none" href="#">
                    ChromaCart
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="categories.jsp">All Categories</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="newArrivals.jsp">New Arrivals</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="featuredProducts.jsp">Featured Products</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="electronics.jsp">Electronics</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="fashion.jsp">Fashion</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="accessories.jsp">Accessories</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="appliances.jsp">Home Appliances</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>

   <div id="dealCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <a href="https://www.amazon.in/dp/B08N5WRWNZ" target="_blank">
                <img alt="Deal 1" src="https://www.collectoffers.com/blog/wp-content/uploads/2021/10/diwali-festival-sale-background-template-with-diya-vector-17274689.jpg" class="d-block w-100">
            </a>
        </div>
        <div class="carousel-item">
            <a href="https://www.amazon.in/dp/B08KH3SYH2" target="_blank">
                <img alt="Deal 2" src="https://m.media-amazon.com/images/I/81KkrQWEHIL._SX3000_.jpg" class="d-block w-100">
            </a>
        </div>
        <div class="carousel-item">
            <a href="https://www.amazon.in/dp/B08Y7D8J7T" target="_blank">
                <img alt="Deal 3" src="https://m.media-amazon.com/images/I/61zAjw4bqPL._SX3000_.jpg" class="d-block w-100">
            </a>
        </div>
        <div class="carousel-item">
            <a href="https://www.amazon.in/dp/B08BGHYBWN" target="_blank">
                <img alt="Deal 4" src="https://m.media-amazon.com/images/I/71qcoYgEhzL._SX3000_.jpg" class="d-block w-100">
            </a>
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#dealCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#dealCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

    <!-- Products Section -->
    <div class="container my-4">
    <h2>Featured Products</h2>
    <div class="row">
        <%
            String dbURL = "jdbc:mysql://localhost:3306/ecommerce_db";
            String dbUser = "root";
            String dbPass = "123456789";
            List<Product> products = new ArrayList<>();
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
                Statement statement = connection.createStatement();
                String sql = "SELECT id, name, price, image_url FROM products";
                ResultSet rs = statement.executeQuery(sql);
                
                while (rs.next()) {
                    Product product = new Product();
                    product.setId(rs.getInt("id"));
                    product.setName(rs.getString("name"));
                    product.setPrice(rs.getDouble("price"));
                    product.setImageUrl(rs.getString("image_url"));
                    products.add(product);
                }
                connection.close();
            } catch (Exception e) {
                e.printStackTrace(); // Consider logging this in production
            }
            
            for (Product product : products) {
        %>
            <div class="col-md-3 product-card">
                <div class="card">
                    <img src="<%= product.getImageUrl() %>" class="card-img-top" alt="<%= product.getName() %>">
                    <div class="card-body">
                        <h5 class="card-title"><%= product.getName() %></h5>
                        <p class="card-text">₹<%= product.getPrice() %></p>
                        <form action="addToCart.jsp" method="post">
                            <input type="hidden" name="productId" value="<%= product.getId() %>">
                            <button type="submit" class="btn btn-primary">Add to Cart</button>
                        </form>
                    </div>
                </div>
            </div>
        <%
            }
        %>
    </div>
</div>

    <!-- Footer -->
    <div class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h5>About Us</h5>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet nulla auctor, vestibulum magna sed, convallis ex.</p>
                </div>
                <div class="col-md-4">
                    <h5>Quick Links</h5>
                    <ul>
                        <li><a href="#">Home</a></li>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <h5>Follow Us</h5>
                    <div class="social-links">
                        <a href="#" target="_blank"><i class="fa fa-facebook"></i></a>
                        <a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                        <a href="#" target="_blank"><i class="fa fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="copyright">
                &copy; 2023 ChromaCart. All rights reserved.
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>