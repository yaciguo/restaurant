let products = [];
let categories = []; 
//jquery
$(document).ready(function () {
	//======================================抓分類
	
	  $.ajax({
        url: "/showCategories",
        type: "GET",
        dataType: "json",
        success: function(response) {
            categories = response; // 将返回的分类列表数据存储到数组中
            renderCategoryList(); // 调用渲染函数
            bindCategoryClickEvent(); // 绑定点击事件处理程序
            
        },
        error: function(xhr, status, error) {
            console.log("Error: " + error);
        }
    }); 

			    
			  
	function renderCategoryList() {		  
	  var categoryButtonsContainer = document.getElementById("categoryButtons");

	  // 遍历类别名称数组，为每个类别创建一个按钮
	  categories.forEach(function(category) {
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
	    $(".btsort").on("click", function() {
	        // 获取按钮的文本内容作为类别
	        var category = $(this).text();

	        // 根据标识符查找对应的 <tr> 元素
	         var targetRow = $("tr.categoryRow").filter(function() {
	        return $(this).find("td").text() === category;
	    	});

	        // 检查目标元素是否存在
	        if (targetRow.length > 0) {
	            // 执行滚动到目标元素的操作
	            $("html, body").animate({
	                scrollTop: targetRow.offset().top
	            }, 500);
	        }
	    });
	   }


	
	
	
	//================================================
    $("#cart").click(function () {
        // alert('按下了按鈕');
        $("body").addClass('active');
    })
    $(".closeShopping").click(function () {
        // alert('按下了按鈕');
        $("body").removeClass('active');
    })
    
    
//======================================================================================
    
    

//引入json=== 抓到/dishes2====================================================
var xhr = new XMLHttpRequest();
	xhr.open("GET", "/dishes2", true);	
	xhr.send()
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {	
			products = JSON.parse(xhr.responseText);
//			console.log(xhr.responseText);
//			console.log(products);
			
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
			
			
	        content += `
	        <tr class="tableRow ${categoryName}">
	            <td id="td1" style="width: 10%;"><img src="${obj.picture}" width="130px"> </td>
	            <td id="td2" style="width: 25%;">${obj.name}</td>
	            <td id="td3" style="width: 5%;">${obj.status}</td>
	            <td id="td5" style="width: 7%;">$ ${obj.price}</td>          
	            <td id="td4" style="width: 15%;">
	                <button class="add" onclick="addToCard(${index})">+</button>
	            </td>
	        <tr>      
	        `
    })
    $("#tableContainer").append(content)			
	}
	}
	
	
});
//===================================================
    //for each

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
