<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%

    // 設置發送到資料庫的字符編碼為UTF-8
    request.setCharacterEncoding("UTF-8");
    
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    Connection conn = null;
    PreparedStatement pstmt = null;
    String message = "";

    if (email != null && !email.isEmpty() && password != null && !password.isEmpty()) {
        try {
            // 連接到資料庫
            String url = "jdbc:mysql://localhost:3306/FinalProject?serverTimezone=UTC";
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, "root", "Ray_930715");

            // 更新用户密码
            String sql = "UPDATE membership SET MemberPassword = ? WHERE MemberAccount = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, password);  // 直接使用用户输入的密码
            pstmt.setString(2, email);

            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                session.setAttribute("updateMessage", "更新成功");
            } else {
                session.setAttribute("updateMessage", "密碼更新失敗");
            }
            // 重定向到 memberPage.jsp
            response.sendRedirect("./memberPage.jsp");

            conn.close();
        } catch (Exception e) {
            message = "错误: " + e.getMessage();
        }
    } else {
        message = "請輸入有效的資料。";
    }
%>

<script>
    alert("<%= message %>");
</script>
