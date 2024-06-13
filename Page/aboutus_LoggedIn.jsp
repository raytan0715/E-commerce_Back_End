<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" import="java.util.*" %>

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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

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
    <link href="./stylesheets/aboutus.css" rel="stylesheet">

    <!-- 購物車樣式檔 -->
    <link rel="stylesheet" href="./stylesheets/BuyCart.css">

    <!-- cookie提示 網路引用樣式檔 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/Wruczek/Bootstrap-Cookie-Alert@gh-pages/cookiealert.css">

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
              <a href="index_LoggedIn.jsp">
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
            <button onclick="location.href='./logout.jsp'" type="button" class="btn btn-danger" style="width: auto;height:auto;font-weight: bold;margin-left:10px;">
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

      <!-- about us part ------------------- -->
      <!-- 品牌理念 --------------------  -->
      
      <section id="brandConcept" class="aboutSect">
        <div class="titleButtonSect">
          <div class="titleButton1">
            <h4>品牌理念</h4>
          </div>
        </div>
        <div class="brandCont">
            <div class="brandImgContlogo">
                <img src="./picture/material/navPic/navLogo.png" alt="">
            </div>
            <div class="brandDesceven">
                <h6>「吃貨道」 是我們的品牌名稱 <br>
                     主要經營韓國的泡麵、零食和飲品 <br>
                    這個名字不僅諧音「吃貨到」 <br> 同時也代表了那些熱愛美食 <br> 懂得品味和享受美食的人的生活態度 !</h6>
            </div>
        </div>

        <div class="brandCont">
            <div class="brandDescodd">
                <h6>吃貨道是一個充滿探索精神的平台 <br> 我們不斷尋找來自韓國的各種口味和食材 <br> 讓顧客有機會品嚐到從未嘗試過的美味 <br> 無論是辛辣的泡麵、<br> 清爽的飲料還是香脆的零食 <br> 都能在吃貨道找到心中的味道</h6>
            </div>
            <div class="brandImgCont">
                <div class="text-overlay">
                    <h3>探索不同口味 <br> 尋找心中的味道</h3>
                </div>
                <img src="./picture/material/about/about2.jpg" alt="">
            </div>
            
        </div>

        <div class="brandCont">
            <div class="brandImgCont3">
                <div class="text-overlayodd">
                    <h3>品質保證 <br> 美味無限</h3>
                </div>
                <img src="./picture/material/about/about3.jpg" alt="">
            </div>
            <div class="brandDescEven2">
                <h6>我們嚴格把關每一款產品的品質 <br> 只有通過了嚴格的篩選和品質測試的產品 <br> 才能登上我們的平台 <br> 我們希望每位顧客都能放心選購 <br> 享受到最美味的韓國泡麵、零食和飲料</h6>
            </div>
            
            
        </div>

      </section>

      <div class="separator"></div> <!-- 分隔線 -->

      <!-- 成員介紹 ------------------------------  -->
      <section id="MemberIntro" class="aboutSect">
        <div class="titleButton">
          <h4>成員介紹</h4> <br>
        </div>

        <!-- front members -->
        <div class="cardBoxCont">
          <!-- back member 1 -->
            <div class="memberCardCont">
              <div class="card_inner">
                <div class="front_side">
                  <p>11144209</p>
                  <img src="./picture/memberPhoto/jay.jpg" alt=" "> <br>
                  <div class="cardName">
                    <h1>潘驄杰</h1>
                    <h3>Front-End Developer</h3>
                  </div>
                </div>
                <div class="back_side">
                  <h2>心得</h2>
                  <p>這次是我第二次主導前後端的專案實作，相比前一次，這次順利了很多，前後端的溝通與合作都非常主動。我在項目中學習了前端的排版方法，體會到前端工作並不是那麼簡單。當然，最大的挑戰是前後端程式碼合併的問題。我們採取的方法是由我負責主要的結構設計，其餘的功能則分配給其他組員單獨完成。最後，透過我來進行程式碼合併並上傳。這個過程中，我不僅提升了技術能力，還加深了對團隊合作的重要性的理解。
                  </p>
                  <div class="social-icon">
                    <a href="#" target="_blank"><i class="fa-brands fa-instagram"></i></a>
                    <a href="#" target="_blank"><i class="fa-brands fa-facebook-square"></i></a>
                    <a href="#"><i class="fa-regular fa-envelope"></i></a>
                </div>
                </div>
          
              </div>
          
            </div>
          <!-- Front member 2 -->
          <div class="memberCardCont">
            <div class="card_inner">
              <div class="front_side">
                <p>11144275 </p>
                <img src="./picture/memberPhoto/nathania.jpg" alt=" "> <br>
                <div class="cardName">
                  <h1>潘秀玉</h1>
                  <h3>Front-End Developer</h3>
                </div>
              </div>
              <div class="back_side">
                <h2>心得</h2>
                <p>整體而言，這個專案是一個寶貴的學習經歷，增強了我們的技術技能，並教會了我們在現實專案環境中團隊合作和溝通的重要性。看到我們的共同努力最終產生了一個一致且功能完善的最終產品，這讓我們感到非常滿足，並進一步強調了在任何複雜專案中，協作是成功的關鍵。
                </p>
                <div class="social-icon">
                  <a href="#" target="_blank"><i class="fa-brands fa-instagram"></i></a>
                  <a href="#" target="_blank"><i class="fa-brands fa-facebook-square"></i></a>
                  <a href="#"><i class="fa-regular fa-envelope"></i></a>
              </div>
              </div>
        
            </div>
        
          </div>
          <!-- Front member 3 -->
          <div class="memberCardCont">
            <div class="card_inner">
              <div class="front_side">
                <p>11144223</p>
                <img src="./picture/memberPhoto/yinzhen.jpg" alt=" "> <br>
                <div class="cardName">
                  <h1>張尹榛</h1>
                  <h3>Front-End Developer</h3>
                </div>
              </div>
              <div class="back_side">
                <h2>心得</h2>
                <p>這學期換擔任前端的部分，我覺得前置作業是很重要的，一開始要確定好主題還有方向，這樣在實作過程中才不會越來越偏離理想的樣子，另外，使用流程也要清楚方便，讓使用者可以直觀操作，而實作的部分需要花一些時間去調整版型。最後我認為前後端的溝通也非常重要，很感謝組員們按時完成進度，以及後端組員的努力，每週撥空討論，前後端整合後才能讓我們的網站是完整、流暢的。
                </p>
                <div class="social-icon">
                  <a href="#" target="_blank"><i class="fa-brands fa-instagram"></i></a>
                  <a href="#" target="_blank"><i class="fa-brands fa-facebook-square"></i></a>
                  <a href="#"><i class="fa-regular fa-envelope"></i></a>
              </div>
              </div>
        
            </div>
        
          </div>
        </div>


        <!-- backend members -->
        <div class="cardBoxCont">
          <!-- back member 1 -->
            <div class="memberCardCont">
              <div class="card_inner">
                <div class="front_side">
                  <p>11144138</p>
                  <img src="./picture/memberPhoto/ray.jpg" alt=" 譚睿承"> <br>
                  <div class="cardName">
                    <h1>譚睿承</h1>
                    <h3>Back-End Developer</h3>
                  </div>
                </div>
                <div class="back_side">
                  <h2>心得</h2>
                  <p>這學期輪到我們小組做後端開發的部分，但是我們在做後端的部分上面有遇到許多不少的問題，像是當我們想要設定一些有關比較複雜的java函數放在檔案裏面會導致許多的錯誤，像是當我在製作後端密碼傳送時的時候，我想要設定關於哈希加密的時候環境設定等等的問題。總之在很多關於後端的部份我們還有很多的部分要學，希望未來如果要繼續學習後端的部分我可以能夠更能精進，能將現在的所學套用到未來。</p>
                  <div class="social-icon">
                    <a href="#" target="_blank"><i class="fa-brands fa-instagram"></i></a>
                    <a href="#" target="_blank"><i class="fa-brands fa-facebook-square"></i></a>
                    <a href="#"><i class="fa-regular fa-envelope"></i></a>
                </div>
                </div>
          
              </div>
          
            </div>
          <!-- back member 2 -->
          <div class="memberCardCont">
            <div class="card_inner">
              <div class="front_side">
                <p>11144139 </p>
                <img src="./picture/memberPhoto/anita.jpg" alt=" "> <br>
                <div class="cardName">
                  <h1>高嘉嬨</h1>
                  <h3>Back-End Developer</h3>
                </div>
              </div>
              <div class="back_side">
                <h2>心得</h2>
                <p>這學期輪到我們小組負責後端部分的開發。雖然這是我首次深入了解後端程式設計，但由於有上學期的經驗，減少了許多手忙腳亂的情況。這學期，我們兩邊的小組成員能夠利用彼此在前端和後端的經驗和知識互相幫助，溝通更為流暢，網站也因此能夠快速地成形。通過這次的合作，我學到了如何更好地整合前後端技術，並深刻體會到團隊合作的重要性。
                </p>
                <div class="social-icon">
                  <a href="#" target="_blank"><i class="fa-brands fa-instagram"></i></a>
                  <a href="#" target="_blank"><i class="fa-brands fa-facebook-square"></i></a>
                  <a href="#"><i class="fa-regular fa-envelope"></i></a>
              </div>
              </div>
        
            </div>
        
          </div>
          <!-- back member 3 -->
          <div class="memberCardCont">
            <div class="card_inner">
              <div class="front_side">
                <p>11144155</p>
                <img src="./picture/memberPhoto/zijie.png" alt=" "> <br>
                <div class="cardName">
                  <h1>鍾子傑</h1>
                  <h3>Back-End Developer</h3>
                </div>
              </div>
              <div class="back_side">
                <h2>心得</h2>
                <p>這次我們改負責後端的部分雖然有了一點前端的經驗感覺會比之前輕鬆一點，但結果一開始還是有非常多不懂和找不到問題點的BUG，在多次開會溝通和資料查詢下我們才逐漸地讓架構成型和成功的一一排錯。多虧了兩組所有人的溝通與合作最後才能有效的連結前端與後端完成這個網站。
                </p>
                <div class="social-icon">
                  <a href="#" target="_blank"><i class="fa-brands fa-instagram"></i></a>
                  <a href="#" target="_blank"><i class="fa-brands fa-facebook-square"></i></a>
                  <a href="#"><i class="fa-regular fa-envelope"></i></a>
              </div>
              </div>
        
            </div>
        
          </div>
        </div>


        
      </section>
      

     

      <!-- 頁尾(含聯絡資訊) 
      ================================================== -->

      <section id="FooterArea" class="Footer container " style="background-color: #fff; width: 100%;color: #796146;">

        <footer class="py-5">

          <div class="row" style="display: flex; align-items: center;">
            <div class="col">
                <h5 style="font-size: 22px;font-weight: 1000;margin-bottom: 20px;padding-left: 180px;">聯絡資訊</h5>
                <ul style="font-size: 17px;font-weight: 500;padding-left: 200px;">
                    <li style="margin-bottom: 10px;">客服專線：(03)26599</li>
                    <li style="margin-bottom: 10px;">客服時間：09:00-18:00</li>
                    <li style="margin-bottom: 10px;">信箱 : foodie@gmail.com</li>
                    <li>地址：320桃園市中壢區中北路200號<br>(中原大學資訊管理學系)</li>
                </ul>
            </div>
        
            <div class="col">
                <div class="MapArea">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3617.266894455652!2d121.24097727482966!3d24.957032541387473!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346822143c046009%3A0x63e3ef21e3beebac!2z6LOH6KiK566h55CG5a2457O7!5e0!3m2!1szh-TW!2stw!4v1715502788841!5m2!1szh-TW!2stw" width="500" height="400" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
            </div>
        </div>

            </div>
      
        </footer>

        <div class="separator_Footer"></div> <!-- 分隔線 -->

        <div class="d-flex flex-column flex-sm-row justify-content-between py-4 my-4">

          <p>&copy; 2024 Company, Inc. All rights reserved.</p>

          <!-- 可自行更動網頁瀏覽人數設定 -->
          <p> 網頁瀏覽人數：<span id="visitor-count">999</span>人</p>
        </div>
          <script>
            $(document).ready(function() {
                $.ajax({
                    url: 'footer.jsp',
                    method: 'GET',
                    success: function(data) {
                        var visitorCount = $(data).find('#visitor-count-value').text();
                        $('#visitor-count').text(visitorCount);
                    },
                    error: function() {
                        console.error('Failed to fetch visitor count');
                    }
                });
            });
        </script>

      </section>

      <!-- Cookie 提示區域 -->
      <div class="alert text-center cookiealert" role="alert">
        &#x1F36A; 我們使用cookie來提供和改善服務！若繼續使用本網站，表示您同意我們使用cookie。 <a href="https://cookiesandyou.com/" target="_blank">了解更多關於Cookie</a>
        <br><br>
        <button type="button" class="btn btn-primary btn-sm acceptcookies" style="background-color: rgb(138, 241, 138);color: #282929;">
            同意
        </button>
      </div>
      <!--------->

      <!-- 回到頂部按鈕 -->
      <div class="slider">
        <a href="#">
          <div class="top">
              <iconify-icon icon="iconoir:page-up"></iconify-icon>
          </div>
        </a>
      </div>

    <!-- Javascript 區域 -->
    <script src="./assets/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.iconify.design/iconify-icon/2.1.0/iconify-icon.min.js"></script>
    <script async src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous"></script></body>
    
    <!-- 添加 cookie提示 script -->
    <script src="https://cdn.jsdelivr.net/gh/Wruczek/Bootstrap-Cookie-Alert@gh-pages/cookiealert.js"></script>

  </body>
  
</html>
