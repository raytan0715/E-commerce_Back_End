<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    // 獲取參數
    String cartIDStr = request.getParameter("cartID");
    String memberIDStr = request.getParameter("MemberID");
    String productID = request.getParameter("productId");
    String quantityStr = request.getParameter("quantity");
    String priceStr = request.getParameter("productPrice");
    String date = request.getParameter("date");
    String totalpriceStr = request.getParameter("totalprice");
    String remark = request.getParameter("remark");

    // 檢查所有參數是否存在
    if (cartIDStr == null || memberIDStr == null || productID == null || quantityStr == null || priceStr == null || date == null || totalpriceStr == null || remark == null) {
        out.println("缺少必要的參數。請返回並重試。");
    } else {
        int cart_orderid = Integer.parseInt(cartIDStr);
        int MemberID = Integer.parseInt(memberIDStr);
        int quantity = Integer.parseInt(quantityStr);
        int price = Integer.parseInt(priceStr);
        int totalprice = Integer.parseInt(totalpriceStr);

        // Output the values to the page
        out.println("<h3>Received Values:</h3>");
        out.println("<p>cart_orderid: " + cart_orderid + "</p>");
        out.println("<p>MemberID: " + MemberID + "</p>");
        out.println("<p>ProductID: " + productID + "</p>");
        out.println("<p>quantity: " + quantity + "</p>");
        out.println("<p>price: " + price + "</p>");
        out.println("<p>date: " + date + "</p>");
        out.println("<p>totalprice: " + totalprice + "</p>");
        out.println("<p>remark: " + remark + "</p>");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/FinalProject?serverTimezone=UTC";
            conn = DriverManager.getConnection(url, "root", "Ray_930715");

            String sql = "INSERT INTO orderitems (cart_orderid, MemberID, ProductID, quantity, price, date, totalprice, remark) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, cart_orderid);
            pstmt.setInt(2, MemberID);
            pstmt.setString(3, productID);
            pstmt.setInt(4, quantity);
            pstmt.setInt(5, price);
            pstmt.setString(6, date);
            pstmt.setInt(7, totalprice);
            pstmt.setString(8, remark);
            pstmt.executeUpdate();

            out.println("<p>Order inserted successfully.</p>");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            out.println("<p>MySQL 錯誤: " + e.getMessage() + "</p>");
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
%>
