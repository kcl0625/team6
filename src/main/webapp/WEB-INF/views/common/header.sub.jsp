<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value="/resources/css/default.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/accountbook_table.css"/>">

<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>가계부</title>
<style>
* {margin: 0; padding: 0; box-sizing: border-box;}
a:hover {text-decoration: none;}
ul, ol, li {list-style: none;}

#body {min-height: 100vh;padding-top: 80px;padding-bottom: 80px;}

@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}

:root {
	--font-size: 16px;
	--font-family: 'Pretendard-Regular';
	
	--color-default: #191919;
    --color-bak: #fff;
}

body {
	font: var(--font-size)/1.5em var(--font-family);
	color: var(--color-default);
	background-color: var(--color-bak);
}

header {
    position: fixed;
    top: 0;
    left: -230px;
    width: 200px;
    height: 100vh;
    background: var(--color-bak);
    box-shadow: 0 0 30px rgba(0,0,0,.2);
	transition: .3s ease;
	z-index: 99;
}
header.show {left: 0;}
header .open-menu {
	position: fixed;
	top: 1rem;
	left: 1rem;
	font-size: 1.5rem;
	color: inherit;
	cursor: pointer;
	line-height: 1;
}
header nav#gnb {margin-top: 8em;}
header nav#login-menu {margin-top: 4em;}
header nav ul li:hover {background: var(--light); font-weight: 900;}
header nav ul li a {color: inherit !important; display: block; height: 100%; padding: .5em 2em;}

#login-menu {
    position: fixed;
    top: 1rem;
    right: 1rem;
}
#login-menu ul {display: flex; gap: .8em;}
#login-menu ul li a {color: inherit;}
#login-menu ul li a:hover {font-weight: 900;}

/* basic ele */
.btn {
	display: block;
	border-radius: 10px;
}

/* form */
#form {max-width: 500px; width: 80vw; margin: 0 auto;}
.error {color: var(--red);}

.btn-submit {
	background: #184DA0;
	color: #fff;
}

/* modal */
.modal-body > * {max-width: 100% !important;}
</style>
</head>
<body>