<!doctype html>

<html lang="en" data-bs-theme="auto">

  <!-- 此為登入後的介面 -->

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
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

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
    <link href="stylesheets/payment.css" rel="stylesheet">

    <!-- 登入註冊樣式檔  -->
    <link rel="stylesheet" href="stylesheets/LoginArea.css"> 

    <!-- 購物車樣式檔 -->
    <link rel="stylesheet" href="stylesheets/BuyCart.css">

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
              <a href="/index_LoggedIn.html">
              <img src="/picture/material/navPic/navLogo.png" alt="navLogoPic">
              </a>
            </div>
          </div>
          

          <!-- 【搜尋欄】 -->
          <div class="col-sm searchBarCol">
              
              <!-- style 設定搜尋欄的長度 -->
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
                              <img src="picture/material/productPic/snacks/snacks_2.PNG">
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

                              <img src="picture/material/productPic/drinks/banana.jpg">
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

                            <img src="picture/material/productPic/drinks/banana.jpg">
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
                              <input type="button" value="買單去" class="Continu_OR_Checkout_Btn" onclick="location.href='payment.html'">
                            </div>

                        </div>

                      </form>

                  </div>

              </div>

            </div>

            <!-- 【會員註冊登入】 -->

            <!-- 會員註冊與登入按鈕 -->
            <button onclick="location.href='memberPage.html'" type="button" class="btn btn-light" style="width: auto;height:auto;font-weight: bold;margin-left:10px;">
              <i class="fa fa-user" aria-hidden="true" style="font-size: 22px;margin-right: 5px;"></i>
               OOO 您好！
            </button>

            <!-- 登出按鈕 -->
            <button onclick="location.href='index.html'" type="button" class="btn btn-danger" style="width: auto;height:auto;font-weight: bold;margin-left:10px;">
              <i class="fa fa-sign-out" aria-hidden="true" style="font-size: 16px;margin-right: 5px;"></i>
              登出
            </button>

            <!-- 購物車所需js檔 -->
            <script src="javascript/h.js" charset="utf-8"></script>

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
                <li><a class="dropdown-item" href="Allproduct_LoggedIn.html">所有商品</a></li>
                <li><a class="dropdown-item" href="Allproduct_LoggedIn.html#noodle">泡麵</a></li>
                <li><a class="dropdown-item" href="Allproduct_LoggedIn.html#drinks">飲料</a></li>
                <li><a class="dropdown-item" href="Allproduct_LoggedIn.html#snacks">零食糖果</a></li>
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


    <!-- 收件人與寄送資訊
    ================================================== -->

    <section class="paymentArea"> <!-- paymentArea 為兩section之共用大容器 -->

        <!-- 收件人與寄送資訊之容器 -->
        <section class="payment-cont">

            <!-- 收件人與寄送資訊之標題 -->
            <div class="payment-header">
                <iconify-icon icon="mdi:truck-delivery-outline"></iconify-icon>
                <h5>收件人/寄送資訊</h5>
            </div>

            <!-- 收件人與寄送資訊之容器2 -->
            <div class="payment-info">

                <form id="deliveryForm" class="needs-validation" novalidate>
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

                    <fieldset class="fieldset-legend">
                        <legend>訂單備註</legend>
                        <textarea name="comment" rows="10" cols="30" style="height: 160px; width: 550px; resize: none;"></textarea>
                    </fieldset>

                </form>
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
            <form id="paymentForm" class="needs-validation" novalidate>
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
            </form>

        </div>

    </section>

    <div class="submitarea">
        <button id="submitButton" class="paymentbtn">結帳</button>
    </div>

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
    document.getElementById('expiry-date').addEventListener('input', function (e) {
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

    // Submit both forms on button click
    document.getElementById('submitButton').addEventListener('click', function(event) {
        const deliveryForm = document.getElementById('deliveryForm');
        const paymentForm = document.getElementById('paymentForm');
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
            deliveryForm.submit();
            paymentForm.submit();

            /*結帳成功後顯示成功訊息並導至主頁*/
            alert("✅ 結帳成功");
            window.location.href = 'index_LoggedIn.html';
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
    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.iconify.design/iconify-icon/2.1.0/iconify-icon.min.js"></script>
    <script async src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous"></script></body>

  </body>
  
</html>