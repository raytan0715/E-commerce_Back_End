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
          <div class="col-sm navLogoCol" >
            <div class="navLogo" >
              <!-- Logo 點擊回到登入後主頁 -->
              <a href="index_LoggedIn.jsp">
              <img src="./picture/material/navPic/navLogo.png" alt="navLogoPic">
              </a>
            </div>
          </div>
          

         <!-- 【搜尋欄】 -->
          <div class="col-sm searchBarCol">
              
            <form class="d-flex" style="width:750px;"> 
              <input id="searchBar" class="form-control me-2 searchBar" type="search" placeholder="🔍 搜尋" aria-label="Search">
              
              <script>
                // 在輸入框獲得焦點時，添加特定的樣式
                document.getElementById("searchBar").addEventListener("focus", function() {
                    this.classList.add("focused");
                });

                // 在輸入框獲得焦點時，移除特定的樣式
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
                        <form action="#">
                            <h1 style="color: #281805;font-weight: 900; bolder;padding-bottom: 15px;font-weight: 800;">註冊新會員</h1>
                            <input type="text" style="color: #66625e;font-weight: 800;background-color: #eaeaea;" placeholder="姓名" />
                            <input type="number" style="color: #66625e;font-weight: 800;background-color: #eaeaea;" placeholder="電話" />
                            <input type="email" style="color: #66625e;font-weight: 800;background-color: #eaeaea;" placeholder="電子郵件" />
                            <input type="password" style="color: #66625e;font-weight: 800;background-color: #eaeaea;" placeholder="密碼" />
                            <button style="background-color: #a59e94;color: #ffffff;border: 0px;">註冊</button>
                        </form>
                    </div>
                    
                    <div class="form-container sign-in-container">

                        <!-- 登入頁面 -->
                        <form action="#">
                            <h1 style="color: #281805;font-weight: 900; bolder;padding-bottom: 15px;">登入</h1>
                            <input type="email" style="color: #66625e;font-weight: 800;background-color: #eaeaea;" placeholder="電子郵件" />
                            <input type="password" style="color: #66625e;font-weight: 800;background-color: #eaeaea;" placeholder="密碼" />
                            <button style="background-color: #a59e94;color: #ffffff;border: 0px;">登入</button>
                        </form>

                    </div>

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
                    <li><a class="dropdown-item" href="./AllProduct_LoggedIn.html">所有商品</a></li>
                    <li><a class="dropdown-item" href="./AllProduct_LoggedIn.html#noodle">泡麵</a></li>
                    <li><a class="dropdown-item" href="./AllProduct_LoggedIn.html#drinks">飲料</a></li>
                    <li><a class="dropdown-item" href="./AllProduct_LoggedIn.html#snacks">零食糖果</a></li>
                  </ul>
                </li>
              
                <li class="nav-item dropdown">
                  <a class="nav-link " href="#" data-bs-toggle="dropdown" aria-expanded="false" style="padding: 20px;color: #6e573a;font-weight: 1000;font-size: 18px;">關於我們</a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">品牌理念</a></li>
                    <li><a class="dropdown-item" href="#">成員介紹</a></li>
                  </ul>
                </li>
              
                <li class="nav-item">
                  <a class="nav-link" href="#FooterArea" aria-expanded="false" style="padding: 20px;color: #6e573a;font-weight: 1000;font-size: 18px;">聯絡我們</a>
                </li>
              </div>
              
    
            </div>
          </nav>

            <!-- ========== 會員登入註冊介面之 JS語法 ========== -->
            <!-- 導覽列 -->
            
            <!-- JavaScript dependencies -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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

        
      
   
      <!-- 商品購買與介紹區域
      ================================================== -->

      <!-- 商品內容之大容器-->
      <section class="desc-page">
        <%
        // 從URL獲取productId
        String productId = request.getParameter("productId");
        if (productId == null || productId.isEmpty()) {
            out.println("產品ID無效");
            return;
        }
    
        // 連接資料庫並檢索產品詳細資訊
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
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
          <a href="index.jsp" class="path-link">首頁</a> &gt;
          <a href="AllProduct.jsp" class="path-link">商品</a> &gt;
          <a href="product.jsp?productId= <%= productId %>"  class="path-link"><%= productName %></a>
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

              <!-- 商品數量增減按鈕 -->
              <div class="quantityButton" data-min="1" data-max="30">   <!-- 數量增減 data-min最低數量;data-max 最多數量 -->
                <input id="min" type="button" value="&minus;" class="min"/> <!-- ' &minus; '是減號 -->
                <input id="quantity" type="text" value="1" class="quantity"/>
                <input id="add" type="button" value="+" class="add"/>
              </div>

              <!-- 商品購買按鈕容器 -->
              <div class="addToCart">

                <button type="button" class="btn" onclick="showAlert()">
                  加入購物車
                  <script>
                    function showAlert() {
                      alert("🔔 購買前請先登入！🔔");
                    }
                  </script>
                </button>

                
                <button type="button" class="btn" onclick="showAlert()">
                  立即購買
                  <script>
                    function showAlert() {
                      alert("🔔 購買前請先登入！🔔");
                    }
                  </script>
                </button>

              </div>

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

          <!-- 注意事項 -->
          <div class="notice">
            <iconify-icon icon="emojione:double-exclamation-mark"></iconify-icon>
            <h5>注意事項</h5>
            <iconify-icon icon="emojione:double-exclamation-mark"></iconify-icon>
          </div>
        
          <h6>
            &#128666;超商單筆限重為5公斤|宅配15公斤&#128230; <br><br>
            &#128314;如購買多樣請務必留意重量及材積&#128314; <br><br>
            &#128172;如有不清楚部分請透過店長客服詢問&#128587;
          </h6>

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

            <label for="fname">姓名</label><br>

            <input type="text" id="fname" name="fname"><br>

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

          <h5>評論</h5>

          <!-- 評論顯示盒 - 大容器 -->
          <div class="comment-box">

            <!-- 評論顯示盒 小容器 -->
            <div class="box-top">

              <!-- 用戶圖標 -->
              <iconify-icon icon="mingcute:user-4-fill" width="55" style="font-size: 36px;"></iconify-icon>

              <h6>酷寄</h6>

              <!-- 顯示評論之星星顯示區 -->
              <div class="starcomment" id="star-comment">

                <iconify-icon icon="ic:baseline-star" width="25" data-index="1" class="stars" style="font-size: 15px; color: gold;"></iconify-icon>
                <iconify-icon icon="ic:baseline-star" width="25" data-index="2" class="stars" style="font-size: 15px; color: gold;"></iconify-icon>
                <iconify-icon icon="ic:baseline-star" width="25" data-index="3" class="stars" style="font-size: 15px; color: gold;"></iconify-icon>
                <iconify-icon icon="ic:baseline-star" width="25" data-index="4" class="stars" style="font-size: 15px; color: gold;"></iconify-icon>
                <iconify-icon icon="ic:baseline-star" width="25" data-index="5" class="stars" style="font-size: 15px; color: gold;"></iconify-icon>
              
              </div>

              <p>
                辛拉麵麵條Q彈超好吃 !! ~~
              </p>

            </div>

          </div>

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
    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.iconify.design/iconify-icon/2.1.0/iconify-icon.min.js"></script>
    <script async src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous"></script>

</body>

  </body>
  
</html>
