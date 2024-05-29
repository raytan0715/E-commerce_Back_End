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
    <link href="./stylesheets/index.css" rel="stylesheet">

    <!-- 登入註冊樣式檔  -->
    <link rel="stylesheet" href="./stylesheets/LoginArea.css">

    <!-- cookie提示 網路引用樣式檔 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/Wruczek/Bootstrap-Cookie-Alert@gh-pages/cookiealert.css">

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
                        <form action="#">
                            <h1 style="color: #281805;font-weight: 900;padding-bottom: 15px;font-weight: 800;">註冊新會員</h1>
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
                            <h1 style="color: #281805;font-weight: 900;padding-bottom: 15px;">登入</h1>
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

            <!-- ========== 會員登入註冊介面之 JS語法 ========== -->
            <!-- 導覽列 -->
            <script src="javascript/h.js" charset="utf-8"></script>

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

             <!-- 【商品瀏覽】 -->
             <li class="nav-item dropdown">
                <a class="nav-link " href="#" data-bs-toggle="dropdown" aria-expanded="false" style="padding: 20px;color: #6e573a;font-weight: 1000;font-size: 18px;">商品瀏覽</a>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="./AllProduct.jsp">所有商品</a></li>
                  <li><a class="dropdown-item" href="./AllProduct.jsp">泡麵</a></li>
                  <li><a class="dropdown-item" href="./AllProduct.jsp#drinks">飲料</a></li>
                  <li><a class="dropdown-item" href="./AllProduct.jsp#snacks">零食糖果</a></li>
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



<!-- 圖片輪播
================================================== -->

<div id="myCarousel" class="carousel slide mb-6" data-bs-ride="carousel" data-bs-interval="3000">

    <!-- 圖片輪播區下方導引按鈕 -->
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1" style="background-color: #282929;height:5px"></button>
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2" style="background-color: #535758;height:5px"></button>
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3" style="background-color: #535758;height:5px"></button>
    </div>

    <!-- 輪播圖片區 - 大容器-->
    <div class="carousel-inner" style="background-color: aliceblue;">
        
        <!-- 輪播圖片區 - 小容器(圖片01)-->
        <div class="carousel-item active">
            <!-- 點擊導引至該商品連結 -->
            <a href="./product.jsp?productId=18" style="text-decoration: none; position: relative;">
            <div class="d-flex justify-content-center align-items-center">
                <img class="bd-placeholder-img" width="85%" height="auto" src="./picture/material/indexPageMaterial/CarouselPic/Carousel01.jpg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                <rect width="100%" height="100%" fill="var(--bs-secondary-color)">
            </div>
            <div class="container">
                <div class="carousel-caption text-start">
                </div>
            </div>
            </a>
        </div>



        <!-- 輪播圖片區 - 小容器(圖片02)-->
        <div class="carousel-item">
            <!-- 點擊導引至該商品連結 -->
            <a href="./product.jsp?productId=4" style="text-decoration: none; position: relative;">
            <div class="d-flex justify-content-center align-items-center">
                <img class="bd-placeholder-img" width="85%" height="auto" src="./picture/material/indexPageMaterial/CarouselPic/Carousel02.jpg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                <rect width="100%" height="100%" fill="var(--bs-secondary-color)">
            </div>
            <div class="container">
                <div class="carousel-caption">
                </div>
            </div>
            </a>
        </div>

        <!-- 輪播圖片區 - 小容器(圖片03)-->
        <div class="carousel-item">
            <!-- 點擊導引至該商品連結 -->
            <a href="./product.jsp?productId=12" style="text-decoration: none; position: relative;">
            <div class="d-flex justify-content-center align-items-center">
                <img class="bd-placeholder-img" width="85%" height="auto" src="./picture/material/indexPageMaterial/CarouselPic/Carousel03.jpg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                <rect width="100%" height="100%" fill="var(--bs-secondary-color)">
            </div>
            <div class="container">
                <div class="carousel-caption text-end">
                </div>
            </div>
            </a>
        </div>
        
    </div>

    <!-- 上一張圖片的按鈕 -->
    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev"  style="width: 115px;background-color: #969391;">
        <span class="carousel-control-prev-icon"  aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>

    <!-- 下一張圖片的按鈕 -->
    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next" style="width: 115px;background-color: #969391;"">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
    </button>

</div>


<!-- 人氣排行 (圖卡區)
================================================== -->

<section class="TrendingProduct">

    <!-- 人氣排行(圖片標題) -->
    <div class="TrendingProduct_PictureTitle" >
        <img src="./picture/material/indexPageMaterial/TrendingTitle.png" alt="PitureForm_Of_Title">
    </div>

    
    <!-- 人氣排行商品展示區容器 -->
    <div class="TrendingProduct_CardContainer">
        <%
        // JDBC 變數宣告
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        // 順序圖標的陣列
        String[] rankingImages = {"firstPlace.png", "secondPlace.png", "thirdPlace.png"};

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
                stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                
                // 查詢庫存數量最少的商品
                String sql = "SELECT * FROM finalproject.inventoryquantity ORDER BY Quantity ASC LIMIT 3";
                rs = stmt.executeQuery(sql);

                int i = 0;
                while (rs.next() && i < rankingImages.length) {
                    String productId = rs.getString("ProductID");
                    String imageUrl = rs.getString("Producturl");
                    String productName = rs.getString("ProductName");
                    int productPrice = rs.getInt("Price");
        %>

        <!-- 人氣排行商品圖卡-->
        <div class="col-sm-6 col-lg-4 mb-4 card-hover position-relative">

            <!-- 點擊導引至商品連結 -->
            <a href="./product.jsp?productId=<%= productId %>" style="text-decoration: none; position: relative;">

                <div class="card" style="width: 330px; height: 420px; position: relative; background-color: rgb(255, 255, 255);">

                    <!-- 排名圖標 -->
                    <img src="./picture/material/indexPageMaterial/<%= rankingImages[i] %>" alt="RankingImage" style="width:75px; height:auto; position: absolute; top: -20px; left: -20px;">

                    <!-- 商品圖片 -->
                    <img class="bd-placeholder-img card-img-top" width="100%" height="250" src="<%= imageUrl %>" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <rect width="100%" height="100%" fill="#868e96"/></img>

                    <!-- 商品詳細資訊 -->
                    <div class="card-body" style="background-color: rgb(255, 255, 255);">
                        <h5 class="card-title" style="color: black;"><%= productName %></h5>
                        <p class="card-text" style="font-size: large; font-weight: bold; color: rgb(207, 15, 53);">NT$<%= productPrice %></p>
                    </div>
                </div>
            </a>
        </div>
        <%
                    i++;
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

    <div class="ResgisterForSale">
        <img src="./picture/material/indexPageMaterial/RegisterForSales.png" alt="Piture_Of_ResgisterForSale">
    </div>

</section>

<div class="separator"></div> <!-- 分隔線 -->

<!-- 新品上架
================================================== -->

<section class="NewArrivals">

    <!-- 新品上架(圖片標題) -->
    <div class="NewArrivals_PictureTitle" >
        <img src="./picture/material/indexPageMaterial/NewArrivalsTitle.png" alt="PitureForm_Of_Title">
    </div>

    <!-- 新品上架展示區容器 -->
    <div class="NewArrivals_CardContainer">

    <!-- 點擊導引至商品連結 -->
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
                String sql = "SELECT * FROM finalproject.inventoryquantity ORDER BY ProductID DESC LIMIT 3";
                rs = stmt.executeQuery(sql);

                while (rs.next()) {
                    String productId = rs.getString("ProductID");
                    String imageUrl = rs.getString("Producturl");
                    String productName = rs.getString("ProductName");
                    int productPrice = rs.getInt("Price");
            %>
        <!-- 新品上架商品圖卡 -->
        <div class="col-sm-6 col-lg-4 mb-4 card-hover position-relative">
            

            
            <a href="./product.jsp?productId=<%= productId %>" style="text-decoration: none; position: relative;">
                <div class="card" style="width: 330px; height: 420px; position: relative;background-color: rgb(255, 255, 255);">

                    <!-- 商品圖片 -->
                    <img class="bd-placeholder-img card-img-top" src="<%= imageUrl %>" alt="<%= productName %>" width="100%" height="250" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false">

                    <!-- 商品詳細資訊 -->
                    <div class="card-body" style="background-color: rgb(255, 255, 255);">
                        <h5 class="card-title" style="color: black;"><%= productName %> </h5>
                        <p class="card-text" style="font-size: large;font-weight: bold;color: rgb(207, 15, 53);">$<%= productPrice %></p>
                    </div>
                    
                </div>
                
            </a>
                
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

<!-- 精選推薦
================================================== -->

<section class="Recommendation" style="margin-bottom: 120px;">

    <!-- 精選推薦(圖片標題) -->
    <div class="Recommendation_PictureTitle" >
        <img src="./picture/material/indexPageMaterial/RecommendationTitle.png" alt="PitureForm_Of_Title">
    </div>

    <div class="Recommendation_CardContainer" >

        <!-- 精選推薦圖卡 01-->
        <div class="col-sm-6 col-lg-4 mb-4 card card-btn position-relative" style="width: 330px;height:600px;background-color: #b3d6e4">

            <!-- 圖卡圖片-->
            <img class="bd-placeholder-img card-img-top" width="100%" height="400" src="./picture/material/indexPageMaterial/Recommendation_Beverage.jpg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#868e96"/></svg>

            <div class="card-body">
                <h5 class="card-title" style="font-weight:900;color: black;font-size: 25px;">沁涼一夏</h5>
                <p class="card-text" style="color: #535758;font-size: large;">炎炎夏日，來一杯冰飲，一起歡聚「飲冰」食光。</p>

                <!-- 了解更多按鈕 -->
                <a href="./AllProduct.jsp#drinks" class="btn btn-primary" style="background-color: #000000;color: rgb(244, 244, 244);font-size: 16px;border: 0px;">了解更多</a>
            </div>
        </div>

        <!-- 精選推薦圖卡 02-->
        <div class="col-sm-6 col-lg-4 mb-4 card card-btn position-relative" style="width: 330px;height:600px;background-color: #d1c9c0">

            <!-- 圖卡圖片-->
            <img class="bd-placeholder-img card-img-top" width="100%" height="400" src="./picture/material/indexPageMaterial/Recommendation_nightFood.jpg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#868e96"/></svg>

            <div class="card-body">
                <h5 class="card-title" style="font-weight:900;color: black;font-size: 25px;">深夜食光</h5>
                <p class="card-text" style="color: #535758;font-size: large;">夜色昏暗，明月當天，還在挑燈夜戰嗎？給宵夜時間的你。</p>

                <!-- 了解更多按鈕 -->
                <a href="./AllProduct.jsp#noodle" class="btn btn-primary" style="background-color: #000000;color: rgb(244, 244, 244);font-size: 16px;border: 0px;">了解更多</a>
            </div>
        </div>

        <!-- 精選推薦圖卡 03-->
        <div class="col-sm-6 col-lg-4 mb-4 card card-btn position-relative" style="width: 330px;height:600px;background-color: #f3ed9d">

            <!-- 圖卡圖片-->
            <img class="bd-placeholder-img card-img-top" width="100%" height="400" src="./picture/material/indexPageMaterial/Recommendation_snacks.jpg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#868e96"/></svg>

            <div class="card-body">
                <h5 class="card-title" style="font-weight:900;color: black;font-size: 25px;">點心輕食</h5>
                <p class="card-text" style="color: #535758;font-size: large;">不飢不餓，但還是想滿足口腹之慾？這裡有各類點心輕食提供給你。</p>

                <!-- 了解更多按鈕 -->
                <a href="./AllProduct.jsp#snacks" class="btn btn-primary" style="background-color: #000000;color: rgb(244, 244, 244);font-size: 16px;border: 0px;">了解更多</a>
            </div>
        </div>
</section>


<!-- Footer 頁尾部分 -->
<jsp:include page="./footer.jsp" />

<!-- Cookie 提示區域 -->
<div class="alert text-center cookiealert" role="alert">
    &#x1F36A; 我們使用cookie來提供和改善服務！若繼續使用本網站，表示您同意我們使用cookie。 <a href="https://cookiesandyou.com/" target="_blank">了解更多關於Cookie</a>
    <br><br>
    <button type="button" class="btn btn-primary btn-sm acceptcookies" style="background-color: rgb(138, 241, 138);color: #282929;">
        同意
    </button>
</div>
<!--------->

<!-- Javascript 區域 -->
<script src="./assets/dist/js/bootstrap.bundle.min.js"></script>
<script async src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous"></script></body>

<!-- 添加 cookie提示 script -->
<script src="https://cdn.jsdelivr.net/gh/Wruczek/Bootstrap-Cookie-Alert@gh-pages/cookiealert.js"></script>

</body>

</html>
