<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome shopping</title>
</head>
<body>

<jsp:include page="/menu.jsp" /><br>
<h3>下記の内容で注文を行いますか？</h3>
<h3>ご注文情報</h3>

<c:if test="${not empty cart.items}">
<table border="1">
<tr><td>商品番号</td><td>商品名</td><td>単価（税込）</td>
	<td>個数</td><td>小計</td></tr>
	
<c:forEach items="${cart.items}" var="item">
<tr>
	<td align="center">${item.code}</td>
	<td align="center">${item.name}</td>
	<td align="right"><fmt:formatNumber value="${item.price}"/></td>
	<td align="right">${item.quantity}</td>
	<td align="right"><fmt:formatNumber value="${item.price * item.quantity}"/>円</td>
</tr>
</c:forEach>
<tr><td align="right" colspan="6">
<c:if test="${cart.total lt 10000}">
総計:<fmt:formatNumber value="${cart.total}"/>円
</c:if>
<c:if test="${cart.total ge 10000}">
割引後の総計:<fmt:formatNumber value="${cart.total * 0.9}"/>円
</c:if>
</td></tr>
</table>

<h3>お客様情報</h3>
<form action="/shopping/OrderServlet?action=order" method="post">
	<table border="1">
	<tr>
	<td>お名前</td><td>${customer.name}</td>
	</tr>
	<tr>
	<td>住所</td><td>${customer.address}</td>
	</tr>
	<tr>
	<td>電話番号</td><td>${customer.tel}</td>
	</tr>
	<tr>
	<td>e-mail</td><td>${customer.email}</td>
	</tr>
	</table><br>
	<input type="submit" value="この内容で注文">
</form>
</c:if>
</body>
</html>