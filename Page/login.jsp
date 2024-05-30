<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    // 從前端獲取用戶輸入的登入信息
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    // 設置資料庫連接相關變數
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // 連接到 MySQL 資料庫
        String url = "jdbc:mysql://localhost:3306/FinalProject?serverTimezone=UTC"; // 使用具體的資料庫名稱
        Class.forName("com.mysql.cj.jdbc.Driver"); // 確保使用正確的 MySQL 驅動
        conn = DriverManager.getConnection(url, "root", "Ray_930715");

        // 檢查連接是否成功
        if (conn.isClosed()) {
            out.println("連接失敗");
        } else {
            // 檢查用戶是否存在以及密碼是否正確
            String sql = "SELECT * FROM membership WHERE MemberAccount = ? AND MemberPassword = ?";
            
            // 使用 PreparedStatement 防止 SQL 注入
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            // 執行查詢操作
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // 登入成功，設置會話屬性
                session.setAttribute("userEmail", email);

                // 重定向到 index.html
                response.sendRedirect("./memberPage.jsp");
                return;
            } else {
                // 登入失敗，重定向到登入頁面並顯示錯誤消息
                response.sendRedirect("login.jsp?error=Invalid email or password");
            }
        }

        // 關閉資料庫連接
        conn.close();
    } catch (ClassNotFoundException e) {
        // 處理 JDBC 驅動類錯誤
        out.println("JDBC 駕駛程序類未找到: " + e.toString());
    } catch (SQLException sExec) {
        // 處理 SQL 錯誤
        out.println("SQL 錯誤: " + sExec.toString());
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }
%>
