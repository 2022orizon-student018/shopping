<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome shopping!</title>
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
<marquee direction="left"><h1>ご注文ありがとうございました。</h1></marquee>
お客様の注文番号は
<h3><font color="blue">${orderNumber}</font></h3>
になります。
</body>
</html>