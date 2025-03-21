<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>JSP Form with Array Storage</title>
</head>
<body>
    <h2>Enter User Details</h2>
    <form action="" method="post">
        Name: <input type="text" name="name" required><br>
        Email: <input type="email" name="email" required><br>
        <input type="submit" value="Submit">
    </form>

    <h3>Stored Data:</h3>
    <ul>
    <%
        // Retrieve or initialize the session attribute for storing user data
        ArrayList<String[]> users = (ArrayList<String[]>) session.getAttribute("users");
        if (users == null) {
            users = new ArrayList<>();
            session.setAttribute("users", users);
        }

        // Get form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        
        // Store data if submitted
        if (name != null && email != null) {
            users.add(new String[]{name, email});
        }

        // Display stored data
        for (String[] user : users) {
    %>
        <li><%= user[0] %> - <%= user[1] %></li>
    <%
        }
    %>
    </ul>
</body>
</html>
