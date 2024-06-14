<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    // 设置请求的字符编码为 UTF-8
    request.setCharacterEncoding("UTF-8");

    // 获取当前用户的电子邮件
    String email = (String) session.getAttribute("userEmail");

    // 获取表单提交的数据
    String userName = request.getParameter("username");
    String userPhone = request.getParameter("phone");
    String userBirthday = request.getParameter("birthday");
    String userAddress = request.getParameter("address");

    Connection conn = null;
    PreparedStatement pstmt = null;
    String message = "";

    // 输入验证
    if (userName != null && !userName.isEmpty() &&
        userPhone != null && !userPhone.isEmpty() &&
        userBirthday != null && !userBirthday.isEmpty() &&
        userAddress != null && !userAddress.isEmpty()) {

        try {
            // 连接到数据库
            String url = "jdbc:mysql://localhost:3306/FinalProject?serverTimezone=UTC";
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, "root", "Ray_930715");

            // 更新用户信息
            String sql = "UPDATE membership SET MemberName = ?, MemberPhone = ?, BirthdayDate = ?, Address = ? WHERE MemberAccount = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userName);
            pstmt.setString(2, userPhone);
            pstmt.setDate(3, java.sql.Date.valueOf(userBirthday));
            pstmt.setString(4, userAddress);
            pstmt.setString(5, email);

            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                message = "更新成功";
            } else {
                message = "更新失败";
            }

            conn.close();
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        }
    } else {
        message = "請重新輸入有效的資訊";
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="3;url=./memberPage.jsp">
    <title>資料更新</title>
</head>
<body>
    <script>
        alert("<%= message %>");
        window.location.href = "./memberPage.jsp";
    </script>
</body>
</html>
