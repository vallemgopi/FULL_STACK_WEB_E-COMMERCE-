ChromaCart - Full Stack E-commerce Web Application

Welcome to **ChromaCart**, a full-featured e-commerce platform developed using **Java (JSP & Servlets)** and **MySQL**. This application provides users with a dynamic shopping experience, complete with product browsing, cart management, and order processing.

### **Features**
- **User Authentication:** Register, Login, and Logout functionality.
- **Product Management:** Browse categories, search for products, and view product details.
- **Cart & Wishlist:** Add/remove items from cart and wishlist.
- **Order Management:** Place orders and view order history.
- **Responsive UI:** Built using **Bootstrap 5** for mobile-friendly design.

---

### **Technologies Used**
- **Frontend:** HTML, CSS, Bootstrap 5
- **Backend:** Java, JSP, Servlets
- **Database:** MySQL
- **Server:** Apache Tomcat

---

### **Project Setup**

#### 1. Clone the Repository
```bash
git clone git@github.com:vallemgopi/FULL_STACK_WEB_E-COMMERCE-.git
cd FULL_STACK_WEB_E-COMMERCE-
```

#### 2. Database Setup
1. Create a new MySQL database named **ecommerce_db**.
2. Update the database credentials in `application.properties` or relevant JSP files:
   ```java
   String dbURL = "jdbc:mysql://localhost:3306/ecommerce_db";
   String dbUser = "root";
   String dbPass = "123456789";
   ```
3. Import the SQL schema (if provided) to initialize the database.

#### 3. Install Dependencies (Frontend)
Navigate to the frontend directory and install necessary Node.js dependencies:
```bash
cd frontend
npm install
```

#### 4. Build and Run the Backend
Use the following commands if using **Gradle** or **Maven**:

**Gradle:**
```bash
./gradlew build
./gradlew bootRun
```

**Maven:**
```bash
mvn clean install
mvn spring-boot:run
```

#### 5. Run the Application
1. Start the Apache Tomcat server and deploy the project.
2. Access the frontend via:
   ```
   http://localhost:3000
   ```
3. Access the backend via:
   ```
   http://localhost:8080
   ```

---

### **Usage**
1. **Home Page:** Browse product categories and featured products.
2. **Search Products:** Use the search bar to find products.
3. **Cart & Wishlist:** Manage items added to your cart and wishlist.
4. **Place Orders:** Proceed to checkout and confirm orders.
5. **User Profile:** View order history and update profile information.

---

### **Project Structure**
```
FULL_STACK_WEB_E-COMMERCE-/
│
├── frontend/                # Frontend code (React/HTML)
├── src/                     # Backend code (Java Servlets)
│   ├── model/               # Java models
│   ├── dao/                 # Data Access Objects
│   └── servlet/             # Java servlets for handling requests
├── webapp/                  # JSP and HTML pages
│   ├── index.jsp            # Home page
│   ├── cart.jsp             # Shopping cart page
│   └── ...                  # Other JSP pages
└── README.md                # Project documentation



