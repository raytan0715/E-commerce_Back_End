<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*, java.io.*" %>
<%

    // 设置发送到数据库的字符编码为UTF-8
    request.setCharacterEncoding("UTF-8");

    String memberID = request.getParameter("MemberID");
    String productID = request.getParameter("ProductID");
    String starRatingStr = request.getParameter("starRating");
    String comment = request.getParameter("message");

    // 确认参数是否为 null 或空
    if (memberID == null || productID == null || starRatingStr == null || comment == null ||
        memberID.isEmpty() || productID.isEmpty() || starRatingStr.isEmpty() || comment.isEmpty()) {
        out.println("错误: 所有字段都是必填的");
        return;
    }

    int starRating = 0;
    try {
        starRating = Integer.parseInt(starRatingStr);
    } catch (NumberFormatException e) {
        out.println("错误: 星级评分必须是数字");
        return;
    }

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // 连接到 MySQL 数据库
        String url = "jdbc:mysql://localhost:3306/FinalProject?serverTimezone=UTC";
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, "root", "Ray_930715");

        String sql = "INSERT INTO comment (MemberID, ProductID, star, comment) VALUES (?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);

        pstmt.setInt(1, Integer.parseInt(memberID));
        pstmt.setInt(2, Integer.parseInt(productID));
        pstmt.setInt(3, starRating);
        pstmt.setString(4, comment);
        pstmt.executeUpdate();

        // 数据成功插入数据库后执行重定向
        response.sendRedirect("./product_LoggedIn.jsp?productId=" + productID);

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script type=\"text/javascript\">");
        out.println("alert('错误信息: " + e.getMessage() + "');");
        out.println("window.location.href = './index_LoggedIn.jsp';"); // 重定向到首页或其他适当的页面
        out.println("</script>");
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
