$(function () {
    $(".content-left,.content-right").height($(window).height() - 130);
});
$(".accordion-inner").click(function () {
    $(".active").html($(this).find(".left-body").text());
});
$(window).resize(function () {
    $(".content-left,.content-right").height($(window).height() - 130);
});
//以下为导航控制跳转的js实现
$("#article").click(function(){
	$("#ifr").attr("src","article/all");
});
$("#category").click(function(){
	$("#ifr").attr("src","category/currentUser");
});
$("#user").click(function(){
	$("#ifr").attr("src","user/currentUser");
});
$("#home").click(function(){
	$("#ifr").attr("src","");
	//修改导航栏的文字信息
	$(".active").html("");
});



