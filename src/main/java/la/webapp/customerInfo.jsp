<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcom shopping!</title>

<link rel="stylesheet" href="mydesign">
<style>
body {
margin:0;
width:100vw;
height:100vh;
background-image:url("https://beiz.jp/images_P/purple/purple_00116.jpg");
background-size:100%;

<image src="https://thumb.ac-illust.com/c8/c869d84190794b5f9ba7ff029ef0d26f_t.jpeg">
}

</style>
</head>
<body>

<jsp:include page="/menu.jsp"/><br>
<h3>ご注文情報</h3>

<c:if test="${not empty cart.items}">
<table border="1">
<tr><td>商品番号</td><td>商品名</td><td>単価（税込み）</td>
<td>個数</td><td>小計</td></tr>

<c:forEach items="${cart.items}" var ="item">
<tr>
	<td align="center">${item.code}</td>
	<td align="center">${item.name}</td>
	<td align="right"><fmt:formatNumber value="${item.price}"/>円</td>
	<td align="right">${item.quantity}</td>
	<td align="right"><fmt:formatNumber value="${item.price * item.quantity}"/>円</td>
</tr>
</c:forEach>
<c:if test="${cart.total lt 10000}">
<tr><td align="right" colspan="6">
合計金額:<fmt:formatNumber value="${cart.total}"/>円
</td></tr>
</c:if>
<c:if test="${cart.total ge 10000}">
<tr><td align="right" colspan="6">
合計金額:<del><fmt:formatNumber value="${cart.total}"/></del>円
</td></tr>
<tr><td align="right" colspan="6">
割引：-<fmt:formatNumber value="${cart.total - (cart.total * 0.9)}"/>円
</td></tr>
<tr><td align="right" colspan="6">
割引後の合計金額:<fmt:formatNumber value="${cart.total * 0.9}"/>円
</td></tr>
</c:if>
</table>

<h3>お客様情報を入力してください</h3>

<form action="/shopping/OrderServlet?action=confirm" method="post">
	<table border="1">
		<tr>
		<td>お名前</td><td><input type="text" name="name"></td>
		</tr>
		<tr>
		<td>住所</td><td><input type="text" name="address"></td>
		</tr>
		<tr>
		<td>電話番号</td><td><input type="text" name="tel"></td>
		</tr>
		<tr>
		<td>e-mail</td><td><input type="text" name="email"></td>
		</tr>
	</table>
	<h3>お支払い方法を選択してください</h3>
<input checked type="radio" name="pay" value="card">クレジットカード
<input type="radio" name="pay" value="bank">銀行振り込み
<input type="radio" name="pay" value="cash">代引き

<br><br>

<input type="submit" value="確認画面へ">
</form>

</c:if>


</body>
</html>