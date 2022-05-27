<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

	<jsp:include page="/menu.jsp" /><br>
	<h3>現在のカートの中身</h3>

	<c:if test="${empty cart.items}">
現在、カートは空です。
</c:if>

	<c:if test="${not empty cart.items}">
		<table border="1">
			<tr>
				<td>商品番号</td>
				<td>商品名</td>
				<td>単価（税込）</td>
				<td>個数</td>
				<td>小計</td>
				<td>削除</td>
			</tr>

			<c:forEach items="${cart.items}" var="item">
				<tr>
					<td align="center">${item.code}</td>
					<td align="center">${item.name}</td>
					<td align="right"><fmt:formatNumber value="${item.price}" />円</td>
					<td align="right">${item.quantity}</td>
					<td align="right"><fmt:formatNumber
							value="${item.price * item.quantity}" />円</td>
					<td>
						<form action="/shopping/CartServlet?action=delete" method="post">
							<input type="hidden" name="item_code" value="${item.code}">
							<input type="submit" value="削除">
						</form>
					</td>
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

		<tr>
			<td align="right"><c:if test="${cart.total lt 10000}">
					<b><font color="red"> あと<fmt:formatNumber
							value="${10000 - cart.total}" />円で10%OFF
					</font></b>
				</c:if></td>
		</tr>
		<tr>
			<form action="/shopping/OrderServlet?action=input_customer"
				method="post">
				<input type="submit" value="注文する">
			</form>
	</c:if>

</body>
</html>