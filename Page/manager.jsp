<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" import="java.util.*" %>
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

    <!-- 基本 css 樣式檔案 -->
    <link href="./stylesheets/index.css" rel="stylesheet">

    <!-- 登入註冊樣式檔  -->
    <link rel="stylesheet" href="./stylesheets/LoginArea.css"> 

    <!-- 購物車樣式檔 -->
    <link rel="stylesheet" href="./stylesheets/BuyCart.css">

     <!-- 會員介面樣式檔 -->
     <link rel="stylesheet" href="stylesheets/manager.css">

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

            <!-- 會員註冊與登入按鈕 -->
            <button onclick="" type="button" class="btn btn-light" style="width: auto;height:auto;font-weight: bold;margin-left:10px;">
              <i class="fa fa-user" aria-hidden="true" style="font-size: 22px;margin-right: 5px;"></i>
               OOO管理員您好！
            </button>

            <!-- 登出按鈕 -->
            <button onclick="location.href='./index.jsp'" type="button" class="btn btn-danger" style="width: auto;height:auto;font-weight: bold;margin-left:10px;">
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
                        <span class="title">訂單管理</span>
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
                        <input type="radio"  name="slider"  id="record" autocomplete="off">

                        <!-- 字區域 -->
                        <div class="text-content">

                            <div class="modify text" style="background: none;">

                              <div class="order-container">
                                <div class="order-header">
                                    <label>訂單編號: 240406002</label>
                                    <label>購買日期: 24/4/6</label>
                                    <label class="order-status">未出貨</label>
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
                                        <tr>
                                            <td><img src="./picture/material/productPic/instant noodles/Instant_noodles_1.jpg" alt="商品名稱" width="50">Nongshim 農心 韓國境內版 辛拉麵 5包</td>
                                            <td>x 1</td>
                                            <td>$239</td>
                                        </tr>
                                        <tr>
                                            <td><img src="./picture/material/productPic/snacks/snacks_3.PNG" alt="商品名稱" width="50">ORION 好麗友 預感非油炸香烤洋芋片 洋蔥口味 2盒</td>
                                            <td>x 1</td>
                                            <td>$ xxx</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="order-footer">
                                    總金額: $ xxx
                                </div>
                              </div>

                              <div class="order-container">
                                <div class="order-header">
                                    <label>訂單編號: 240406002</label>
                                    <label>購買日期: 24/4/6</label>
                                    <label class="order-status">未出貨</label>
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
                                        <tr>
                                            <td><img src="./picture/material/productPic/instant noodles/Instant_noodles_1.jpg" alt="商品名稱" width="50">Nongshim 農心 韓國境內版 辛拉麵 5包</td>
                                            <td>x 1</td>
                                            <td>$239</td>
                                        </tr>
                                        <tr>
                                            <td><img src="./picture/material/productPic/snacks/snacks_3.PNG" alt="商品名稱" width="50">ORION 好麗友 預感非油炸香烤洋芋片 洋蔥口味 2盒</td>
                                            <td>x 1</td>
                                            <td>$ xxx</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="order-footer">
                                    總金額: $ xxx
                                </div>
                              </div>

                            </div>

                            
                            <div class="record text" style="color: #6e573a;">
  
                              <table class="r-table">
                                <tr>
                                  <th>商品編號</th>
                                  <th>商品名稱</th>
                                  <th>價格</th>
                                  <th>庫存</th>
                                  <th>上架</th> 
                                
                              </tr>
                              <tr>
                                  <td>N001</td>
                                  <td><span>No Brand<br>經典炸醬拉麵 135g克 x 5 x 1PC包</span></td>
                                  <td>$179</td>
                                  <td ><input type="number" class="storenumber" style="width: 40px;" ></td>
                                  <td class="dis"><input type="checkbox">上架</td>
                              </tr>
                              <tr>
                                <td>N002</td>
                                <td><span>OTTOGI<br>不倒翁 粗麵條版Q拉麵</span></td>
                                <td>$225</td>
                                <td ><input type="number" class="storenumber" style="width: 40px;" ></td>
                                <td class="dis"><input type="checkbox">上架</td>
                              </tr>
                              <tr>
                                <td>N003</td>
                                <td><span>SAMYANG<br>三養 4種起司風味火辣雞肉風味鐵板炒麵</span></td>
                                <td>$150</td>
                                <td><input type="number" class="storenumber" style="width: 40px;" ></td>
                                <td class="dis"><input type="checkbox">上架</td>
                              </tr>
                              <tr>
                                <td>N004</td>
                                <td><span>SAMYANG<br>三養 4種起司風味火辣雞肉風味鐵板炒麵</span></td>
                                <td>$150</td>
                                <td><input type="number" class="storenumber" style="width: 40px;" ></td>
                                <td class="dis"><input type="checkbox">上架</td>
                              </tr>
                              <tr>
                                <td>N005</td>
                                <td><span>SAMYANG<br>三養 4種起司風味火辣雞肉風味鐵板炒麵</span></td>
                                <td>$150</td>
                                <td><input type="number" class="storenumber" style="width: 40px;" ></td>
                                <td class="dis"><input type="checkbox">上架</td>
                              </tr>
                              
  
                              </table>
  
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
      
    <div class="separator_Footer"></div> <!-- 分隔線 -->

    <!-- 頁尾(含聯絡資訊) 
      ================================================== -->
      <jsp:include page="./footer.jsp" />

    
    <!-- Javascript 區域 -->
    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.iconify.design/iconify-icon/2.1.0/iconify-icon.min.js"></script>
    <script async src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous"></script></body>

  </body>
  
</html>
