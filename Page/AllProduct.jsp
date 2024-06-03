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
    <!-- 引用google reCaptcha驗證機制 -->
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>

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
    
    <script>
      function onSubmit(token) {
          document.getElementById("recaptchaResponse").value = token;
          document.getElementById("loginForm").submit();
      }
      </script>
  

  </head>

  <body>

    <!-- 上方欄位 (工具欄)
    ================================================== -->

    <!-- 先為code寫上註解 不要急著修改-->

      <!-- 共具欄第一欄 -->
      <nav class="navbar navbar-expand-lg"> 

        <!-- 工具欄第一欄內容物容器 -->
        <div class="row navOneRow">

            <!-- 圖標logo-->
            <div class="col-sm navLogoCol" >
              <div class="navLogo" >
                <!-- Logo 點擊回到主頁 -->
                <a href="./index.jsp">
                <img src="./picture/material/navPic/navLogo.png" alt="navLogoPic">
                </a>
              </div>
            </div>
          

          <!-- 搜尋欄 -->
          <div class="col-sm searchBarCol">

            <form class="d-flex" action="./SearchProduct.jsp" method="get" style="width:750px;">
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

            <!-- 購物車按鈕 --> 
            <!-- 未登入前統一先要求登入後再購物 -->
            <button type="button" class="btn btn-light" style="width: auto;height:auto;" onclick="showAlert()">
              <i class="fa fa-shopping-cart" aria-hidden="true" style="font-size: 22px;"></i>
              <script>
                function showAlert() {
                  alert("🔔 購買前請先登入！🔔");
                }
              </script>
            </button>
            
            <!-- 會員註冊登入按鈕 -->
            <button onclick="document.getElementById('id01').style.display='block'" type="button" class="btn btn-light" style="width: auto;height:auto;font-weight: bold;margin-left:10px;">
              <i class="fa fa-pencil-square-o" aria-hidden="true" style="font-size: 22px;"></i>
              會員註冊/登入
            </button>

             <!-- 會員註冊登入頁面 --> 
            <div id="id01" class="modal">

              <div class="container_Login" id="container">

                    <div class="form-container sign-up-container">
                      <!-- 註冊頁面 -->
                      <form method="post" action="./register.jsp">
                          <h1 style="color: #281805;font-weight: 900;padding-bottom: 15px;font-weight: 800;">註冊新會員</h1>
                          <input type="text" name="username" style="color: #66625e;font-weight: 800;background-color: #eaeaea;" placeholder="姓名" required />
                          <input type="number" name="phone" style="color: #66625e;font-weight: 800;background-color: #eaeaea;" placeholder="電話" required />
                          <input type="email" name="email" style="color: #66625e;font-weight: 800;background-color: #eaeaea;" placeholder="電子郵件" required />
                          <input type="password" name="password" style="color: #66625e;font-weight: 800;background-color: #eaeaea;" placeholder="密碼" required />
                          <input type="password" name="confirm_password" style="color: #66625e;font-weight: 800;background-color: #eaeaea;" placeholder="確認密碼" required />
                          <!-- Google reCAPTCHA v2 -->
                          <div class="g-recaptcha" data-sitekey="6LdDk-8pAAAAANkrrIZD2ZGk2O1cFmcHgSVc-2uI" data-callback="enableBtn"></div>
                          <button id="submitBtn1" style="background-color: #a59e94;color: #ffffff;border: 0px;" disabled>註冊</button>
                      </form>
                    </div>
                  
                    <div class="form-container sign-in-container">
                      <!-- 登入頁面 -->
                      <form method="post" action="./login.jsp">
                          <h1 style="color: #281805;font-weight: 900;padding-bottom: 15px;">登入</h1>
                          <input type="email" name="email" style="color: #66625e;font-weight: 800;background-color: #eaeaea;" placeholder="電子郵件" required />
                          <input type="password" name="password" style="color: #66625e;font-weight: 800;background-color: #eaeaea;" placeholder="密碼" required />
                          <!-- Google reCAPTCHA v2 -->
                          <div class="g-recaptcha" data-sitekey="6LdDk-8pAAAAANkrrIZD2ZGk2O1cFmcHgSVc-2uI" data-callback="enableBtn"></div>
                          <button id="submitBtn2" style="background-color: #a59e94;color: #ffffff;border: 0px;" disabled>登入</button>
                      </form>
                  </div>
                  
                  <script>
                    var recaptchaChecked = false;
                    
                    function enableBtn() {
                        recaptchaChecked = true;
                        document.getElementById('submitBtn1').disabled = false;
                        document.getElementById('submitBtn2').disabled = false;
                    }
                    
                    function checkRecaptcha() {
                        if (!recaptchaChecked) {
                            alert('請完成 reCAPTCHA 驗證');
                            return false;
                        }
                        return true;
                    }
                    </script>



                    <!-- 轉換登入與註冊"文字提示" -->
                    <div class="overlay-container">

                        <div class="overlay">
                            <div class="overlay-panel overlay-left">
                                <h1 style="font-weight: 900;">已註冊會員</h1>
                                <p style="font-size: 20px;">馬上登入！</p>
                                <button class="registerLoginBtn" id="signIn">前往登入</button>
                            </div>
                            <div class="overlay-panel overlay-right">
                                <h1 style="font-weight: 900;">還沒成為會員嗎？</h1>
                                <p style="font-size: 20px;">立即註冊加入會員吧！</p>
                                <button class="registerLoginBtn" id="signUp">前往註冊</button>
                            </div>
                        </div>

                    </div>
              </div>
            </div>

            <!-- ========== 會員登入註冊介面之 JS語法 ========== -->
            <!-- 導覽列 -->
            <script src="./javascript/h.js" charset="utf-8"></script>

            <!--滑動頁面-->
            <script>
                let b1 = document.getElementById('b1');
                let btt1 = document.getElementById('btt1');

                window.addEventListener('scroll',function(){
                    let value = window.scrollY;
                    b1.style.top = value *1 + 'px';
                    btt1.style.top = value *0.5 + 'px';
                })
            </script>
            <!--幻燈片-->
            <script>
                var myIndex = 0;
                carousel();

                function carousel() {
                var i;
                var x = document.getElementsByClassName("mySlides");
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";  
                }
                myIndex++;
                if (myIndex > x.length) {myIndex = 1}    
                x[myIndex-1].style.display = "block";  
                setTimeout(carousel, 4000); // Change image every 2 seconds
                }
            </script>
            <!-- 滑動特效 -->
            <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
            <script>
                AOS.init({duration:1000,once:true});
            </script>
            <!-- ==================== -->

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
                <li><a class="dropdown-item" href="#">所有商品</a></li>
                <li><a class="dropdown-item" href="#noodle">泡麵</a></li>
                <li><a class="dropdown-item" href="#drinks">飲料</a></li>
                <li><a class="dropdown-item" href="#snacks">零食糖果</a></li>
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

      <!-- 產品產生 泡麵 -->
      <section id="noodle" class="section-p1">

            <h2 class="product-title">泡麵</h2>

            
            <div class="pro-container">
              <%
              Connection conn = null;
              Statement stmt = null;
              ResultSet rs = null;
              PreparedStatement pstmt = null;
        
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
                      // 選擇資料庫，創建聲明
                      
                      stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                      String sql = "SELECT * FROM inventoryquantity WHERE ProductType='泡麵'";
                      rs = stmt.executeQuery(sql);

                      while (rs.next()) {
                        String productId = rs.getString("ProductID");
                        String imageUrl = rs.getString("Producturl");
                        String productName = rs.getString("ProductName");
                        int productPrice = rs.getInt("Price");
                          
                          %>
                        }
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
                      }
                    } catch (Exception e) {
                        e.printStackTrace();
                %>
                    <p>Error: <%= e.getMessage() %></p>
                <%
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                        if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
                    }
                %>
            </div>
            
      </section>

      

      <div class="separator"></div> <!-- 分隔線 -->

      <!-- 飲料/酒 -->
      <section id="drinks" class="section-p2">

        <h2 class="product-title">飲料/酒</h2>

            <div class="pro-container">
              <%
                      
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
                      // 選擇資料庫，創建聲明
                      
                      stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                      String sql = "SELECT * FROM inventoryquantity WHERE ProductType='飲料/酒'";
                      rs = stmt.executeQuery(sql);
        
                      while (rs.next()) {
                          String productId = rs.getString("ProductID");
                          String imageUrl = rs.getString("Producturl");
                          String productName = rs.getString("ProductName");
                          int productPrice = rs.getInt("Price");
                          %>
                        
                <!-- 飲料排行商品圖卡 產生jsp -->
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
                          }
                        } catch (Exception e) {
                            e.printStackTrace();
                      %>
                          <p>Error: <%= e.getMessage() %></p>
                      <%
                          } finally {
                              if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                              if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                              if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
                          }
                      %>
                </div>
      </section>

      <div class="separator"></div> <!-- 分隔線 -->

      <!-- 零食糖果 -->
      <section id="snacks" class="section-p2">

        <h2 class="product-title">零食糖果</h2>

        <div class="pro-container">
          <%
                  
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
                  // 選擇資料庫，創建聲明
                  
                  stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                  String sql = "SELECT * FROM inventoryquantity WHERE ProductType='零食/糖果'";
                  rs = stmt.executeQuery(sql);
    
                  while (rs.next()) {
                          String productId = rs.getString("ProductID");
                          String imageUrl = rs.getString("Producturl");
                          String productName = rs.getString("ProductName");
                          int productPrice = rs.getInt("Price");
                      %>
                    
            <!-- 飲料排行商品圖卡 產生jsp -->
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
                      }
                    } catch (Exception e) {
                        e.printStackTrace();
                  %>
                      <p>Error: <%= e.getMessage() %></p>
                  <%
                      } finally {
                          if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                          if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                          if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
                      }
                  %>

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
      </div>  
      </section>

      <!-- slider up -->
      <section class="slider">
          <a href="#">
            <div class="top">
                <iconify-icon icon="iconoir:page-up"></iconify-icon>
            </div>
          </a>
      </section>


    <!-- Javascript 區域 -->
    <script src="./assets/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.iconify.design/iconify-icon/2.1.0/iconify-icon.min.js"></script>
    <script async src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous"></script>

    <!-- 按下購物車時，因為未登入所以先提示登入，不加入購物車 -->
    <script>
      function showAlert() {
        alert("🔔 購買前請先登入！🔔");
      }
    </script>

      <!-- Footer 頁尾部分 -->
      <jsp:include page="./footer.jsp" />

</body>

  
  
</html>
