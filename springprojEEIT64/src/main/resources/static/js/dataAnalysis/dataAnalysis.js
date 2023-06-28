// var contextPath = "<%=request.getContextPath()%>";
var startdate_input;
var enddate_input;

function setDatepicker(element) {
	var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
	var options = {
		format: 'yyyy-mm-dd',
		// container: container,
		todayHighlight: true,
		autoclose: true,
		orientation: 'top'
	};
	element.datepicker(options);
}

function setStyleBtnHeight() {
	let btnHeight;
	let divHeight;
	$("button.data-style-btn").each((idx, el) => {
		$(el).height($(el).width())
		btnHeight = $(el).height()
	})
	divHeight = $("#data-style-div").height()
	console.log(btnHeight, divHeight)
	$("#data-style-div").height(btnHeight)
	console.log(divHeight * 2 - btnHeight)
}

function quickDateBtn() {
	let nowDate = new Date(Date.now())
	let thisYear = nowDate.getFullYear()
	let thisMonth = nowDate.getMonth() + 1
	let thisDayOfMonth = new Date(thisYear, thisMonth, 0).getDate();
	let thisDate = nowDate.getDate()
	let thisDay = nowDate.getDay()
	$("#this-year-btn").click(() => {
		startdate_input.datepicker('update', `${thisYear}-01-01`);
		enddate_input.datepicker('update', `${thisYear}-12-31`);
	})
	$("#this-month-btn").click(() => {
		startdate_input.datepicker('update', `${thisYear}-${thisMonth}-01`);
		enddate_input.datepicker('update', `${thisYear}-${thisMonth}-${thisDayOfMonth}`);
	})
	$("#this-week-btn").click(() => {
		let startdate = nowDate - (thisDay * 86400000);
		let enddate = nowDate - 0 + ((6 - thisDay) * 86400000);
		startdate = new Date(startdate);
		enddate = new Date(enddate);
		startdate = `${startdate.getFullYear()}-${startdate.getMonth() + 1}-${startdate.getDate()}`;
		enddate = `${enddate.getFullYear()}-${enddate.getMonth() + 1}-${enddate.getDate()}`;
		startdate_input.datepicker('update', startdate);
		enddate_input.datepicker('update', enddate);
	})
	$("#this-day-btn").click(() => {
		startdate_input.datepicker('update', `${thisYear}-${thisMonth}-${thisDate}`);
		enddate_input.datepicker('update', `${thisYear}-${thisMonth}-${thisDate}`);
	})
}

function setTargerItemsDiv(targetList) {
	$("#target-items-div").empty();
	for (let i = 0; i < targetList.length; i++) {
		let content = `
                <div class="col-3">
                    <div class="p-1 border bg-light d-flex justify-content-center align-items-center">
                        <label>${targetList[i]}</label>
                    </div>
                </div>`;
		$("#target-items-div").append(content);
	}
}

async function setTargerModal(){
	CategoryAndDish = await $.ajax({
		type: "get",
		url: contextPath+"/dataAnalysis.api/CategoryAndDish"
	})

	function setTargerModalItemsDiv(items, groupName, labelName) {
		const modalItems = "target-modal-items"

		$("#modal-dialog-body-div").append(`
		<div id="target-modal-${groupName}">
			<div class="row mb-1">
				<button id="target-modal-${groupName}-btn" type="button" class="col col-md-3 btn btn-primary">${labelName}</button>
			</div>
			<div id="target-modal-${groupName}-items" class="row mb-3">
			</div>
		</div>`)

		Object.keys(items).forEach((key, idx) => {
			console.log(key, items[key])
			$(`#target-modal-${groupName}-items`).append(`
			<div class="col-md-3 form-check">
				<input class="form-check-input ${modalItems} ${groupName}" type="checkbox" id="input-${groupName}-${key}"
					value="${groupName}-${key}">
				<label class="form-check-label" for="input-${groupName}-${key}">${items[key]}</label>
			</div>`)
		});

		$(`#target-modal-${groupName}-btn`).click(() => {
			let isChecked = true;
			$(`input.${groupName}`).each((idx, el) => {
                if ($(el).prop("checked") == true) {
                    isChecked = false;
                }
            })
			$(`input.${groupName}`).each((idx, el) => {
				$(el).prop("checked", isChecked);
			})
		})
	}

	
	$("div#modal-dialog-body-div").empty();

	setTargerModalItemsDiv(CategoryAndDish[0], "category", "種類");


	// CategoryAndDish[0].forEach((category, idx) => {
	// 	$("#target-modal-category-items").append(`
	// 	<div class="col-md-3 form-check">
	// 		<input class="form-check-input" type="checkbox" id="input-c-${idx}"
	// 			value="${category}">
	// 		<label class="form-check-label" for="input-c-${idx}">${category}</label>
	// 	</div>`)

	// 	$("#target-modal-dish").append(`
	// 	<div id="target-modal-category-label" class="row mb-1">
	// 		<button id="target-modal-category-btn" type="button" class="col col-md-3 btn btn-primary">${category}</button>
	// 	</div>
	// 	<div id="target-modal-category-items" class="row mb-3">
	// 	</div>`);
		
	// 	CategoryAndDish[1][category].forEach((dish, idx) => {
			
	// 		$("#target-modal-dish").append(`
	// 		<div class="col-md-3 form-check">
	// 			<input class="form-check-input" type="checkbox" id="input-d-${idx}"
	// 				value="${dish}">
	// 			<label class="form-check-label" for="input-d-${idx}">${dish}</label>
	// 		</div>`);
	// 	})

	// })

}


$(() => {
	startdate_input = $('input[name="startdate"]');
	setDatepicker(startdate_input)
	enddate_input = $('input[name="enddate"]');
	setDatepicker(enddate_input)
	setStyleBtnHeight()
	quickDateBtn()

	fake_targetList = [
		"項目A",
		"項目B",
		"項目C",
		"項目D",
		"項目F",
		"項目G",
		"項目H"
	]
	setTargerItemsDiv(fake_targetList)
	setTargerModal();


	// bar-chart-btn line-chart-btn pie-chart-btn
	Chart.defaults.font.size = 30;
	const ctx = document.getElementById('myChart');
	$('#myChart').css('width', '100%');
	new Chart(ctx, {
		type: 'bar',
		data: {
			labels: ['項目A', '項目B', '項目C', '項目D', '項目E', '項目F'],
			datasets: [{
				label: '銷售數量',
				data: [12, 19, 3, 5, 2, 3],
				borderWidth: 1
			}]
		},
		options: {
			scales: {
				y: {
					max: 20,
					min: 2,
					ticks: {
						stepSize: 0.5
					},

					responsive: true,
					maintainAspectRatio: false,
					aspectRatio: true
					// beginAtZero: true
				}
			}
		}
	});

	$(window).resize(() => {
		setStyleBtnHeight()
		$('#myChart').css('width', '100%');
		$('#myChart').css('height', '100%');
	})
})