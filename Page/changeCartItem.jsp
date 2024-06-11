<%@ page import="java.sql.*" %>
<%
    String action = request.getParameter("action");
    String cartID = request.getParameter("cartID");
    String referer = request.getHeader("referer"); // Get the referer URL

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/FinalProject", "root", "Ray_930715");

        if ("update".equals(action)) {
            String quantity = request.getParameter("quantity");
            String sql = "UPDATE cart SET quantity = ? WHERE cartID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(quantity));
            pstmt.setInt(2, Integer.parseInt(cartID));
        } else if ("delete".equals(action)) {
            String sql = "DELETE FROM cart WHERE cartID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(cartID));
        }

        pstmt.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }

    // Redirect back to the referer page after updating or deleting
    if (referer != null) {
        response.sendRedirect(referer);
    } else {
        response.sendRedirect("./index_LoggedIn.jsp"); // Fallback if no referer
    }
%>
