<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    String productId = request.getParameter("productId");
    String productPriceStr = request.getParameter("productPrice");
    String quantityStr = request.getParameter("quantity");
    String memberIdStr = request.getParameter("MemberID");
    String source = request.getParameter("source");
    String redirect = request.getParameter("redirect");

    if (productId == null || productPriceStr == null || quantityStr == null || memberIdStr == null || source == null) {
        out.println("缺少必要的參數");
        return;
    }

    int productPrice = Integer.parseInt(productPriceStr);
    int quantity = Integer.parseInt(quantityStr);
    int memberId = Integer.parseInt(memberIdStr);

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/FinalProject?serverTimezone=UTC";
        conn = DriverManager.getConnection(url, "root", "Ray_930715");

        String sql = "INSERT INTO cart (MemberID, ProductID, quantity) VALUES (?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, memberId);
        pstmt.setString(2, productId);
        pstmt.setInt(3, quantity);

        pstmt.executeUpdate();
%>
        <script>
            alert("商品已加入購物車");
            <% if ("payment".equals(redirect)) { %>
                window.location.href = "./payment.jsp";
            <% } else if ("AllProduct_LoggedIn.jsp".equals(source)) { %>
                window.location.href = "./AllProduct_LoggedIn.jsp";
            <% } else { %>
                window.location.href = "./product_LoggedIn.jsp?productId=<%= productId %>";
            <% } %>
        </script>
<%
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        out.println("MySQL 錯誤: " + e.getMessage());
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
