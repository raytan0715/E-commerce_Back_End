/*地址填寫區域選擇設定 */              
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

// 信用卡區域：貨到付款與線上付款之信用卡欄位，必填與否設定
document.addEventListener('DOMContentLoaded', function() {
  const paymentMethodRadios = document.querySelectorAll('input[name="payment-method"]');
  const creditCardInputs = document.querySelectorAll('#credit-card, #expiry-date, #securitynum, #cardholder-name');

  // 貨到付款與線上付款之欄位填寫與否控制
  function updateRequiredAttributes() {
        const selectedPaymentMethod = document.querySelector('input[name="payment-method"]:checked').value;
        const creditCardNumInput = document.getElementById('credit-card');
        const expiryDateInput = document.getElementById('expiry-date');
        const securityNumInput = document.getElementById('securitynum');
        const cardHolderNameInput = document.getElementById('cardholder-name');

        const creditCardInputs = [creditCardNumInput, expiryDateInput, securityNumInput, cardHolderNameInput];

        if (selectedPaymentMethod === '線上付款') {
            creditCardInputs.forEach(input => {
                input.setAttribute('required', 'required');
                input.removeAttribute('disabled');
                input.removeEventListener('focus', showAlertAndDisable);
            });
        } else {
            creditCardInputs.forEach(input => {
                input.removeAttribute('required');
                input.value = ''; // 清空輸入欄位的值
                input.setAttribute('disabled', 'disabled');
                input.addEventListener('focus', showAlertAndDisable);
                
            });
            showAlertAndDisable();
        }
    }

    function showAlertAndDisable(event) {
        alert('貨到付款不需填寫信用卡資訊');
        event.target.value = ''; // 清空輸入欄位的值
        event.target.setAttribute('disabled', 'disabled');
    }


  paymentMethodRadios.forEach(radio => {
    radio.addEventListener('change', updateRequiredAttributes);
  });

  // Initialize the display based on the initial selection
  updateRequiredAttributes();

});


// 信用到期日設置為預設格式(MM/YY)
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


/* 處理支付頁面未填寫偵測事件 */
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