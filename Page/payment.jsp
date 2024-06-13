<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.text.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
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
%>

<!doctype html>
<html lang="en" data-bs-theme="auto">

  <!-- 此為登入後的介面 -->

  <head>
    <script src="./assets/js/color-modes.js"></script>
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

    <!-- 本html樣式檔 -->
    <link href="./stylesheets/payment.css" rel="stylesheet">

    <!-- 登入註冊樣式檔  -->
    <link rel="stylesheet" href="./stylesheets/LoginArea.css"> 

    <!-- 購物車樣式檔 -->
    <link rel="stylesheet" href="./stylesheets/BuyCart.css">

  </head>

  <body>

    <!-- 上方欄位 (工具欄)
    ================================================== -->

      <!-- 工具欄第一欄 -->
      <nav class="navbar navbar-expand-lg"> 

        <!-- 工具欄第一欄內容物容器 -->
        <div class="row navOneRow">

          <!-- 【圖標logo】-->
          <div class="col-sm navLogoCol">
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
            
            <!-- 【購物車】 -->
            <div id="cart">

                <!-- 購物車按鈕 --> 
                  <button onclick="openNav()".style.display='block' type="button" class="btn btn-light" style="width: auto;height:auto;">
                      <i class="fa fa-shopping-cart" aria-hidden="true" style="font-size: 22px;"></i>
                  </button>
            
                <!-- 旁邊顯示之購物車界面 -->
                <div id="mySidebar" class="sidebar">
  
                  <!-- 購物車頁面右邊之大叉叉-->
                  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  
                  <div class="sidebarinner">
  
                    
  
                        <div class="container">
  
                            <%
                            String memberId = String.valueOf(session.getAttribute("MemberID"));
                            if (memberId == null) {
                                out.println("<p>請先登入以查看購物車。</p>");
                                return;
                            }
  
                            int totalQuantity = 0; // 總數量
                            int totalPrice = 0; // 總價格
  
                            Connection ProductConn = null;
                            PreparedStatement ProductPstmt = null;
                            ResultSet ProductRs = null;
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                ProductConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/FinalProject", "root", "Ray_930715");
  
                                String sql = "SELECT c.cartID, c.productID, c.quantity, i.ProductName, i.Price, i.Producturl FROM cart c JOIN inventoryquantity i ON c.productID = i.ProductID WHERE c.MemberID = ?";
                                ProductPstmt = ProductConn.prepareStatement(sql);
                                ProductPstmt.setInt(1, Integer.parseInt(memberId));
                                ProductRs = ProductPstmt.executeQuery();
  
                                if (!ProductRs.isBeforeFirst()) {
                                    out.println("<p>您的購物車是空的</p>");
                                } else {
                                    while (ProductRs.next()) {
                                        int cartID = ProductRs.getInt("cartID"); // Ensure cartID is retrieved
                                        String pid = ProductRs.getString("productID");
                                        int quantity = ProductRs.getInt("quantity");
                                        String productName = ProductRs.getString("ProductName");
                                        int price = ProductRs.getInt("Price");
                                        String imageUrl = ProductRs.getString("Producturl");
  
                                        totalQuantity += quantity;
                                        totalPrice += price * quantity;
                            %>
                            
                            <div class="cart-p">
                              <img src="<%= imageUrl %>" alt="<%= productName %>">
                              <div>
                                  <div class="cp1">   <!--商品名稱-->
                                      <h1><%= productName %></h1>
                                  </div>
                                  <!-- 購物車表單 -->
                                  <form action="./changeCartItem.jsp" method="post" class="quantity-form">
                                      <div class="cp2" data-min="1" data-max="50"> <!-- 數量增減 min最小購買數量、max最大購買數量 -->
                                          <input class="min" type="button" value="&minus;" onclick="updateQuantity(this, -1)" /> <!-- ' &minus; '是減號 -->
                                          <input class="quantity" type="text" name="quantity" value="<%= quantity %>" oninput="validateQuantity(this)" />
                                          <input class="add" type="button" value="+" onclick="updateQuantity(this, 1)" /> 
                                      </div>
                                      <input type="hidden" name="cartID" value="<%= cartID %>">
                                      <input type="hidden" name="action" value="update">
                                  </form>
                              </div>
                              <div class="cp3">   <!-- 商品價格 -->
                                  <p>NT$ <%= price %></p>
                              </div>
                              <form action="./changeCartItem.jsp" method="post" style="display:inline;">
                                  <input type="hidden" name="cartID" value="<%= cartID %>">
                                  <input type="hidden" name="action" value="delete">
                                  <button type="submit">&times;</button> <!-- 刪除商品按鈕 '&times;'是叉叉符號 -->
                              </form>
                          </div>
                            <%
                                    }
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            } finally {
                                if (ProductRs != null) try { ProductRs.close(); } catch (SQLException ignore) {}
                                if (ProductPstmt != null) try { ProductPstmt.close(); } catch (SQLException ignore) {}
                                if (ProductConn != null) try { ProductConn.close(); } catch (SQLException ignore) {}
                            }
                            %>
                          <!-- 購買數量增減控制 -->
                          <script>
                            function updateQuantity(button, delta) {
                                const form = button.closest('.quantity-form');
                                const quantityInput = form.querySelector('.quantity');
                                let currentValue = parseInt(quantityInput.value);
                        
                                const min = parseInt(button.closest('.cp2').getAttribute('data-min'));
                                const max = parseInt(button.closest('.cp2').getAttribute('data-max'));
                        
                                if (!isNaN(currentValue)) {
                                    const newValue = currentValue + delta;
                                    if (newValue >= min && newValue <= max) {
                                        quantityInput.value = newValue;
                                        form.submit();
                                    }
                                }
                            }
                        
                            function validateQuantity(input) {
                                const form = input.closest('.quantity-form');
                                let value = input.value.replace(/[^0-9]/g, '');
                                const cp2 = input.closest('.cp2');
                                const max = parseInt(cp2.getAttribute('data-max'));
                        
                                if (value > max) {
                                    alert(`最多只能購買 ${max} 個`);
                                    input.value = max;
                                } else {
                                    input.value = value;
                                }
                        
                                form.submit();
                            }
                        </script>
                        
  
                          <!-- 計算總價 -->
                          <div class="cart-total">
                            <p>總金額<p>
                            <p class="r">NT$ <%= totalPrice %></p>
                          </div>
  
                          <!-- 購物車最後按鈕 (繼續購物/結帳去)-->
                          <div class="cart-but row" >
                            <div class="col">
                                <input type="button" value="繼續購物" class="Continu_OR_Checkout_Btn" onclick="closeNav()">
                            </div>
                            <div class="col">
                                <input type="button" value="買單去" class="Continu_OR_Checkout_Btn" onclick="location.href='./payment.jsp'">
                            </div>
                        </div>
                        </div>
                  </div>
                </div>

            <!-- 【會員註冊登入】 -->
            <%

            
                // 設置資料庫連接相關變數
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
            
                String userName = "";
                String userPhone = "";
                String userBirthday = "";
                String userAddress = "";
            
                try {
                    // 連接到 MySQL 資料庫
                    String url = "jdbc:mysql://localhost:3306/FinalProject?serverTimezone=UTC";
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, "root", "Ray_930715");
            
                    // 獲取用戶資料
                    String sql = "SELECT MemberName, MemberPhone, BirthdayDate, Address FROM membership WHERE MemberAccount = ?";
                    
                    // 使用 PreparedStatement 防止 SQL 注入
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, email);
            
                    // 執行查詢操作
                    rs = pstmt.executeQuery();
            
                    if (rs.next()) {
                        userName = rs.getString("MemberName");
                        userPhone = rs.getString("MemberPhone");
                        userBirthday = rs.getString("BirthdayDate");
                        userAddress = rs.getString("Address");
                    }
            
                    // 關閉資料庫連接
                    conn.close();
                } catch (SQLException sExec) {
                    out.println("SQL 錯誤: " + sExec.toString());
                }
            %>
            <!-- 會員註冊與登入按鈕 -->
            <button onclick="location.href='./memberPage.jsp'" type="button" class="btn btn-light" style="width: auto;height:auto;font-weight: bold;margin-left:10px;">
              <i class="fa fa-user" aria-hidden="true" style="font-size: 22px;margin-right: 5px;"></i>
              <%= userName %> 您好！
            </button>

            <!-- 登出按鈕 -->
            <button onclick="location.href='./index.jsp'" type="button" class="btn btn-danger" style="width: auto;height:auto;font-weight: bold;margin-left:10px;">
              <i class="fa fa-sign-out" aria-hidden="true" style="font-size: 16px;margin-right: 5px;"></i>
              登出
            </button>

            <!-- 購物車所需js檔 -->
            <script src="./javascript/h.js" charset="utf-8"></script>

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
  

            <li class="nav-item dropdown">
              <a class="nav-link" href="#FooterArea"  aria-expanded="false" style="padding: 20px;color: #6e573a;font-weight: 1000;font-size: 18px;">聯絡我們</a>
            </li>

          </div>

        </div>
      </nav>


    <!-- 收件人與寄送資訊
    ================================================== -->

    <section class="paymentArea"> <!-- paymentArea 為兩section之共用大容器 -->

        <!-- 收件人與寄送資訊之容器 -->
        <section class="payment-cont">
            
        <!-- 結帳表單 -->
        <form method="post" action="./order.jsp">

            <!-- 收件人與寄送資訊之標題 -->
            <div class="payment-header">
                <iconify-icon icon="mdi:truck-delivery-outline"></iconify-icon>
                <h5>收件人/寄送資訊</h5>
            </div>

            <!-- 收件人與寄送資訊之容器2 -->
            <div class="payment-info">

                <div id="deliveryForm" class="needs-validation" novalidate>
                    <div class="form-group" style="margin-bottom: 30px;">
                        <label for="name" class="required">收件人姓名 :</label>
                        <input type="text" class="form-control" id="name" placeholder="請輸入本名" required>
                        
                    </div>
                    <div class="form-group" style="margin-bottom: 30px;">
                        <label for="phone" class="required">收件人電話 :</label>
                        <input type="tel" class="form-control" id="phone" placeholder="請輸入電話" required>
                        
                    </div>
                    <div class="form-group" style="margin-bottom: 30px;">
                        <label for="address" class="required">地址 :</label>
                        <input type="text" class="form-control" id="address" placeholder="請輸入地址" required>
                        
                    </div>
                    <div class="form-group">
                        <label for="delivery">寄送方式 :</label>
                        <select id="delivery" class="option-control" required>
                            <option value="" selected disabled>選擇寄送方式</option>
                            <option value="7-11">7-11</option>
                            <option value="全家">全家</option>
                            <option value="萊爾富">萊爾富</option>
                            <option value="OK">OK</option>
                            <option value="宅配">宅配</option>
                        </select>
                        <select id="city" class="option-control" required>
                            <option value="" selected disabled>縣市</option>
                            <option value="台北市">台北市</option>
                            <option value="新北市">新北市</option>
                            <option value="桃園市">桃園市</option>
                            <option value="台中市">台中市</option>
                            <option value="台南市">台南市</option>
                            <option value="高雄市">高雄市</option>
                        </select>
                        <select id="district" class="option-control" required>
                            <option value="" selected disabled>區域</option>
                        </select>
                        <select id="store" required class="option-control">
                            <option value="" selected disabled>門市</option>
                            <option value="還中店">還中店</option>
                            <option value="建國店">建國店</option>
                            <option value="柏德店">柏德店</option>
                            <option value="中北店">中北店</option>
                            <option value="元智店">元智店</option>
                        </select>

                        <!-- 區域選擇設定 -->
                        <script>
                            document.addEventListener("DOMContentLoaded", function() {
                                const citySelect = document.getElementById("city");
                                const districtSelect = document.getElementById("district");

                                const districts = {
                                    "台北市": ["中正區", "大同區", "中山區", "松山區", "大安區"],
                                    "新北市": ["板橋區", "三重區", "中和區", "永和區", "新莊區"],
                                    "桃園市": ["桃園區", "中壢區", "八德區", "平鎮區", "龜山區", "大溪區"],
                                    "台中市": ["豐原區","大里區", "太平區", "東勢區", "沙鹿區", "梧棲區", "清水區", "大甲區", "霧峰區", "烏日區"],
                                    "台南市": ["中西區", "東區", "南區", "北區", "安平區"],
                                    "高雄市": ["新興區", "前金區", "苓雅區", "鹽埕區", "鼓山區"]
                                };

                                citySelect.addEventListener("change", function() {
                                    const selectedCity = citySelect.value;
                                    while (districtSelect.options.length > 1) {
                                        districtSelect.remove(1);
                                    }

                                    if (districts[selectedCity]) {
                                        districts[selectedCity].forEach(function(district) {
                                            const option = document.createElement("option");
                                            option.value = district;
                                            option.text = district;
                                            districtSelect.add(option);
                                        });
                                    }
                                });
                            });
                        </script>

                    </div>

                    
                        <!-- 其他輸入框 -->
                        <fieldset class="fieldset-legend">
                            <legend>訂單備註</legend>
                            <textarea name="remark" rows="10" cols="30" style="height: 160px; width: 550px; resize: none;"></textarea>
                        </fieldset>
                        <!-- 其他輸入框 -->

                </div>
                
            </div>
        </section>
        
    <!-- 付款資訊
    ================================================== -->

    <section class="payment-cont">

        <!-- payment header -->
        <div class="payment-header">
            <iconify-icon icon="mdi:account-payment-outline"></iconify-icon>
            <h5>付款資訊</h5>
        </div>

        <!-- payment information -->
        <div class="payment-info">
            <div id="paymentForm" class="needs-validation" novalidate>
                <div class="form-group">
                    <label for="payment-method">付款方式 :</label>
                    <label><input type="radio" name="payment-method" value="貨到付款"> 貨到付款</label>
                    <label><input type="radio" name="payment-method" value="線上付款" checked> 線上付款</label>
                </div>

                <div class="separator">
                    <span class="separatorText">線上付款請填寫以下資訊</span>
                </div>

                <fieldset class="fieldset-legend" style="margin-top: 50px;">
                    <legend>信用卡資訊</legend>
                    <div class="paymentInfoInputs">
                        <div class="form-group">
                            <label for="credit-card">信用卡號碼</label>
                            <input type="number" class="pay-form form-control" id="credit-card" placeholder="信用卡號碼" required style="margin-top: 10px;">
                        </div>
                        <div class="inline-inputs">
                            <div class="form-group" style="width: 75%;">
                                <label for="expiry-date">到期日<br>安全碼</label>
                                <input type="text" class="pay-form form-control" id="expiry-date" style="width:60%;" placeholder="到期日 （MM/YY）" required>
                            </div>
                            <div class="form-group" style="width: 25%;">
                                <input type="password" class="pay-form form-control" id="securitynum" style="text-align: center;" placeholder="安全碼" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="cardholder-name">持卡人姓名</label>
                            <input type="text" class="pay-form form-control" id="cardholder-name" placeholder="持卡人姓名" required>
                        </div>
                    </div>
                </fieldset>

                <div class="smallnotes">*您的信用卡資訊會被嚴格保護*</div>
            </div>

        </div>

    </section>

    <%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        ProductConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/FinalProject", "root", "Ray_930715");

        if (memberId != null) {
            String sql = "SELECT c.cartID, c.productID, c.quantity, i.ProductName, i.Price, i.Producturl FROM cart c JOIN inventoryquantity i ON c.productID = i.ProductID WHERE c.MemberID = ?";
            ProductPstmt = ProductConn.prepareStatement(sql);
            ProductPstmt.setInt(1, Integer.parseInt(memberId));
            ProductRs = ProductPstmt.executeQuery();

            while (ProductRs.next()) {
                int cartID = ProductRs.getInt("cartID");
                String pid = ProductRs.getString("productID");
                int quantity = ProductRs.getInt("quantity");
                String ProductName = ProductRs.getString("ProductName");
                int price = ProductRs.getInt("Price");
                String Producturl = ProductRs.getString("Producturl");

                totalQuantity += quantity;
                totalPrice += price * quantity;
    %>

        
        <%
        Integer productId = (Integer) session.getAttribute("productId");
        Integer productPrice = (Integer) session.getAttribute("productPrice");
        Integer totalprice = (Integer) session.getAttribute("totalprice");
        String remark = request.getParameter("remark");
        java.util.Date currentDate = new java.util.Date();
        SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedDate = dateFormatter.format(currentDate);
    %>
        <input type="hidden" name="cartID" value="<%= cartID %>">
        <input type="hidden" name="date" value="<%= formattedDate %>">
        <input type="hidden" name="MemberID" value="<%= session.getAttribute("MemberID") %>">
        <input type="hidden" name="productId" value="<%= pid %>">
        <input type="hidden" name="quantity" value="<%= quantity %>">
        <input type="hidden" name="productPrice" value="<%= price %>">
        <input type="hidden" name="totalprice" value="<%= totalPrice %>">
        <input type="hidden" name="remark" value="<%= remark %>">
        <input type="hidden" name="Producturl" value="<%= Producturl %>">
        <input type="hidden" name="ProductName" value="<%= ProductName %>">
        <%
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (ProductRs != null) try { ProductRs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (ProductPstmt != null) try { ProductPstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (ProductConn != null) try { ProductConn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
    %>

    <div class="submitarea">
        <button id="checkoutButton" class="paymentbtn">結帳</button>
        <script>
            document.getElementById("checkoutButton").addEventListener("click", function() {
                document.getElementById("paymentForm").submit();
            });
        </script>
    </div>

    </form>

    <script>

    // 貨到付款與線上付款之信用卡欄位，必填與否設定
    document.addEventListener('DOMContentLoaded', function() {
    const paymentMethodRadios = document.querySelectorAll('input[name="payment-method"]');
    const creditCardInputs = document.querySelectorAll('#credit-card, #expiry-date, #securitynum, #cardholder-name');

    function updateRequiredAttributes() {
        const selectedPaymentMethod = document.querySelector('input[name="payment-method"]:checked').value;
        if (selectedPaymentMethod === '線上付款') {
        creditCardInputs.forEach(input => {
            input.setAttribute('required', 'required');
        });
        } else {
        creditCardInputs.forEach(input => {
            input.removeAttribute('required');
        });
        }
    }

    paymentMethodRadios.forEach(radio => {
        radio.addEventListener('change', updateRequiredAttributes);
    });

    // Initialize the display based on the initial selection
    updateRequiredAttributes();
    });

    // 到期日設置為預設格式(MM/YY)
    document.getElementById('expiry-date').addEventListener('input', function(e) {
    let input = e.target.value;
    if (/[^0-9\/]/.test(input)) {
        e.target.value = input.replace(/[^0-9\/]/g, '');
        return;
    }
    if (input.length === 2 && !input.includes('/')) {
        e.target.value = input + '/';
    } else if (input.length === 3 && input[2] !== '/') {
        e.target.value = input.slice(0, 2) + '/' + input[2];
    }
    if (input.length > 5) {
        e.target.value = input.slice(0, 5);
    }
    });

    /* 處理未填寫偵測事件 */
    (function() {
    'use strict';
    window.addEventListener('load', function() {
        var forms = document.getElementsByClassName('needs-validation');
        Array.prototype.filter.call(forms, function(form) {
        form.addEventListener('submit', function(event) {
            if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
            var invalidFields = form.querySelectorAll(':invalid');
            invalidFields.forEach(function(field) {
                var label = form.querySelector('label[for="' + field.id + '"]');
                if (label) {
                label.classList.add('invalid');
                }
                field.classList.add('is-invalid');
            });
            } else {
            var labels = form.querySelectorAll('label.invalid');
            labels.forEach(function(label) {
                label.classList.remove('invalid');
            });
            var invalidFields = form.querySelectorAll('.is-invalid');
            invalidFields.forEach(function(field) {
                field.classList.remove('is-invalid');
            });
            }
            form.classList.add('was-validated');
        }, false);
        });
    }, false);
    })();

    // Submit form on button click
    document.getElementById('submitButton').addEventListener('click', function(event) {
    const deliveryForm = document.getElementById('deliveryForm');
    const paymentForm = document.getElementById('paymentForm');
    const orderForm = document.querySelector('.order');
    let isValid = true;

    if (!deliveryForm.checkValidity()) {
        deliveryForm.classList.add('was-validated');
        isValid = false;
    }

    if (!paymentForm.checkValidity()) {
        paymentForm.classList.add('was-validated');
        isValid = false;
    }

    /*警示仍有欄位未填妥*/
    if (!isValid) {
        alert("請填寫所有必填欄位");
    } else {
        orderForm.submit();
        alert("✅ 結帳成功");
    }

    // Prevent default form submission
    event.preventDefault();
    });

    </script>

    <style>
        .is-invalid {
            border-color: #dc3545 !important;
        }
        .invalid {
            color: #dc3545 !important;
        }
    </style>

    <!-- 回到頂部按鈕 -->
    <div class="slider">
    <a href="#">
        <div class="top">
            <iconify-icon icon="iconoir:page-up"></iconify-icon>
        </div>
    </a>
    </div>

      <!-- footer頁尾(含聯絡資訊) 
      ================================================== -->
      <jsp:include page="./footer.jsp" />

    <!-- Javascript 區域 -->
    <script src="./assets/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.iconify.design/iconify-icon/2.1.0/iconify-icon.min.js"></script>
    <script async src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous"></script></body>

  </body>
  
</html>
