<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>


<%
      // 初始化購物車
      if (session.getAttribute("cart") == null) {
        session.setAttribute("cart", new HashMap<String, Integer>());
      }
      Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
        
        //處理購物車操作
        String action = request.getParameter("action");
        String product = request.getParameter("product");
        if ("add".equals(action)) {
            cart.put(product, cart.getOrDefault(product, 0) + 1);
        } else if ("remove".equals(action)) {
            if (cart.containsKey(product)) {
                int quantity = cart.get(product) - 1;
                if (quantity > 0) {
                    cart.put(product, quantity);
                } else {
                    cart.remove(product);
                }
            }
        } else if ("delete".equals(action)) {
            cart.remove(product);
        }
%>



<!doctype html>

<html lang="en" data-bs-theme="auto">

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
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

    <!-- 引用 思源黑體字形 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100..900&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>


    <!-- css 樣式檔案 -->
    <link href="./stylesheets/product.css" rel="stylesheet">
    
    <!-- 購物車樣式檔 -->
    <link rel="stylesheet" href="./stylesheets/BuyCart.css">

    <!-- 登入註冊樣式檔  -->
    <link rel="stylesheet" href="./stylesheets/LoginArea.css"> 

  </head>

  <body>

    <!-- 上方欄位 (工具欄)
    ================================================== -->

    <!-- 先為code寫上註解 不要急著修改-->

      <!-- 共具欄第一欄 -->
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

                      <!-- 購物車表單 -->
                      <form action="">

                          <!-- 購物車商品之單頁 商品01 -->
                          <div class="cart-p">
                              <img src="./picture/material/productPic/snacks/snacks_2.PNG">
                              <div>

                                  <div class="cp1">   <!--商品名稱-->
                                      <h1>GEMEZ Enaak 韓式小雞麵 雞汁味</h1>
                                      <p>一盒裝 24入</p>
                                  </div>

                                  <div class="cp2" data-min="1" data-max="50"> <!-- 數量增減 min最小購買數量、max最大購買數量 -->
                                    <input class="min" type="button" value="&minus;"/> <!-- ' &minus; '是減號 -->
                                    <input class="quantity" type="text" value="1"/>
                                    <input class="add" type="button" value="+"/> 
                                  </div>
                            
                              </div>

                              <div class="cp3">   <!-- 商品價格 -->
                                  <p>$239</p>
                              </div>

                              <button>&times;</button>    <!-- 刪除商品按鈕 '&times;'是叉叉符號 -->

                          </div>

                          <!-- 購物車商品之單頁 商品02 -->
                          <div class="cart-p">

                              <img src="./picture/material/productPic/drinks/banana.jpg">
                              <div>
                                  <div class="cp1">   <!--商品名稱-->
                                      <h1>【韓味不二】香蕉牛奶</h1>
                                      <p>一瓶(200ml)</p>
                                  </div>
                                  <div class="cp2" data-min="1" data-max="50"> <!-- 數量增減 min最小購買數量、max最大購買數量 -->
                                    <input class="min" type="button" value="&minus;"/> <!-- ' &minus; '是減號 -->
                                    <input class="quantity" type="text" value="1"/>
                                    <input class="add" type="button" value="+"/> 
                                </div>                            
                              </div>

                              <div class="cp3">   <!-- 商品價格 -->
                                  <p>$25</p>
                              </div>

                              <button>&times;</button>    <!-- 刪除商品按鈕 '&times;'是叉叉符號 -->

                          </div>

                          <!-- 購物車商品之單頁 商品03 -->
                          <div class="cart-p">

                            <img src="./picture/material/productPic/drinks/banana.jpg">
                            <div>
                                <div class="cp1">   <!--商品名稱-->
                                    <h1>【韓味不二】香蕉牛奶</h1>
                                    <p>一瓶(200ml)</p>
                                </div>
                                <div class="cp2" data-min="1" data-max="50"> <!-- 數量增減 min最小購買數量、max最大購買數量 -->
                                  <input class="min" type="button" value="&minus;"/> <!-- ' &minus; '是減號 -->
                                  <input class="quantity" type="text" value="1"/>
                                  <input class="add" type="button" value="+"/> 
                              </div>
                            </div>

                            <div class="cp3">   <!-- 商品價格 -->
                                <p>$25</p>
                            </div>

                            <button>&times;</button>    <!-- 刪除商品按鈕 '&times;'是叉叉符號 -->

                        </div>

                        <!-- 購買數量增減控制 -->
                        <script>
                          document.addEventListener("DOMContentLoaded", function() {
                              document.body.addEventListener('click', function(event) {
                                  if (event.target.classList.contains('min') || event.target.classList.contains('add')) {
                                      const cp2 = event.target.closest('.cp2');
                                      const quantityInput = cp2.querySelector('.quantity');
                                      let currentValue = parseInt(quantityInput.value);
                      
                                      const min = parseInt(cp2.getAttribute('data-min'));
                                      const max = parseInt(cp2.getAttribute('data-max'));
                      
                                      if (event.target.classList.contains('min') && currentValue > min) {
                                          quantityInput.value = currentValue - 1;
                                      }
                      
                                      if (event.target.classList.contains('add') && currentValue < max) {
                                          quantityInput.value = currentValue + 1;
                                      }
                                  }
                              });
                      
                              // 避免非數值資料輸入進數量欄位
                              document.querySelectorAll('.quantity').forEach(input => {
                                  input.addEventListener('input', function() {
                                      let value = this.value.replace(/[^0-9]/g, '');
                                      const cp2 = this.closest('.cp2');
                                      const max = parseInt(cp2.getAttribute('data-max'));

                                      // 數量欄位限制購買數量，當輸入超過最大數量，則予以提醒。
                                      if (value > max) {
                                          alert(`最多只能購買 ${max} 個`);
                                          this.value = '';
                                      } else {
                                          this.value = value;
                                      }
                                  });
                              });
                          });
                      </script>

                        
                          
                        <!-- 計算總價 -->
                        <div class="cart-total">
                            <p>總金額<p>
                            <p class="r">$289</p>
                        </div>

                        <!-- 購物車最後按鈕 (繼續購物/結帳去)-->
                        <div class="cart-but row" >

                            <div class="col">
                              <!-- 繼續購物時，就關閉當前購物車視窗 -->
                              <input type="button" value="繼續購物" class="Continu_OR_Checkout_Btn" onclick="closeNav()">
                            </div>
                            <div class="col">
                              <input type="button" value="買單去" class="Continu_OR_Checkout_Btn" onclick="location.href='./payment.jsp'">
                            </div>

                        </div>

                      </form>

                  </div>

              </div>

            </div>

            <!-- 【會員註冊登入】 -->
            <%
                // 獲取當前用戶的電子郵件
                String email = (String) session.getAttribute("userEmail");
            
                // 設置資料庫連接相關變數
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
            
                String userName = "";
            
                try {
                    // 連接到 MySQL 資料庫
                    String url = "jdbc:mysql://localhost:3306/FinalProject?serverTimezone=UTC";
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, "root", "Ray_930715");
            
                    // 獲取用戶資料
                    String sql = "SELECT MemberName FROM membership WHERE MemberAccount = ?";
                    
                    // 使用 PreparedStatement 防止 SQL 注入
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, email);
            
                    // 執行查詢操作
                    rs = pstmt.executeQuery();
            
                    if (rs.next()) {
                        userName = rs.getString("MemberName");
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
   

      <!-- 商品購買與介紹區域
      ================================================== -->

      <!-- 商品內容之大容器-->
      <section class="desc-page">
        
      <%
      
      // 從URL獲取productId
      String productId = request.getParameter("productId");
      String userid = (String) session.getAttribute("userid");
      String productId = "someProductId"; // This should be dynamically set based on your application logic
      
      if (productId == null || productId.isEmpty()) {
          out.println("產品ID無效");
          return;
      }
      if (userid == null) {
        // Handle the case when userid is not set
        userid = "defaultUserId"; // Or redirect to login page or show an error
      }
      try {
          // 加載JDBC驅動
          Class.forName("com.mysql.cj.jdbc.Driver");
          String url = "jdbc:mysql://localhost:3306/FinalProject?serverTimezone=UTC";
          String dbUsername = "root";
          String dbPassword = "Ray_930715";
  
          // 建立連接
          conn = DriverManager.getConnection(url, dbUsername, dbPassword);
  
          if (conn.isClosed()) {
              out.println("連線建立失敗");
          } else {
              // 創建聲明
              String sql = "SELECT * FROM inventoryquantity WHERE ProductID=?";
              pstmt = conn.prepareStatement(sql);
              pstmt.setString(1, productId);
              rs = pstmt.executeQuery();
  
              if (rs.next()) {
                  String productName = rs.getString("ProductName");
                  int productPrice = rs.getInt("Price");
                  int productQuantity = rs.getInt("Quantity");
                  String productExp = rs.getString("exp");
                  String productIngredientList = rs.getString("LngredientList");
                  String productAllergyList = rs.getString("AllergyList");
                  String productDetails = rs.getString("ProductDetails");
                  String productUrl = rs.getString("Producturl");
         %>

        <!-- 網頁當前路徑顯示 -->
        <div class="product-path">
          <a href="./index_LoggedIn.jsp" class="path-link">首頁</a> &gt;
          <a href="./AllProduct_LoggedIn.jsp" class="path-link">商品</a> &gt;
          <a href="./product_LoggedIn.jsp?productId= <%= productId %>"  class="path-link"><%= productName %></a>
        </div>

        <!-- 商品基本內容顯示容器(標題、圖片、價格、數量、計數器、購買按鈕)-->
        <div id="product1" class="display">

          <!-- 商品圖片 -->
          <div class="cont-img">
            <img src="<%= productUrl %>" alt="<%= productName %>">
          </div>

          <!-- 商品之標題、價格、數量、計數器、購買按鈕顯示容器 -->
          <div class="cont">

              <!-- 商品標題 -->
              <div class="cont-name">
                <h5><%= productName %></h5>
                <h6>NT$<%= productPrice %></h6>
                <!-- 可自行更動數量設定 -->
                <p>庫存數量：<%= productQuantity %></p>
                <p>到期日：<%= productExp %></p>
              </div>

              <form method='post' action='./tocart.jsp' class='product'>
              <!-- 商品數量增減按鈕 -->
              <div class="quantityButton" data-min="1" data-max="30">   <!-- 數量增減 data-min最低數量;data-max 最多數量 -->
                <input type="button" value="&minus;" class="min"/> <!-- ' &minus; '是減號 -->
                <input  type="text" name="quantity" value="1" class="quantity"/>
                <input  type="button" value="+" class="add"/>
              </div>
              <!-- Hidden input for productId -->
              <input type="hidden" name="productId" value="<%= productId %>"/>
              <!-- Hidden input for MemberID -->
              <input type="hidden" name="MemberID" value="<%= userid %>"/>

              <!-- 商品購買按鈕容器 -->
              <div class="addToCart">

                <button type="submit" class="btn" onclick="showAlert()">
                  加入購物車
                </button>

                <button type="submit" class="btn" onclick=""> <!-- 導引至結帳區 -->
                  立即購買
                </button>

              </div>
              </form> 

              <!-- 購買數量增減控制 -->
              <script>
                document.addEventListener("DOMContentLoaded", function() {
                    document.body.addEventListener('click', function(event) {
                        if (event.target.classList.contains('min') || event.target.classList.contains('add')) {
                            const quantityButton = event.target.closest('.quantityButton');
                            const quantityInput = quantityButton.querySelector('.quantity');
                            let currentValue = parseInt(quantityInput.value);
                            
                            const min = parseInt(quantityButton.getAttribute('data-min'));
                            const max = parseInt(quantityButton.getAttribute('data-max'));

                            if (event.target.classList.contains('min') && currentValue > min) {
                                quantityInput.value = currentValue - 1;
                            }

                            if (event.target.classList.contains('add') && currentValue < max) {
                                quantityInput.value = currentValue + 1;
                            }
                        }
                    });

                    // 避免非數值資料輸入進數量欄位
                    document.querySelectorAll('.quantity').forEach(input => {
                        input.addEventListener('input', function() {
                            let value = this.value.replace(/[^0-9]/g, '');
                            const quantityButton = this.closest('.quantityButton');
                            const max = parseInt(quantityButton.getAttribute('data-max'));

                            // 數量欄位限制購買數量，當輸入超過最大數量，則予以提醒。
                            if (value > max) {
                                alert(`最多只能購買 ${max} 個`);
                                this.value = max;
                            } else {
                                this.value = value;
                            }
                        });
                    });
                });
              </script>

          </div>
        
        </div>

        <div class="separator"></div> <!-- 分隔線 -->
        
        <!-- 商品介紹
         ------------------------->

        <div class="introduction">

          <!-- 商品介紹 -->
          <h4> &#92;商品介紹&sol;</h4>

          <p><%= productDetails %></p>

          <br>

          <!-- 成分内容 -->
          <h4> &#92;成分内容&sol;</h4>
          <p><%= productIngredientList %></p>

          <br>

          <!-- 過敏原資訊 -->
          <h4> &#92;過敏原資訊&sol;</h4>
          <p><%= productAllergyList %></p>
          <br>

          </div>

        </div>
        <%
          } else {
              out.println("找不到該產品的詳細資訊");
          }
              }
          } catch (Exception e) {
              e.printStackTrace();
          } finally {
              if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
              if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
              if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
          }
      %>
      </section>


      <div class="separator"></div> <!-- 分隔線 -->

      <!-- 商品留言評價區域
      ================================================== -->

      <section class="comment">

        <!-- 左方填寫評論區域 -->
        <div class="leftside">

          <h5>留言評價</h5>

          <form action="#" method="post">

            <label for="fname" style="font-size: 20px;">姓名:</label><br>


            <p>留言</p>
            <textarea name="message" rows="10" cols="30" style="height: 200px;resize: none; "></textarea>
            <br><br>

            <!-- 星星評分部分 -->
            <div class="star" id="star-rating">

              <iconify-icon icon="ic:baseline-star" width="40" data-index="1" class="star-icon"></iconify-icon>
              <iconify-icon icon="ic:baseline-star" width="40" data-index="2" class="star-icon"></iconify-icon>
              <iconify-icon icon="ic:baseline-star" width="40" data-index="3" class="star-icon"></iconify-icon>
              <iconify-icon icon="ic:baseline-star" width="40" data-index="4" class="star-icon"></iconify-icon>
              <iconify-icon icon="ic:baseline-star" width="40" data-index="5" class="star-icon"></iconify-icon>
              
            </div>

            <input type="submit" value="送出">

          </form>

        </div>
        
        <!-- 星星js程式部分 -->
        <script>
          document.addEventListener("DOMContentLoaded", function() {
            const starRatings = document.querySelectorAll(".star");
        
              starRatings.forEach((starRating) => {
                const starIcons = starRating.querySelectorAll(".star-icon");
        
                  starIcons.forEach((starIcon) => {
                      starIcon.addEventListener("click", function() {
                        const clickedIndex = parseInt(this.getAttribute("data-index"));
        
                          starIcons.forEach((icon, index) => {
                              if (index < clickedIndex) {
                                  icon.setAttribute("icon", "ic:baseline-star");
                                  icon.classList.add("selected");
                              } else {
                                  icon.setAttribute("icon", "ic:baseline-star");
                                  icon.classList.remove("selected");
                              }
                          });
        
                        console.log("Selected Rating: " + clickedIndex);
                      });
                  });
              });
          });
        </script>
        
        <!-- 右方顯示評論區域 -->
        <div class="rightside">
          <%
          String url = "jdbc:mysql://localhost:3306/transactionthing"; 

          try {
              Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
              conn = DriverManager.getConnection(url, root, Ray_930715);

              String userName = request.getParameter("userName");
              String userOpinion = request.getParameter("userOpinion");
              String ratingStr = request.getParameter("rating");
              int rating = 0;

              if (userName != null && !userName.trim().isEmpty() && userOpinion != null && !userOpinion.trim().isEmpty()) {
                  try {
                      rating = Integer.parseInt(ratingStr);
                      String insertSql = "INSERT INTO comment (star, comment, MemberAccount) VALUES (?, ?, ?)";
                      try (PreparedStatement pstmt = conn.prepareStatement(insertSql, Statement.RETURN_GENERATED_KEYS)) {
                          pstmt.setInt(1, rating);
                          pstmt.setString(2, userOpinion.trim());
                          pstmt.setString(3, userName.trim());
                          pstmt.executeUpdate();
                      }
                  } catch (NumberFormatException e) {
                      out.println("請輸入星號並重新送出");
                  }
              }

              // Display all reviews
              String query = "SELECT * FROM comment";
              stmt = conn.createStatement();
              rs = stmt.executeQuery(query);
              while (rs.next()) {
                  int dbRating = rs.getInt("star");
                  String dbUserOpinion = rs.getString("comment");
                  String dbUserName = rs.getString("MemberAccount");
        %>

          <h5>評論</h5>

          <!-- 評論顯示盒 - 大容器 -->
          <div class="comment-box">

            <!-- 評論顯示盒 小容器 -->
            <div class="box-top">

              <!-- 用戶圖標 -->
              <iconify-icon icon="mingcute:user-4-fill" width="55" style="font-size: 36px;"></iconify-icon>

              <h6><%= dbUserName %></h6>

              <!-- 顯示評論之星星顯示區 -->
              <div class="starcomment" id="star-comment">

                <% for (int i = 0; i < dbRating; i++) { %>
                  <iconify-icon icon="ic:baseline-star" width="25" data-index="<%= i + 1 %>" class="stars" style="font-size: 15px; color: gold;"></iconify-icon>
                <% } %>
              
              </div>

              <p>
                <%= dbUserOpinion %>
              </p>

            </div>

          </div>
          <%
                }
            } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
                out.println("An error occurred: " + ex.getMessage());
                ex.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>
        </div>
          
      </section>
      
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
    <script>
      function showAlert() {
        alert("✅ 已加入購物車！");
      }
    </script>


    <!-- Javascript 區域 -->
    <!-- <script src="./assets/dist/js/bootstrap.bundle.min.js"></script> -->
    <!-- 我先註解，我發現加上這個好像會使得下拉式選單無法正常開啟 -->
    <script src="https://code.iconify.design/iconify-icon/2.1.0/iconify-icon.min.js"></script>
    <script async src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous"></script>

</body>

</html>