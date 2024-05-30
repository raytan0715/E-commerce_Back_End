<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.sql.*" %>
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
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

    <!-- 引用 思源黑體字形 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100..900&display=swap" rel="stylesheet">

    <!-- css 樣式檔案 -->
    <link href="./stylesheets/AllProduct.css" rel="stylesheet">

    <!-- 登入註冊樣式檔  -->
    <link rel="stylesheet" href="./stylesheets/LoginArea.css"> 

    <!-- 購物車樣式檔 -->
    <link rel="stylesheet" href="./stylesheets/BuyCart.css">

  </head>

  <body>

    <!-- 上方欄位 (工具欄)
    ================================================== -->

    <!-- 先為code寫上註解 不要急著修改-->

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
                              <input type="button" value="買單去" class="Continu_OR_Checkout_Btn" onclick="location.href='./checkout.html'">
                            </div>

                        </div>

                      </form>

                  </div>

              </div>

            </div>

            <!-- 【會員註冊登入】 -->

            <!-- 會員註冊與登入按鈕 -->
            <button onclick="location.href='./memberPage.html'" type="button" class="btn btn-light" style="width: auto;height:auto;font-weight: bold;margin-left:10px;">
              <i class="fa fa-user" aria-hidden="true" style="font-size: 22px;margin-right: 5px;"></i>
               OOO 您好！
            </button>

            <!-- 登出按鈕 -->
            <button onclick="location.href='./index.html'" type="button" class="btn btn-danger" style="width: auto;height:auto;font-weight: bold;margin-left:10px;">
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
                <li><a class="dropdown-item" href="#">品牌理念</a></li>
                <li><a class="dropdown-item" href="#">成員介紹</a></li>
              </ul>
            </li>

            <li class="nav-item dropdown">
              <a class="nav-link" href="#FooterArea"  aria-expanded="false" style="padding: 20px;color: #6e573a;font-weight: 1000;font-size: 18px;">聯絡我們</a>
            </li>

          </div>

        </div>
      </nav>

   
      <!-- 所有商品 
      ================================================== -->

     <!-- 搜尋產品產生 -->
     <section id="noodle" class="section-p1">
      <h2 class="product-title">搜尋結果</h2>
      <div class="pro-container">
        <%
          String keyword = request.getParameter("keyword");
          if (keyword != null && !keyword.trim().isEmpty()) {
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            boolean hasResults = false;

            try {
              Class.forName("com.mysql.cj.jdbc.Driver");
              String url = "jdbc:mysql://localhost:3306/FinalProject?serverTimezone=UTC";
              String dbUsername = "root";
              String dbPassword = "Ray_930715";
              conn = DriverManager.getConnection(url, dbUsername, dbPassword);

              String sql = "SELECT * FROM inventoryquantity WHERE ProductName LIKE ?";
              pstmt = conn.prepareStatement(sql);
              pstmt.setString(1, "%" + keyword + "%");
              rs = pstmt.executeQuery();

              while (rs.next()) {
                hasResults = true;
                String productId = rs.getString("ProductID");
                String imageUrl = rs.getString("Producturl");
                String productName = rs.getString("ProductName");
                int productPrice = rs.getInt("Price");
        %>
                <!-- 泡麵商品圖卡jsp -->
            <a href="./product.jsp?productId=<%= productId %>">

              <div class="pro">

                <img src="<%= imageUrl %>" alt="<%= productName %>">

                  <div class="pro-name">
                      <h5><%= productName %></h5>
                      <p>NT$<%= productPrice %></p>
                  </div></a>

                  <!-- add cart container -->
                  <div class="cartButtonContainer">

                    <!-- cart-numberic button -->
                    <div class="cart-button" data-min="1" data-max="50">
                      <input type="button" class="min" value="&minus;"/>
                      <input type="text" class="quantity" value="1"/>
                      <input type="button" class="add" value="+"/>
                    </div>

                    <!-- addtocart icon button -->
                    <div class="addToCart_Btn">
                      <button type="button" class="cart-icon-button" onclick="showAlert()">
                        <iconify-icon icon="iconoir:cart"></iconify-icon>
                      </button>
                    </div>

                  </div>
              </div>
              <%
              }

              if (!hasResults) {
        %>
                <h3 style="color: #281805;">查無此資料</h3>
                
        <%
              }
            } catch (Exception e) {
              e.printStackTrace();
            } finally {
              if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
              if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
              if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }
          } 
        %>
      </div>
    </section>

  

  <!-- <div class="separator"></div> 分隔線 -->

        <!-- cart button quantity -->
        <script>
          document.addEventListener("DOMContentLoaded", function() {
          document.body.addEventListener('click', function(event) {
              if (event.target.classList.contains('min') || event.target.classList.contains('add')) {
                  const cartButton = event.target.closest('.cart-button');
                  const quantityInput = cartButton.querySelector('.quantity');
                  let currentValue = parseInt(quantityInput.value);
      
                  const min = parseInt(cartButton.getAttribute('data-min'));
                  const max = parseInt(cartButton.getAttribute('data-max'));
      
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
                  const cartButton = this.closest('.cart-button');
                  const max = parseInt(cartButton.getAttribute('data-max'));
      
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

      </section>

      <!-- slider up -->
      <section class="slider">
          <a href="#">
            <div class="top">
                <iconify-icon icon="iconoir:page-up"></iconify-icon>
            </div>
          </a>
      </section>

      <!-- Footer 頁尾部分 -->
      <jsp:include page="footer.jsp" />

    <!-- Javascript 區域 -->
    <script src="./assets/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.iconify.design/iconify-icon/2.1.0/iconify-icon.min.js"></script>
    <script async src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous"></script>


    <!-- 按下購物車時，因為未登入所以先提示登入，不加入購物車 -->
    <script>
      function showAlert() {
        alert("✅ 已加入購物車！");
      }
    </script>

</body>

  
  
</html>
