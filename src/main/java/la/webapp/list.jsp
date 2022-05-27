<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品一覧</title>
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
<jsp:include page="/menu.jsp" />

<h3>商品一覧</h3>

<c:forEach items="${items}" var="item">
    <form action="/shopping/CartServlet?action=add" method="post">
        <input type="hidden" name="item_code" value="${item.code}">
        商品番号：<b>${item.code}</b><br>
        商品名：<b>${item.name}</b><br>
        価格(税込)：<b><fmt:formatNumber value="${item.price}"/>円</b><br>
        個数：
        <select name="quantity">
        <option value="1">1
        <option value="2">2
        <option value="3">3
        <option value="4">4
        <option value="5">5
        </select>
        個<br>
        <input type="submit" value="カートに追加">
    </form>
</c:forEach>

</body>
</html>