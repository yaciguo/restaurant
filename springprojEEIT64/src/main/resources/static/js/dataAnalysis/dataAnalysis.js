// var contextPath = "<%=request.getContextPath()%>";
var startdate_input;
var enddate_input;

function setDatepicker(element) {
	var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
	var options = {
		format: 'yyyy-mm-dd',
		container: container,
		todayHighlight: true,
		autoclose: true,
		orientation: 'top'
	};
	element.datepicker(options);
}

function setStyleBtnHeight() {
	let btnHeight;
	let divHeight;
	$("img.data-style-btn").each((idx, el) => {
		$(el).height($(el).width())
		btnHeight = $(el).height()
	})
	// divHeight = $("#data-style-div").height()
	// console.log(btnHeight, divHeight)
	// $("#data-style-div").height(btnHeight)
	// console.log(divHeight * 2 - btnHeight)
}

function quickDateBtn() {
	console.log(123)
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
                    <div data-id = "${targetList[i].id}" class="p-1 border bg-light d-flex justify-content-center align-items-center">
                        <label>${targetList[i].name}</label>
                    </div>
                </div>`;
		$("#target-items-div").append(content);
	}
}

async function setTargerModal(){

	function setTargerModalItemsDiv(data, type) {
		console.log(data)
		const TYPE_ID = type + data.id;
		$("#modal-dialog-body-div").append(`
		<div id="target-modal-${TYPE_ID}">
			<div class="row mb-1">
				<button id="target-modal-${TYPE_ID}-btn" type="button" class="col col-md-3 btn btn-primary">${data.name}</button>
			</div>
			<div id="target-modal-${TYPE_ID}-items" class="row mb-3">
			</div>
		</div>`)
		data.items.forEach((item, idx) => {
			$(`#target-modal-${TYPE_ID}-items`).append(`
			<div class="col-md-3 form-check">
				<input class="form-check-input ${TYPE_ID}-class" type="checkbox"
				data-id="${item.id}"
				id="input-${TYPE_ID}-${item.id}">
				<label class="form-check-label" for="input-${TYPE_ID}-${item.id}">${item.name}</label>
			</div>`)
		});

		$(`#target-modal-${TYPE_ID}-btn`).click(() => {
			let isChecked = true;
			$(`input.${TYPE_ID}-class`).each((idx, el) => {
                if ($(el).prop("checked") == true) {
                    isChecked = false;
                }
            })
			$(`input.${TYPE_ID}-class`).each((idx, el) => {
				$(el).prop("checked", isChecked);
            })
			isChecked = true;
		})
	}

	
	$("#modal-dialog-body-div").empty();
	let category = await $.ajax({
		type: "get",
		url: contextPath+"/dataAnalysis.api/getCategory",
		contentType: "application/json",
		beforeSend: function (xhr) {
			xhr.setRequestHeader(header, token);
		}
	})
	category.data.forEach((data) => {
		setTargerModalItemsDiv(data, "allCategory");
	})
	let categoryAndDish = await $.ajax({
		type: "get",
		url: contextPath+"/dataAnalysis.api/getCategoryAndDish",
		contentType: "application/json",
		beforeSend: function (xhr) {
			xhr.setRequestHeader(header, token);
		}
	})
	categoryAndDish.data.forEach((data) => {
		setTargerModalItemsDiv(data, "category");
	})

}

function getModalTargetCheckedIds(){
	let result = [];
	$("#modal-dialog-body-div").children().find("input").each((idx, el)=>{
		let id = $(el).attr("id");
		if($(`#${id}`).prop("checked") == true){
			let obj = {
				"id" : $(el).attr("data-id"),
				"name" : $(`label[for="${id}"]`).html()
			};
			result.push(obj);	
		}
	})
	return result;
}


$(() => {
	startdate_input = $('input[name="startdate"]');
	setDatepicker(startdate_input)
	enddate_input = $('input[name="enddate"]');
	setDatepicker(enddate_input)
	startdate_input = $('input[name="output-startdate"]');
	setDatepicker(startdate_input)
	enddate_input = $('input[name="output-enddate"]');
	setDatepicker(enddate_input)
	setStyleBtnHeight()
	quickDateBtn()
	setTargerModal();

	$("#modal-target-sure-btn").click(() => {
		let targetList = getModalTargetCheckedIds();
		setTargerItemsDiv(targetList);
	})
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