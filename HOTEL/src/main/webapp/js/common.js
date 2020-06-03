function gfn_isNull(str) {
	if(str == null) return true;
	if(str == "Nan") return true;
	if(new String(str).valueOf() == "undefined") return true;
	var chkStr = new String(str);
	if(chkStr.valueOf()=="undefined") return true;
	if(chkStr == null) return true;
	if(chkStr.toString().length == 0) return true;
	
	return false;
}

function ComSubmit(opt_formId) {
	this.formId = gfn_isNull(opt_formId) == true? "commonForm" : opt_formId;
	
	this.url = "";
	
	if(this.formId=="commonForm") {
		$("#commonForm")[0].reset(); //이러면 첫번째 파일만 다운로드 됨
		//$("#commonForm").empty();로 변경
	}
	this.setUrl = function setUrl(url) {
		this.url = url;
	}
	
	this.addParam = function addParam(key, value) {
		$("#"+this.formId).append($("<input type='hidden' name='"+key+"' id='"+key+"' value='"+value+"'>"));
	}
	
	this.submit = function submit() {
		var frm = $("#"+this.formId)[0];
		frm.action = this.url;
		frm.method = "post";
		frm.submit();
	}
} 

//ajax
//ComAjax() 함수 추가, ajax사용시, 화면전환이 눈에 보이지 않으므로 부드럽게 화면 전환 가능
//addParam: get방식으로 날림
var gfv_ajaxCallBack="";
function ComAjax(opt_formId) {
	this.url="";
	this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
	this.param="";
	
	if(this.param =="commonForm") {
		var frm=$("#comonForm");
		if(frm.length>0) {
			frm.remove();
		}
		var str = "<form id='commonForm' name='commonForm'></form>";
		$('body').append(str);
	}
	
	this.setUrl = function setUrl(url) {
		this.url = url;
	}
	
	//setCallback 함수 : ajax를 이용하여 데이터를 전송한 후 콜백함수의 이름을 지정하는 함수
	this.setCallback = function setCallback(callBack) {
		fv_ajaxCallback = callBack;
	}
	
	this.addParam = function addParam(key,value) {
		this.param = this.param_+"&" +key+"="+value;
	}
	this.ajax = function ajax() {
		if(this.formId != "commonForm") {
			this.param +="&" + $("#" +this.formId).serialize();
		}
		$.ajax({
			url : this.url,
			type : "POST",
			data : this.param,
			async : false,
			success : function(data, status) {
				if(typeof(fv_ajaxCallback) == "function") {
					fv_ajaxCallback(data);
				}
				else {
					eval(fv_ajaxCallback+"(data);");
				}
			}
		});	
	};
}

//페이징 태그
var gfv_pageIndex = null;
var gfv_eventName = null;
function gfn_renderPaging(params) {
	var divId = params.divId;
	gfv_pageIndex = params.pageIndex;
	var totalCount = params.totalCount;
	var currentIndex = $("#"+params.pageIndex).val();
	if($("#"+params.pageIndex).length == 0 || gfn_isNull(currentIndex) == true) {
		currentIndex = 1;
	}
	
	var recordCount = params.recordCount;
	if(gfn_isNull(readCount)==true) {
		recordCount = 20;
	}
	var totalIndexCount = Math.ceil(totalCount/recordCount);
	gfv_eventName = params.eventName;
	
	$("#"+divId).empty();
	var preStr = "";
	var postStr = "";
	var str = "";
	
	var first = (parseInt((currentIndex-1)/10) *10)+1;
	var last = (parseInt(totalIndexCount/10) == parseInt(currentIndex/10)) ? totalIndexCount%10 : 10;
	var prev = (parseInt((currentIndedx-1)/10)*10)-9 > 0 ? (parseInt((currentIndex-1)/10)*10)-9 : 1;
	var next = (parseInt((currentIndex-1)/10)+1)*10+1<totalIndexCoount ? (parseInt((currentIndex-1)/10)+1)*10+1 : totalIndexCount;
	if(totalIndexCount>10) {
		preStr +="<a href='#this' class='pad_5' onclick='_movePage(1)'>[<<]</a>"
			+"<a href='#this' class='pad_5' onclick='_nmovePage("+prev+")'>[<]</a>"
	}
	else if(totalIndexCount <=10 && totalIndexCount>1) {
		preStr +="<a href='#this' class='pad_5' onclick='_movePage("+prev+")'>[<<]</a>"
	}
	
	if(toalIndexCount < 10) {
		postStr +="<a href='#this' class='pad_5' onclick='_movePage("+totalIndexCount+")'>[>>]</a>";
		
	}
	
	for(var i=first; i<(first+last); i++) {
		if(i != currentIndex) {
			str +="<a href='#this' class='pad_5' onclick='_movePage'("+i+")>"+i+"</a>"
		}
		else {
			str +="<b><a href='#this' class='pad_5' onclick='_movePage("+i+")'>"+i+"</a></b>"
		}
	}
	$("#"+divId).append(preStr+str+postStr);
	
}

function fn_movePage(value) {
	$("#"+gfv_pageIndex).val(value);
	if(typeof(gfv_eventName)=="function"){
		gfv_eventName(value);
	}
	else {
		eval(gfv_eventName+"(value);");
	}
}

