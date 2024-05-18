//  導覽列
    window.addEventListener("scroll", function(){
        var header = document.querySelector("header");
        header.classList.toggle("sticky",window.scrollY > 0);
    })

//  登入
    var modal = document.getElementById('id01');
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
         }
    }
    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const container = document.getElementById('container');
    
    signUpButton.addEventListener('click', () => {
        container.classList.add("right-panel-active");
    });
    
    signInButton.addEventListener('click', () => {
        container.classList.remove("right-panel-active");
    });

//  購物車
    function openNav() {
        document.getElementById("mySidebar").style.width = "550px";
    }
    function closeNav() {
        document.getElementById("mySidebar").style.width = "0";
        document.getElementById("cart").style.marginLeft = "0";
    }


    $(function() {
        var t = $("#quantity");
        var minButton = $("#min"); // 減少數量按鈕
        var addButton = $("#add"); // 增加數量按鈕
        var total = $("#total");
        var pricePerItem = 3.95;
    
        // 更新總數
        function setTotal() {
            total.html("$" + (parseInt(t.val()) * pricePerItem).toFixed(2));
        }
    
        // 更新數量
        function updateQuantity(amount) {
            var currentValue = parseInt(t.val());
            var newValue = currentValue + amount;
    
            if (newValue > 1) {
                minButton.prop("disabled", false);
            } else {
                minButton.prop("disabled", true);
            }
    
            t.val(newValue);
            setTotal();
        }
    
        // 增加數量
        addButton.click(function() {
            updateQuantity(1);
        });
    
        // 減少數量
        minButton.click(function() {
            updateQuantity(-1);
        });
    
        // 初始化
        setTotal();
        if (parseInt(t.val()) <= 1) {
            minButton.prop("disabled", true);
        }
    });
    
    

    

    