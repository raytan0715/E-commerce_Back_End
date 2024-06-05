<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<%
	try {
			Class.forName("com.mysql.jdbc.Driver");
			try {	
				String url="jdbc:mysql://localhost/?serverTimezone=UTC";
				Connection con=DriverManager.getConnection(url,"root","Ray_930715");
				if(con.isClosed())
				   out.println("連線建立失敗！");
				else{
					String sql="USE `FinalProject`";
					con.createStatement().execute(sql);
					request.setCharacterEncoding("UTF-8"); 
					
					// 從URL獲取productId
        			String productId = request.getParameter("productId");
					String number=request.getParameter("quantity");
					
					if(number==null)
						number="1";
					String userid="1";//注意，這邊應該是讀session存的ID
					String sql1="INSERT into `cart`(`customerID`,`productId`,`quantity`)";//寫入購物車
					sql1+="VALUES('"+userid+"','"+productId+"','"+number+"')";      
					
					con.createStatement().execute(sql1);
				
					con.close();
					out.print("已寫入購物車，接著要設計顯示購物車jsp，示範結束，請加油!!!!!");
					//response.sendRedirect("showcart.jsp");//這邊要設計顯示購物車
				}
			}
				
			catch (SQLException sExec) {
				out.println("MySQL 錯誤！"+sExec.toString()); 
			}
		}
		catch (ClassNotFoundException err) {
		  out.println("class 錯誤！"+err.toString()); 
		}
	
%>