<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>医院预约挂号后台管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="${ctx}/fkjava.ico" rel="shortcut icon" type="image/x-icon" />
<link href="${ctx}/css/css.css" type="text/css" rel="stylesheet" />
<!-- 导入layui -->
<link rel="stylesheet" type="text/css" href="${ctx}/css/layui/css/layui.css">
<script type="text/javascript" src="${ctx}/css/layui/layui.js"></script>
</head>
<frameset rows="80,*" cols="*" frameborder="no" border="0"
	framespacing="0">
	<frame src="top.jsp" name="title" scrolling="no" noresize="noresize">
	<frameset cols="220,*" frameborder="no" border="0" framespacing="0">
		<frame src="left.jsp" name="tree" scrolling="no" marginheight="0"
			marginwidth="0">
		<frame src="right.jsp" name="main" scrolling="yes" frameborder="0"
			marginwidth="0" marginheight="0" noresize="noresize">
	</frameset>
</frameset>
<body>
</body>
</html>