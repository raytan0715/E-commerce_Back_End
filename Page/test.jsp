<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Images</title>
</head>
<body>
    <h1>Product Images</h1>
    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            // 加载JDBC驱动
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/FinalProject";
            String dbUsername = "root";
            String dbPassword = "Ray_930715";

            // 建立连接
            conn = DriverManager.getConnection(url, dbUsername, dbPassword);

            // 创建声明
            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            String sql = "SELECT * FROM inventoryquantity";
            rs = stmt.executeQuery(sql);

            // 遍历结果集
            while (rs.next()) {
                String imageUrl = rs.getString("Producturl");
                String productName = rs.getString("ProductName");
    %>
                <div>
                    <h2><%= productName %></h2>
                    <img src="<%= imageUrl %>" alt="<%= productName %>">
                    
                </div>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
    %>
        <p>Error: <%= e.getMessage() %></p>
    <%
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
            if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    %>
</body>
</html>
