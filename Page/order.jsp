<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.text.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
request.setCharacterEncoding("UTF-8");

String remark = request.getParameter("remark");
String memberIDStr = request.getParameter("MemberID");
String dateStr = request.getParameter("date");

if (memberIDStr == null || memberIDStr.isEmpty()) {
    out.println("<p>所有字段都必須填寫並且不能為空</p>");
} else {
    Connection conn = null;
    PreparedStatement pstmt = null;
    PreparedStatement orderPstmt = null;
    PreparedStatement deletePstmt = null;
    ResultSet rs = null;

    try {
        int MemberID = Integer.parseInt(memberIDStr);

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/FinalProject", "root", "Ray_930715");
        conn.setAutoCommit(false); // 開始交易

        // 獲取購物車商品並插入訂單項目表
        String cartSql = "SELECT c.cartID, c.productID, c.quantity, i.Price, i.ProductName, i.Producturl FROM cart c JOIN inventoryquantity i ON c.productID = i.ProductID WHERE c.MemberID = ?";
        pstmt = conn.prepareStatement(cartSql);
        pstmt.setInt(1, MemberID);
        rs = pstmt.executeQuery();

        int totalPrice = 0;
        while (rs.next()) {
            int cartID = rs.getInt("cartID");
            int productId = rs.getInt("productID");
            int quantity = rs.getInt("quantity");
            int price = rs.getInt("Price");
            String productName = rs.getString("ProductName");
            String productUrl = rs.getString("Producturl");

            // 計算總價格
            totalPrice += price * quantity;

            // 插入訂單項目表
            String orderItemSql = "INSERT INTO orderitems (MemberID, ProductID, quantity, price, date, totalprice, remark, Producturl, ProductName) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            orderPstmt = conn.prepareStatement(orderItemSql);
            orderPstmt.setInt(1, MemberID);
            orderPstmt.setInt(2, productId);
            orderPstmt.setInt(3, quantity);
            orderPstmt.setInt(4, price);
            orderPstmt.setString(5, dateStr);
            orderPstmt.setInt(6, price * quantity);
            orderPstmt.setString(7, remark);
            orderPstmt.setString(8, productUrl);
            orderPstmt.setString(9, productName);
            orderPstmt.executeUpdate();
        }

        // 刪除購物車中的項目
        String deleteCartSql = "DELETE FROM cart WHERE MemberID = ?";
        deletePstmt = conn.prepareStatement(deleteCartSql);
        deletePstmt.setInt(1, MemberID);
        deletePstmt.executeUpdate();

        conn.commit(); // 提交交易

        out.println("<p>訂單已成功提交並刪除購物車中的相關項目</p>");
        %>
        <script>
            alert("謝謝購買");
            window.location.href = "./memberPage.jsp";
        </script>
        <%
    } catch (NumberFormatException e) {
        if (conn != null) {
            conn.rollback(); // 回滾交易
        }
        out.println("<p>請確保所有字段都是有效的數字格式</p>");
    } catch (SQLException e) {
        if (conn != null) {
            conn.rollback(); // 回滾交易
        }
        out.println("<p>資料庫錯誤: " + e.getMessage() + "</p>");
    } catch (Exception e) {
        if (conn != null) {
            conn.rollback(); // 回滾交易
        }
        out.println("<p>提交訂單時發生錯誤: " + e.getMessage() + "</p>");
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (orderPstmt != null) orderPstmt.close();
            if (deletePstmt != null) deletePstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            out.println("<p>關閉資源時發生錯誤: " + e.getMessage() + "</p>");
        }
    }
}
%>
