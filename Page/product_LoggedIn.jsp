<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
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
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

    <title> 吃貨道| 吃貨的專屬門道 </title> 

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/carousel/">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/headers/">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/masonry/">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/footers/">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/navbars/">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link href="./assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100..900&display=swap" rel="stylesheet">

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

    <link href="./stylesheets/product.css" rel="stylesheet">
    <link rel="stylesheet" href="./stylesheets/BuyCart.css">
    <link rel="stylesheet" href="./stylesheets/LoginArea.css"> 
  </head>

  <body>
    <nav class="navbar navbar-expand-lg"> 
        <div class="row navOneRow">
          <div class="col-sm navLogoCol">
            <div class="navLogo">
              <a href="./index_LoggedIn.jsp">
              <img src="./picture/material/navPic/navLogo.png" alt="navLogoPic">
              </a>
            </div>
          </div>
          
          <div class="col-sm searchBarCol">
            <form class="d-flex" action="./SearchProduct_LoggedIn.jsp" method="get" style="width:750px;">
              <input id="searchBar" class="form-control me-2 searchBar" name="keyword" type="search" placeholder="🔍 搜尋" aria-label="Search">
              <script>
                  document.getElementById("searchBar").addEventListener("focus", function() {
                      this.classList.add("focused");
                  });
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
                                  out.println("<p style='color: black; text-align: center;'>您的購物車是空的</p>");
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

            <%
            
                Connection connUser = null;
                PreparedStatement pstmtUser = null;
                ResultSet rsUser = null;
            
                String userName = "";
                String MemberID = "";
                
                try {
                  String url = "jdbc:mysql://localhost:3306/FinalProject?serverTimezone=UTC";
                  Class.forName("com.mysql.cj.jdbc.Driver");
                  connUser = DriverManager.getConnection(url, "root", "Ray_930715");
      
                  String sqlUser = "SELECT MemberName, MemberID FROM membership WHERE MemberAccount = ?";
                  pstmtUser = connUser.prepareStatement(sqlUser);
                  pstmtUser.setString(1, email);
                  rsUser = pstmtUser.executeQuery();
      
                  if (rsUser.next()) {
                      userName = rsUser.getString("MemberName");
                      MemberID = rsUser.getString("MemberID");
                  }
      
                  session.setAttribute("userName", userName);
                  session.setAttribute("MemberID", MemberID);
                  connUser.close();
              } catch (SQLException sExec) {
                  out.println("SQL 錯誤: " + sExec.toString());
              }
            %>
            <button onclick="location.href='./memberPage.jsp'" type="button" class="btn btn-light" style="width: auto;height:auto;font-weight: bold;margin-left:10px;">
              <i class="fa fa-user" aria-hidden="true" style="font-size: 22px;margin-right: 5px;"></i>
              <%= userName %> 您好！
            </button>

            <!-- 登出按鈕 -->
            <button onclick="location.href='./logout.jsp'" type="button" class="btn btn-danger" style="width: auto;height:auto;font-weight: bold;margin-left:10px;">
              <i class="fa fa-sign-out" aria-hidden="true" style="font-size: 16px;margin-right: 5px;"></i>
              登出
            </button>

            <script src="./javascript/h.js" charset="utf-8"></script>
          </div>
        </div>
      </nav>

      <nav class="navbar navbar-expand-lg navbar-black bg-black" aria-label="Tenth navbar example"> 
        <div class="container-fluid" style="background-color: #f7f7f7">
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
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
   
      <section class="desc-page">
        
      <%
      // 從URL獲取productId
      String productId = request.getParameter("productId");
      if (productId == null || productId.isEmpty()) {
          out.println("產品ID無效");
          return;
      }

      String userid = (String) session.getAttribute("userid");
      if (userid == null) {
        userid = "defaultUserId"; // Or redirect to login page or show an error
      }

      Connection connProduct = null;
      PreparedStatement pstmtProduct = null;
      ResultSet rsProduct = null;
      try {
        // 加載JDBC驅動
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/FinalProject?serverTimezone=UTC";
        String dbUsername = "root";
        String dbPassword = "Ray_930715";
  
        // 建立連接
        connProduct = DriverManager.getConnection(url, dbUsername, dbPassword);
  
        if (connProduct.isClosed()) {
            out.println("連線建立失敗");
        } else {
            // 創建聲明
            String sql = "SELECT * FROM inventoryquantity WHERE ProductID=?";
            pstmtProduct = connProduct.prepareStatement(sql);
            pstmtProduct.setString(1, productId);
            rsProduct = pstmtProduct.executeQuery();
  
            if (rsProduct.next()) {
                String productName = rsProduct.getString("ProductName");
                int productPrice = rsProduct.getInt("Price");
                int productQuantity = rsProduct.getInt("Quantity");
                String productExp = rsProduct.getString("exp");
                String productIngredientList = rsProduct.getString("LngredientList");
                String productAllergyList = rsProduct.getString("AllergyList");
                String productDetails = rsProduct.getString("ProductDetails");
                String productUrl = rsProduct.getString("Producturl");

      %>

        <div class="product-path">
          <a href="./index_LoggedIn.jsp" class="path-link">首頁</a> &gt;
          <a href="./AllProduct_LoggedIn.jsp" class="path-link">商品</a> &gt;
          <a href="./product_LoggedIn.jsp?productId=<%= productId %>" class="path-link"><%= productName %></a>
        </div>

        <div id="product1" class="display">
          <div class="cont-img">
            <img src="<%= productUrl %>" alt="<%= productName %>">
          </div>

          <div class="cont">
              <div class="cont-name">
                <h5><%= productName %></h5>
                <h6>NT$<%= productPrice %></h6>
                <p>庫存數量：<%= productQuantity %></p>
                <p>到期日：<%= productExp %></p>
              </div>

              <form method='post' action='./tocart.jsp' class='product' id="productForm">
                <div class="quantityButton" data-min="1" data-max="30">
                    <input type="button" value="&minus;" class="min"/>
                    <input type="text" name="quantity" value="1" class="quantity"/>
                    <input type="button" value="+" class="add"/>
                </div>
                <input type="hidden" name="productId" value="<%= productId %>"/>
                <input type="hidden" name="MemberID" value="<%= MemberID %>"/>
                <input type="hidden" name="productPrice" value="<%= productPrice %>"/>
                <input type="hidden" name="Producturl" value="<%= productUrl %>"/>
                <input type="hidden" name="ProductName" value="<%= productName %>"/>
                <input type="hidden" name="source" value="product_LoggedIn.jsp"/>
                <input type="hidden" name="redirect" value="product"/>
            
                <div class="addToCart">
                    <button type="submit" class="btn" onclick="showAlert()" id="addToCartButton">
                        加入購物車
                    </button>
                    <button type="button" class="btn" id="buyNowButton">
                        立即購買
                    </button>
                </div>
            </form>
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

                    document.querySelectorAll('.quantity').forEach(input => {
                        input.addEventListener('input', function() {
                            let value = this.value.replace(/[^0-9]/g, '');
                            const quantityButton = this.closest('.quantityButton');
                            const max = parseInt(quantityButton.getAttribute('data-max'));

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

        <div class="separator"></div>

        <div class="introduction">
          <h4> &#92;商品介紹&sol;</h4>
          <p><%= productDetails %></p>
          <br>
          <h4> &#92;成分内容&sol;</h4>
          <p><%= productIngredientList %></p>
          <br>
          <h4> &#92;過敏原資訊&sol;</h4>
          <p><%= productAllergyList %></p>
          <br>
        </div>
        <%
          } else {
              out.println("找不到該產品的詳細資訊");
          }
        }
      } catch (Exception e) {
        e.printStackTrace();
      } finally {
        if (rsProduct != null) try { rsProduct.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmtProduct != null) try { pstmtProduct.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (connProduct != null) try { connProduct.close(); } catch (SQLException e) { e.printStackTrace(); }
      }
      %>
      </section>

      <div class="separator"></div>

      <section class="comment">
        <div class="leftside">
          <h5>留言評價</h5>
          <form action="./submitComment.jsp" method="post">
            <label for="fname" style="font-size: 22px;">姓名: <%= session.getAttribute("userName") %></label><br>
            <input type="hidden" name="userEmail" value="<%= session.getAttribute("userEmail") %>">
            <input type="hidden" id="fname" name="fname" class="CommentNameInput" value="<%= session.getAttribute("userName") %>" readonly><br>
        
            <p>留言</p>
            <textarea name="message" rows="10" cols="30" style="height: 200px; resize: none;"></textarea>
            <br><br>
        
            <div class="star" id="star-rating">
              <iconify-icon icon="ic:baseline-star" width="40" data-index="1" class="star-icon"></iconify-icon>
              <iconify-icon icon="ic:baseline-star" width="40" data-index="2" class="star-icon"></iconify-icon>
              <iconify-icon icon="ic:baseline-star" width="40" data-index="3" class="star-icon"></iconify-icon>
              <iconify-icon icon="ic:baseline-star" width="40" data-index="4" class="star-icon"></iconify-icon>
              <iconify-icon icon="ic:baseline-star" width="40" data-index="5" class="star-icon"></iconify-icon>
            </div>
        
            <input type="hidden" name="starRating" id="starRatingInput">
            <input type="hidden" name="MemberID" value="<%= session.getAttribute("MemberID") %>">
            <input type="hidden" name="ProductID" value="<%= request.getParameter("productId") %>">
            <input type="submit" value="送出">
          </form>
        </div>
        
        <script>
          document.addEventListener("DOMContentLoaded", function() {
            const starIcons = document.querySelectorAll(".star-icon");
        
            starIcons.forEach((starIcon) => {
              starIcon.addEventListener("click", function() {
                const clickedIndex = parseInt(this.getAttribute("data-index"));
        
                document.getElementById("starRatingInput").value = clickedIndex;
        
                starIcons.forEach((icon, index) => {
                  if (index < clickedIndex) {
                    icon.classList.add("selected");
                  } else {
                    icon.classList.remove("selected");
                  }
                });
        
                console.log("Selected Rating: " + clickedIndex);
              });
            });
          });
        </script>

        <div class="rightside">
          <h5>評論</h5>
          <div class="comment-box">
              <%
              List<Map<String, Object>> comments = new ArrayList<>(); // Declare outside the try block to ensure availability in the loop
              Connection connComments = null; // Use unique variable names
              PreparedStatement pstmtComments = null; // Use unique variable names
              ResultSet rsComments = null; // Use unique variable names

              try {
                  // Fetch product ID from request
                  String productIdParam = request.getParameter("productId");
                  if (productIdParam == null || productIdParam.isEmpty()) {
                      out.println("Invalid product ID");
                      return; // Exit if no product ID is provided
                  }

                  int productIds = Integer.parseInt(productIdParam);

                  String url = "jdbc:mysql://localhost:3306/FinalProject?serverTimezone=UTC";
                  Class.forName("com.mysql.cj.jdbc.Driver");
                  connComments = DriverManager.getConnection(url, "root", "Ray_930715");

                  String sql = "SELECT m.MemberName, c.star, c.comment FROM comment c JOIN membership m ON c.MemberID = m.MemberID WHERE c.ProductID = ? ORDER BY c.CommentID DESC";
                  pstmtComments = connComments.prepareStatement(sql);
                  pstmtComments.setInt(1, productIds);
                  rsComments = pstmtComments.executeQuery();

                  while (rsComments.next()) {
                      Map<String, Object> comment = new HashMap<>();
                      comment.put("userName", rsComments.getString("MemberName"));
                      comment.put("starRating", rsComments.getInt("star"));
                      comment.put("comment", rsComments.getString("comment"));
                      comments.add(comment);
                  }
              } catch (Exception e) {
                  e.printStackTrace();
              } finally {
                  if (rsComments != null) try { rsComments.close(); } catch (SQLException ex) { ex.printStackTrace(); }
                  if (pstmtComments != null) try { pstmtComments.close(); } catch (SQLException ex) { ex.printStackTrace(); }
                  if (connComments != null) try { connComments.close(); } catch (SQLException ex) { ex.printStackTrace(); }
              }

              for (Map<String, Object> comment : comments) {
              %>
              <div class="box-top">
                  <!-- 用戶圖標 -->
                  <iconify-icon icon="mingcute:user-4-fill" width="55" style="font-size: 36px;"></iconify-icon>
                  <h6><%= comment.get("userName") %></h6>
                  <div class="starcomment" id="star-comment">
                      <% for (int i = 1; i <= (int) comment.get("starRating"); i++) { %>
                          <iconify-icon icon="material-symbols:star" width="25" class="stars" style="font-size: 15px; color: gold;"></iconify-icon>
                      <% }
                      for (int i = (int) comment.get("starRating") + 1; i <= 5; i++) { %>
                          <iconify-icon icon="material-symbols:star-outline" width="25" class="stars" style="font-size: 15px; color: gold;"></iconify-icon>
                      <% } %>
                  </div>
                  <p><%= comment.get("comment") %></p>
                  <div class="separator" style="margin-bottom: 0%; margin-top: 0; width: 100%;"></div> <!-- 分隔線 -->
              </div>
              <% } %>
          </div>
        </div>

      </section>
      
      <div class="slider">
        <a href="#">
          <div class="top">
              <iconify-icon icon="iconoir:page-up"></iconify-icon>
          </div>
        </a>
      </div>

      <jsp:include page="./footer.jsp" />

      <script>
        document.getElementById('buyNowButton').addEventListener('click', function(event) {
            event.preventDefault(); // 防止表單的默認提交
            const form = document.getElementById('productForm');
            form.action = './tocart.jsp?redirect=payment'; // 設置不同的action
            form.submit();
        });
    
        function showAlert() {
            alert("✅ 已加入購物車！");
        }
    
    </script>

    <script src="./assets/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.iconify.design/iconify-icon/2.1.0/iconify-icon.min.js"></script>
    <script async src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous"></script>
</body>
</html>
