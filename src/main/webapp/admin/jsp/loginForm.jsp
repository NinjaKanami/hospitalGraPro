<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>title</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<link href="${ctx}/js/metronic/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${ctx}/js/metronic/plugins/bootstrap/css/bootstrap-responsive.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${ctx}/js/metronic/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link href="${ctx}/js/metronic/css/style-metro.css" rel="stylesheet"
	type="text/css" />
<link href="${ctx}/js/metronic/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="${ctx}/js/metronic/css/style-responsive.css"
	rel="stylesheet" type="text/css" />
<link href="${ctx}/js/metronic/css/themes/default.css" rel="stylesheet"
	type="text/css" id="style_color" />
<link href="${ctx}/js/metronic/plugins/uniform/css/uniform.default.css"
	rel="stylesheet" type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link href="${ctx}/js/metronic/css/pages/lock.css" rel="stylesheet"
	type="text/css" />
<!-- END PAGE LEVEL STYLES -->
<link rel="shortcut icon" href="favicon.ico" />
<script type="text/javascript" src="${ctx }/js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="${ctx }/js/jquery-migrate-1.2.1.js"></script>
<link href="${ctx }/js/ligerUI/skins/Aqua/css/ligerui-all.css"
	rel="stylesheet" type="text/css" />
<script src="${ctx }/js/ligerUI/js/core/base.js" type="text/javascript"></script>
<script src="${ctx }/js/ligerUI/js/plugins/ligerDialog.js"
	type="text/javascript"></script>
<script src="${ctx }/js/ligerUI/js/plugins/ligerDrag.js"
	type="text/javascript"></script>
<script src="${ctx }/js/ligerUI/js/plugins/ligerResizable.js"
	type="text/javascript"></script>
<script type="text/javascript">
   
   $(function(){
	    /** ??????????????? */
	   $(document).keydown(function(event){
		   if(event.keyCode == 13){
			   $("#login-submit-btn").trigger("click");
		   }
	   })

	   /** ?????????????????????????????????  */
	   $("#login-submit-btn").on("click",function(){
		   /** ?????????????????? ctrl+K */
		   var loginname = $("#loginname").val();
		   var password = $("#password").val();
		   
		   var msg = "";
		   
		   if(!/^\w{4,20}$/.test(loginname)){
			     msg = "????????????????????????6~20??????";
		   }else if(!/^\w{4,20}$/.test(password)){
			     msg = "?????????????????????6~20??????";
		   }
		   if(msg !=""){
			   $.ligerDialog.error(msg);
			   return;
		   }
		   /** ???????????? */
		   $("#loginForm").submit();
		   
	   })
	   
   })
 


</script>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body style="font-family: ????????????">
	<div class="page-lock">
		<div class="page-logo" style="margin-bottom: 2px">
			<a class="brand" href="login.html"
				style="font-size: 22px; color: #FFF;"> ????????????<font color="#FFCC00">Hrm</font><span
				style="font-size: 13px;">1.0</span> ??????
			</a>
		</div>
		<form action="login" method="post" id="loginForm">
			<div class="page-body">
				<img class="page-lock-img"
					src="${ctx}/js/metronic/img/profile/logo2.jpg" alt="">
				<div class="page-lock-info">
					<span>&nbsp;</span>
					<c:choose>
						<c:when test="${requestScope.message == null }">
							<span style="padding-top: 5px">???????????????????????????</span>
						</c:when>
						<c:otherwise>
							<span style="padding-top: 5px"><font color="red">${requestScope.message}</font></span>
						</c:otherwise>
					</c:choose>

					<div class="control-group">

						<div class="controls">
							<div class="input-icon left">
								<i class="icon-user"></i> <input
									class="m-wrap placeholder-no-fix" type="text" placeholder="??????"
									id="loginname" name="loginname" value="${loginname}">
							</div>
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<div class="input-icon left">
								<i class="icon-lock"></i> <input
									class="m-wrap placeholder-no-fix" type="password"
									placeholder="??????" id="password" name="password"
									value="${password}">
							</div>
						</div>
					</div>
				</div>
				<div class="relogin">
					<!-- ???????????? -->
					<button type="submit" id="login-submit-btn" class="btn green"
						style="margin-left: 20px">
						?????? <i class="m-icon-swapright m-icon-white"></i>
					</button>
				</div>
			</div>
			<div class="page-footer" style="color: #fff">
				???????????????IE8+??????????????????1280*800. <br>2015 @ ???????????? http://www.fkit.org
			</div>
		</form>
	</div>

	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
	<!-- BEGIN CORE PLUGINS -->

	<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
	<script
		src="${ctx}/js/metronic/plugins/jquery-ui/jquery-ui-1.10.1.custom.min.js"
		type="text/javascript"></script>
	<script src="${ctx}/js/metronic/plugins/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<!--[if lt IE 9]>
   <script src="${ctx}/js/metronic/plugins/excanvas.js"></script>
   <script src="${ctx}/js/metronic/plugins/respond.js"></script>  
   <![endif]-->
	<script src="${ctx}/js/metronic/plugins/breakpoints/breakpoints.js"
		type="text/javascript"></script>
	<!-- IMPORTANT! jquery.slimscroll.min.js depends on jquery-ui-1.10.1.custom.min.js -->
	<script src="${ctx}/js/metronic/plugins/uniform/jquery.uniform.min.js"
		type="text/javascript"></script>
	<!-- END CORE PLUGINS -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script
		src="${ctx}/js/metronic/plugins/backstretch/jquery.backstretch.min.js"
		type="text/javascript"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<script src="${ctx}/js/metronic/scripts/app.js"></script>
	<script src="${ctx}/js/metronic/scripts/lock.js"></script>
	<script>
		$(function() {
			App.init();
			Lock.init();
		});
	</script>
	<!-- END JAVASCRIPTS -->
	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-37564768-1' ]);
		_gaq.push([ '_setDomainName', 'keenthemes.com' ]);
		_gaq.push([ '_setAllowLinker', true ]);
		_gaq.push([ '_trackPageview' ]);
		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://'
					: 'http://')
					+ 'stats.g.doubleclick.net/dc.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</script>
</body>
<!-- END BODY -->
</html>