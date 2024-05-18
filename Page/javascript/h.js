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


    $(function(){
        var t = $("#quantity");
        $("#add").click(function(){
            t.val(parseInt(t.val())+1);
            $("#min").removeAttr("disabled");//當按加1時，解除$("#min")不可讀狀態
            setTotal();
        })
        $("#min").click(function(){
                if (parseInt(t.val())>1) {        //判斷數量值大於1時才可以減少
                    t.val(parseInt(t.val())-1)
                    }else{
                    $("#min").attr("disabled","disabled") //當$("#min")為1時，$("#min")不可讀狀態
                }
            setTotal();
        })
        function setTotal(){
            $("#total").html((parseInt(t.val())*3.95).toFixed(2));
        }
        setTotal();
    })
    

    $(function(){
        var t = $("#quantit");
        $("#ad").click(function(){
            t.val(parseInt(t.val())+1);
            $("#mi").removeAttr("disabled");//當按加1時，解除$("#min")不可讀狀態
            setTotal();
        })
        $("#mi").click(function(){
                if (parseInt(t.val())>1) {        //判斷數量值大於1時才可以減少
                    t.val(parseInt(t.val())-1)
                    }else{
                    $("#mi").attr("disabled","disabled") //當$("#min")為1時，$("#min")不可讀狀態
                }
            setTotal();
        })
        function setTotal(){
            $("#total").html((parseInt(t.val())*3.95).toFixed(2));
        }
        setTotal();
    })

    $(function(){
        var t = $("#quanti");
        $("#a").click(function(){
            t.val(parseInt(t.val())+1);
            $("#m").removeAttr("disabled");//當按加1時，解除$("#min")不可讀狀態
            setTotal();
        })
        $("#m").click(function(){
                if (parseInt(t.val())>1) {        //判斷數量值大於1時才可以減少
                    t.val(parseInt(t.val())-1)
                    }else{
                    $("#m").attr("disabled","disabled") //當$("#min")為1時，$("#min")不可讀狀態
                }
            setTotal();
        })
        function setTotal(){
            $("#total").html((parseInt(t.val())*3.95).toFixed(2));
        }
        setTotal();
    })