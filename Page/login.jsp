<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        String url = "jdbc:mysql://localhost:3306/FinalProject?serverTimezone=UTC";
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, "root", "Ray_930715");

        // First, check if user is a seller
        String sqlSeller = "SELECT * FROM seller WHERE email = ? AND password = ?";
        pstmt = conn.prepareStatement(sqlSeller);
        pstmt.setString(1, email);
        pstmt.setString(2, password);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            session.setAttribute("userEmail", email);
            response.sendRedirect("./manager.jsp");
            return;
        } else {
            // Check if user is a member
            String sqlMember = "SELECT * FROM membership WHERE MemberAccount = ? AND MemberPassword = ?";
            pstmt = conn.prepareStatement(sqlMember);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                session.setAttribute("userEmail", email);
                session.setAttribute("MemberID", rs.getInt("MemberID"));
                response.sendRedirect("./memberPage.jsp");
                return;
            } else {
                // Login failed
                out.println("<script type=\"text/javascript\">");
                out.println("alert('登入失敗: 無效的電子郵件或密碼');");
                out.println("window.location.href = './index.jsp';");
                out.println("</script>");
                return;
            }
        }

    } catch (ClassNotFoundException e) {
        out.println("JDBC Driver not found: " + e.toString());
    } catch (SQLException sExec) {
        out.println("SQL Error: " + sExec.toString());
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }
%>
