<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    // 設置發送到資料庫的字符編碼為UTF-8
    request.setCharacterEncoding("UTF-8");

    // 獲取表單參數
    String username = request.getParameter("username");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String confirm_password = request.getParameter("confirm_password");

    // 檢查參數是否為null或為空
    if (username == null || phone == null || email == null || password == null || confirm_password == null ||
        username.isEmpty() || phone.isEmpty() || email.isEmpty() || password.isEmpty() || confirm_password.isEmpty()) {
        response.sendRedirect("register.jsp?error=Missing required fields");
        return;
    }

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // 加載JDBC驅動程序
        Class.forName("com.mysql.cj.jdbc.Driver");

        // 連接到MySQL資料庫
        String url = "jdbc:mysql://localhost:3306/FinalProject?serverTimezone=UTC";
        conn = DriverManager.getConnection(url, "root", "Ray_930715");

        // 檢查連接是否成功
        if (conn.isClosed()) {
            out.println("連接失敗");
        } else {
            // 確認密碼是否匹配
            if (password.equals(confirm_password)) {
                // 插入新用戶資料的SQL語句
                String sql = "INSERT INTO membership (MemberName, MemberPhone, MemberAccount, MemberPassword) VALUES (?, ?, ?, ?)";
                
                // 使用PreparedStatement防止SQL注入
                pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                pstmt.setString(1, username);  // 設置第一個參數：用戶名
                pstmt.setString(2, phone);  // 設置第二個參數：手機號
                pstmt.setString(3, email);  // 設置第三個參數：電子郵件
                pstmt.setString(4, password);  // 設置第四個參數：密碼

                // 執行插入操作
                pstmt.executeUpdate();

                ResultSet rs = pstmt.getGeneratedKeys();
                if (rs.next()) {
                    int memberId = rs.getInt(1);
                    // 設置會話屬性
                    session.setAttribute("MemberID", memberId);
                }

                // 設置會話屬性
                session.setAttribute("userEmail", email);

                // 註冊成功，重定向到memberPage.jsp
                response.sendRedirect("./memberPage.jsp");
                return;
            } else {
                // 密碼不匹配，重定向到註冊頁面並顯示錯誤消息
                response.sendRedirect("register.jsp?error=Password does not match");
            }
        }

        // 關閉資料庫連接
        conn.close();
    } catch (ClassNotFoundException e) {
        out.println("找不到JDBC驅動程序類：" + e.toString()); // 捕獲JDBC驅動程序類未找到異常並輸出
    } catch (SQLException sExec) {
        out.println("SQL錯誤：" + sExec.toString()); // 捕獲SQL異常並輸出
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }
%>
