let products = [];
let categories = [];
//jquery
function initializeMenu(contextPath) {
    $(document).ready(function () {
        //==================================營業時間=====================
        $.ajax({
            url: contextPath + "/custIndex/getOpeningHoursForToday",
            type: "GET",
            dataType: "json",
            success: function (data) {
                var openingHours = data;
                var openingHoursDiv = $("#openingHoursDiv");

                if (openingHours.length > 0) {

                    for (var i = 0; i < openingHours.length; i++) {
                        var openingHour = openingHours[i];
                        var startTime = openingHour.startTime;
                        var endTime = openingHour.endTime;
                        var openingHourStr = startTime + ' - ' + endTime + " " + " " + " ";
                        var openingHourElement = $("<p>").text(openingHourStr);
                        openingHoursDiv.append(openingHourElement);
                    }
                } else {
                    var noOpeningHourElement = $("<p>").text("今日無營業");
                    openingHoursDiv.append(noOpeningHourElement);
                }
            },
            error: function () {
                console.log("error");
            }
        });

        //======================================資料庫抓分類============================	
        $.ajax({
            url: contextPath + '/custIndex/showCategories',
            type: "GET",
            dataType: "json",
            success: function (response) {
                categories = response; // 得到返回的分類
                renderCategoryList();
                bindCategoryClickEvent(); // click分類按鈕

            },
            error: function (xhr, status, error) {
                console.log("Error: " + error);
            }
        });



        function renderCategoryList() {
            var categoryButtonsContainer = document.getElementById("categoryButtons");

            // ===================將每個分類創一個按鈕=========================
            categories.forEach(function (category) {
                var box = document.createElement("div");
                box.classList.add("box");

                var button = document.createElement("button");
                button.classList.add("btsort");
                button.innerText = category;

                box.appendChild(button);
                categoryButtonsContainer.appendChild(box);
            });
        }

        function bindCategoryClickEvent() {
            $(".btsort").on("click", function () {
                // 获取按钮的文本内容作为类别
                var category = $(this).text();

                // 根据标识符查找对应的 <tr> 元素
                var targetRow = $("tr.categoryRow").filter(function () {
                    return $(this).find("td").text() === category;
                });

                // 检查目标元素是否存在
                if (targetRow.length > 0) {
                    // 执行滚动到目标元素的操作
                    $("html, body").animate({
                        scrollTop: targetRow.offset().top
                    }, 200);
                }
            });
        }



        //================================================
        $("#cart").click(function () {
            $("body").addClass('active');
        })
        $(".closeShopping").click(function () {
            $("body").removeClass('active');
        })


        //======================================================================================
        //引入json=== 抓到/dishes2====================================================
        var xhr = new XMLHttpRequest();
        xhr.open("GET", contextPath + "/custIndex/dishes2", true);
        xhr.send()
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                products = JSON.parse(xhr.responseText);
                let content = ''
                let currentCategory = '' //追蹤該類別
                products.forEach(function (obj, index) {

                    let categoryName = obj.categoryBean.name;
                    if (categoryName !== currentCategory) {
                        content += `
		        <tr class="categoryRow">
		            <td colspan="5">${categoryName}</td>
		        </tr>
		        `;
                        currentCategory = categoryName; // 更新当前类别
                    }
                    //"<c:url value='/images/cart.png' />"
                    //                    console.log(obj.picture)
                    let picurl = "/restaurant" + obj.picture
                    //                    let picurl =obj.picture
                    console.log(picurl)

                    content += `
	        <tr class="tableRow ${categoryName}"> 
	            <td id="td1" style="width: 15%;"><img src='${picurl}' style="width: 120px;"> </td>
	            <td id="td2" style="width: 15%;">${obj.name}</td>
	            <td id="td5" style="width: 30%;">${obj.description}</td>	            
	            <td id="td3" style="width: 5%;">$ ${obj.price}</td>	            
	            <td id="td4" style="width: 10%;">
	                <button class="add" onclick="addToCard(${index})">+</button>
	            </td>
	                      
	        <tr>      
	        `
                })
                $("#tableContainer").append(content)
            }
        }


    });
}
//===================================================
//add cart
// cart array
let cart = JSON.parse(localStorage.getItem("CART")) || [];
updateCart();



function addToCard(index) {
    if (cart.some((item) => item.id === index + 1)) {
        changeNumberOfUnits("plus", index + 1)
    } else {
        let item = products.find((obj) => obj.id === index + 1);
        cart.push({
            ...item,
            numberOfUnits: 1,
        });
    }

    updateCart();

}
// update cart
function updateCart() {
    renderCartItems();
    renderSubtotal();

    // save cart to local storage
    localStorage.setItem("CART", JSON.stringify(cart));

}

function renderSubtotal() {
    let totalPrice = 0,
        totalItems = 0;
    cart.forEach((item) => {
        totalPrice += item.price * item.numberOfUnits;
        totalItems += item.numberOfUnits;
    });

    $(".total").html(totalPrice)
    $(".quantity").html(totalItems)
}

function renderCartItems() {
    $(".inCard").html("")
    let content = ""
    cart.forEach((item) => {
        content += `
            <tr class="cart-item" style="color:white">
                <td class="item-info" >
                    <button style="display: inline-block;" class="btn delete" onclick="removeItemFromCart(${item.id})">x</button>
                    <h4 style="display: inline-block;">${item.name}</h4>
                </td>
                <td class="unit-price">
                    <small>$</small>${item.price}
                </td>
                <td class="units">
                    <button class="btn minus" onclick="changeNumberOfUnits('minus', ${item.id})">-</button>
                    <div class="number">${item.numberOfUnits}</div>
                    <button class="btn plus" onclick="changeNumberOfUnits('plus', ${item.id})">+</button>
                    
                               
                </td>
            </tr>
        
         `
    })
    $(".inCard").append(content)

    //印cart
    console.log(cart)


}

function removeItemFromCart(id) {
    cart = cart.filter((item) => item.id !== id);

    updateCart();
}

function changeNumberOfUnits(action, id) {
    cart = cart.map((item) => {
        let numberOfUnits = item.numberOfUnits
        if (item.id == id) {
            if (action == "minus" && numberOfUnits > 1) {
                numberOfUnits--

            } else if (action == "plus") {
                numberOfUnits++
            }
        }

        return {
            ...item,
            numberOfUnits: numberOfUnits

        };

    })
    updateCart();

}
