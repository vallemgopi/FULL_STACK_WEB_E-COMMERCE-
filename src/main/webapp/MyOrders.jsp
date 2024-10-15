<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Orders - ChromaCart</title>
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

        h2 {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container my-4">
        <h2 class="text-center">My Orders</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Order Date</th>
                    <th>Total Amount</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1001</td>
                    <td>2024-10-01</td>
                    <td>₹2,500</td>
                    <td>Shipped</td>
                </tr>
                <tr>
                    <td>1002</td>
                    <td>2024-10-05</td>
                    <td>₹1,200</td>
                    <td>Delivered</td>
                </tr>
                <tr>
                    <td>1003</td>
                    <td>2024-10-10</td>
                    <td>₹3,000</td>
                    <td>Processing</td>
                </tr>
                <tr>
                    <td>1004</td>
                    <td>2024-10-12</td>
                    <td>₹750</td>
                    <td>Cancelled</td>
                </tr>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
