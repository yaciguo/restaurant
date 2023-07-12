let products = [];
//jquery
$(document).ready(function () {
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
			console.log(xhr.responseText);
			console.log(products);
			
		 let content = ''
		   products.forEach(function (obj, index) {
        content += `
        <tr class="tableRow">
            <td id="td1" style="width: 10%;"><img src="${obj.image}" width="130px"> </td>
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
