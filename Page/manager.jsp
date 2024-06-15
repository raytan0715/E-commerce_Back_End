<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" import="java.util.*" %>
<%! 
    public Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/FinalProject", "root", "Ray_930715");
    }
%>
<%
    // 檢查用戶是否登入
    String email = (String) session.getAttribute("userEmail");
    boolean isLoggedIn = (email != null);
    
    // 檢查用戶是否登入
    if (!isLoggedIn) {
        response.sendRedirect("./index.jsp"); // 若未登錄則重定向到首頁
        return;
    }

    // 設置緩存控制頭
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    if ("Update".equals(request.getParameter("action"))) {
        int productId = Integer.parseInt(request.getParameter("productId"));
        int price = Integer.parseInt(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = getConnection();
            String sql = "UPDATE inventoryquantity SET Price = ?, Quantity = ? WHERE ProductID = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, price);
            pstmt.setInt(2, quantity);
            pstmt.setInt(3, productId);
            pstmt.executeUpdate();
            out.println("<script>alert('Product updated successfully!');</script>");

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    if ("Add".equals(request.getParameter("action"))) {
        String productName = request.getParameter("productName");
        int price = Integer.parseInt(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = getConnection();
            String sql = "INSERT INTO inventoryquantity (ProductName, Price, Quantity) VALUES (?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, productName);
            pstmt.setInt(2, price);
            pstmt.setInt(3, quantity);
            pstmt.executeUpdate();
            out.println("<script>alert('Product added successfully!');</script>");

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    if ("Delete".equals(request.getParameter("action"))) {
        int productId = Integer.parseInt(request.getParameter("productId"));

        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = getConnection();
            String sql = "DELETE FROM inventoryquantity WHERE ProductID = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, productId);
            pstmt.executeUpdate();
            out.println("<script>alert('Product deleted successfully!');</script>");

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // 儲存訂單資料
    Map<String, List<Map<String, String>>> orders = new HashMap<>();

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        conn = getConnection();
        String sql = "SELECT orderid, date, ProductID, ProductName, quantity, price, Producturl FROM orderitems ORDER BY date";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            String orderID = rs.getString("orderid");
            String orderDate = rs.getString("date");
            String productID = rs.getString("ProductID");
            String productName = rs.getString("ProductName");
            int quantity = rs.getInt("quantity");
            int price = rs.getInt("price");
            String productImage = rs.getString("Producturl");

            // 使用 orderDate 作為 key，將相同日期的訂單分組
            if (!orders.containsKey(orderDate)) {
                orders.put(orderDate, new ArrayList<>());
            }
            Map<String, String> orderDetails = new HashMap<>();
            orderDetails.put("orderID", orderID);
            orderDetails.put("productID", productID);
            orderDetails.put("productName", productName);
            orderDetails.put("quantity", String.valueOf(quantity));
            orderDetails.put("price", String.valueOf(price));
            orderDetails.put("productImage", productImage);
            orders.get(orderDate).add(orderDetails);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }
%>
<!doctype html>
<html lang="en" data-bs-theme="auto">

  <head>
    <script src="../assets/js/color-modes.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.122.0">

    <!-- 網頁標題 -->
    <title> 吃貨道| 吃貨的專屬門道 </title> 

    <!-- 引用 Bootstrap 套件---> 
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/carousel/">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/headers/">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/masonry/">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/footers/">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/navbars/">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link href="./assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- 使用font-awesome線上免下載圖標(icon) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- 登入欄位引用線上資源 -->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> <!-- header -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> <!-- header -->
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

    <!-- 引用 思源黑體字形 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100..900&display=swap" rel="stylesheet">

    <!-- 基本 css 樣式檔案 -->
    <link href="./stylesheets/index.css" rel="stylesheet">

    <!-- 登入註冊樣式檔  -->
    <link rel="stylesheet" href="./stylesheets/LoginArea.css"> 

    <!-- 購物車樣式檔 -->
    <link rel="stylesheet" href="./stylesheets/BuyCart.css">

     <!-- 會員介面樣式檔 -->
    <link rel="stylesheet" href="./stylesheets/manager.css">
    <style>
        .r-table input[type='number'] {
          width: 80px; /* 设置宽度 */
          height: 25px; /* 设置高度 */
        }
    </style>
  </head>

  <body>
    <!-- 上方欄位 (工具欄)
    ================================================== -->

      <!-- 共具欄第一欄 -->
      <nav class="navbar navbar-expand-lg"> 

        <!-- 工具欄第一欄內容物容器 -->
        <div class="row navOneRow">

          <!-- 【圖標logo】-->
          <div class="col-sm navLogoCol" >
            <div class="navLogo" >
              <!-- Logo 點擊回到登入後主頁 -->
              <a href="./index_LoggedIn.jsp">
              <img src="./picture/material/navPic/navLogo.png" alt="navLogoPic">
              </a>
            </div>
          </div>
          
          <!-- 搜尋欄 -->
            <div class="col-sm searchBarCol">
              <form class="d-flex" action="./SearchProduct_LoggedIn.jsp" method="get" style="width:750px;">
                <input id="searchBar" class="form-control me-2 searchBar" name="keyword" type="search" placeholder="🔍 搜尋" aria-label="Search">
            
                <script>
                    // 在輸入框獲得焦點時，添加特定的樣式
                    document.getElementById("searchBar").addEventListener("focus", function() {
                        this.classList.add("focused");
                    });
            
                    // 在輸入框失去焦點時，移除特定的樣式
                    document.getElementById("searchBar").addEventListener("blur", function() {
                        this.classList.remove("focused");
                    });
                </script>
            </form>
            </div>

          <!-- 右側兩個按鈕欄位 -->
          <div class="col-sm BuyCart_and_Account" style="padding-left: 20px;">

            <!-- 【會員註冊登入】 -->
            
            <%


            // 設置資料庫連接相關變數
            conn = null;
            pstmt = null;
            rs = null;

            String managerName = ""; // 初始化管理員名稱

            try {
                // 連接到 MySQL 資料庫
                String url = "jdbc:mysql://localhost:3306/FinalProject?serverTimezone=UTC";
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, "root", "Ray_930715");

                // 獲取管理員資料
                String sql = "SELECT managerName FROM seller WHERE email = ?";

                // 使用 PreparedStatement 防止 SQL 注入
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, email);

                // 執行查詢操作
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    managerName = rs.getString("managerName"); // 獲取管理員名稱
                }

            } catch (SQLException | ClassNotFoundException sExec) {
                out.println("SQL 錯誤: " + sExec.toString());
            } finally {
                // 關閉資料庫連接
                if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }

            if (email == null || email.isEmpty()) {
              out.println("<script>");
              out.println("alert('登入錯誤');"); // 顯示錯誤訊息
              out.println("window.location.href = 'index.jsp';"); // 跳轉到 index.jsp
              out.println("</script>");
            }
            %>

            <!-- 登入按鈕 -->
            <button type="button" class="btn btn-light" style="width: auto;height:auto;font-weight: bold;margin-left:10px;">
                <i class="fa fa-user" aria-hidden="true" style="font-size: 22px;margin-right: 5px;"></i>
                <%= managerName != null ? managerName : "您尚未登入" %> 管理員您好！
            </button>

            <!-- 登出按鈕 -->
            <button onclick="location.href='./logout.jsp'" type="button" class="btn btn-danger" style="width: auto;height:auto;font-weight: bold;margin-left:10px;">
                <i class="fa fa-sign-out" aria-hidden="true" style="font-size: 16px;margin-right: 5px;"></i>
                登出
            </button>

          </div>

        </div>

        
      </nav>

      <!-- 工具欄第二欄 -->
      <nav class="navbar navbar-expand-lg navbar-black bg-black" aria-label="Tenth navbar example"> 

        <div class="container-fluid" style="background-color: #f7f7f7">
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
          
          <!-- 下拉式選單 -->
          <div class="collapse navbar-collapse justify-content-md-center navCol-2" id="navbarsExample08"> 

            <!-- 【商品瀏覽】 -->
            <li class="nav-item dropdown">
              <a class="nav-link " href="#" data-bs-toggle="dropdown" aria-expanded="false" style="padding: 20px;color: #6e573a;font-weight: 1000;font-size: 18px;">商品瀏覽</a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="./AllProduct_LoggedIn.jsp">所有商品</a></li>
                <li><a class="dropdown-item" href="./AllProduct_LoggedIn.jsp#noodle">泡麵</a></li>
                <li><a class="dropdown-item" href="./AllProduct_LoggedIn.jsp#drinks">飲料</a></li>
                <li><a class="dropdown-item" href="./AllProduct_LoggedIn.jsp#snacks">零食糖果</a></li>
              </ul>
            </li>

            <li class="nav-item dropdown">
              <a class="nav-link " href="#" data-bs-toggle="dropdown" aria-expanded="flase" style="padding: 20px;color: #6e573a;font-weight: 1000;font-size: 18px;">關於我們</a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="./aboutus_LoggedIn.jsp#brandConcept">品牌理念</a></li>
                <li><a class="dropdown-item" href="./aboutus_LoggedIn.jsp#MemberIntro">成員介紹</a></li>
              </ul>
            </li>


            <!-- 【聯絡我們】 -->
            <li class="nav-item dropdown">
              <a class="nav-link" href="#FooterArea"  aria-expanded="false" style="padding: 20px;color: #6e573a;font-weight: 1000;font-size: 18px;">聯絡我們</a>
            </li>

          </div>

        </div>
      </nav>

   
      <!-- 訂單管理頁面大容器 OrderInfo_Container -->
    <div class="mt-5 OrderInfo_Container">

        <div class="row">

            <!-- 上方選單容器 -->
            <div class="col-12 CategoryList_Container">
                
                <!-- 上側選單 -->

                <div class="list">
                    <label for="modify" class="btn btn-secondary modify">
                        <span class="title">訂單瀏覽</span>
                    </label>
                    <label for="record" class="btn btn-secondary record">
                        <span class="title">商品管理</span>
                    </label>
                </div>

            </div>

            <!-- 下方訂單資料與商品管理顯示區容器 OrderAndProduct_Container -->
            <div class="col-12 OrderAndProduct_Container">

                <!-- 個人資料與訂單資料顯示區-->
                <div class="container2">

                    <!-- 單獨的訂單管理區域 -->
                    <div class="content">

                        <!-- 訂單管理與商品管理之radio選單 -->
                        <input type="radio"  name="slider" id="modify" autocomplete="off" checked>
                        <input type="radio"  name="slider"  id="record" autocomplete="off" >

                        <!-- 字區域 -->
                        <div class="text-content">

                          <div class="modify text" style="background: none;">
                          <% for (String orderDate : orders.keySet()) { %>
                              <div class="order-container">
                                  <div class="order-header">
                                      <label>訂購日期: <%= orderDate %></label>
                                  </div>
                                  <table class="order-table">
                                      <thead>
                                          <tr>
                                              <th>商品</th>
                                              <th>數量</th>
                                              <th>金額</th>
                                          </tr>
                                      </thead>
                                      <tbody>
                                          <% int totalPrice = 0;
                                            for (Map<String, String> order : orders.get(orderDate)) {
                                                int price = Integer.parseInt(order.get("price"));
                                                int quantity = Integer.parseInt(order.get("quantity"));
                                                totalPrice += price * quantity;
                                          %>
                                          <tr>
                                              <td><img src="<%= order.get("productImage") %>" alt="<%= order.get("productName") %>" width="50"><%= order.get("productName") %></td>
                                              <td>x <%= order.get("quantity") %></td>
                                              <td>$<%= price %></td>
                                          </tr>
                                          <% } %>
                                      </tbody>
                                  </table>
                                  <div class="order-footer">
                                      總金額: $<%= totalPrice %>
                                  </div>
                              </div>
                          <% } %>
                          </div>

                            
                            <div class="record text" style="color: #6e573a;">
                              <!-- 添加商品编辑代码 -->
                              <%
                                  Connection con = null;
                                  con = null;
                                  PreparedStatement inventoryStmt = null;
                                  ResultSet inventoryRs = null;

                                  try {
                                      con = getConnection();
                                      String sql = "SELECT * FROM `inventoryquantity`";
                                      inventoryStmt = con.prepareStatement(sql);
                                      inventoryRs = inventoryStmt.executeQuery();

                                      out.println("<table class='r-table' style='margin: 20px auto; color:#907859;'><tr><th>商品編號</th><th>商品名稱</th><th>價格</th><th>庫存</th><th>操作</th></tr>");
                                      while (inventoryRs.next()) {
                                          int productId = inventoryRs.getInt("ProductID");
                                          String productName = inventoryRs.getString("ProductName");
                                          int price = inventoryRs.getInt("Price");
                                          int quantity = inventoryRs.getInt("Quantity");
                                          out.println("<tr><form action='manager.jsp' method='post'>");
                                          out.println("<td>" + productId + "</td>");
                                          out.println("<td style='width: 330px;'><span>" + productName + "</span></td>");
                                          out.println("<td><input type='number' name='price' value='" + price + "'></td>");
                                          out.println("<td><input type='number' name='quantity' value='" + quantity + "'></td>");
                                          out.println("<td class='dis'><input type='hidden' name='productId' value='" + productId + "'>");
                                          out.println("<button type='submit' name='action' value='Update' style='background-color: #907859; color: white; border: none; padding: 3px; cursor: pointer;margin-bottom: 2px; border-radius: 15%; '>更新</button>");
                                          out.println("<button type='submit' name='action' value='Delete' style='background-color: #d9534f; color: white; border: none; padding: 3px; cursor: pointer; margin-bottom: 2px; border-radius: 15%;'>刪除</button>");
                                          out.println("</form></tr>");
                                      }
                                      out.println("</table>");
                                  } catch (SQLException | ClassNotFoundException e) {
                                      e.printStackTrace();
                                  } finally {
                                      try {
                                          if (inventoryRs != null) inventoryRs.close();
                                          if (inventoryStmt != null) inventoryStmt.close();
                                          if (con != null) con.close();
                                      } catch (SQLException e) {
                                          e.printStackTrace();
                                      }
                                  }
                              %>

                              <!-- 添加商品 -->
                              <form action="manager.jsp" method="post" style="margin: 20px;">
                                  <input type="hidden" name="action" value="Add">
                                  <div>
                                      <label for="productName">商品名稱:</label>
                                      <input type="text" name="productName" required>
                                  </div>
                                  <div>
                                      <label for="price">價格:</label>
                                      <input type="number" name="price" required>
                                  </div>
                                  <div>
                                      <label for="quantity">庫存:</label>
                                      <input type="number" name="quantity" required>
                                  </div>
                                  <div>
                                      <button type="submit" style="background-color: #5cb85c; color: white; border: none; padding: 5px; cursor: pointer; margin-top: 10px; border-radius: 5%;">新增商品</button>
                                  </div>
                              </form>

                            </div>

                        </div>

                        
                    </div>
                </div>
                
            </div>
        </div>
    </div>

    <!-- 回到頂部按鈕 -->
    <div class="slider">
      <a href="#">
        <div class="top">
            <iconify-icon icon="iconoir:page-up"></iconify-icon>
        </div>
      </a>
    </div>
      

    <!-- 頁尾(含聯絡資訊) 
    ================================================== -->
    <jsp:include page="./footer.jsp" />

    
    <!-- Javascript 區域 -->
    <script src="./assets/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.iconify.design/iconify-icon/2.1.0/iconify-icon.min.js"></script>
    <script src="../Page/javascript/slider.js"></script>
    <script async src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous"></script></body>

  </body>
  
</html>
