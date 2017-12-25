<!DOCTYPE html>
<html lang="cn">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">

	<title><g:layoutTitle default="标记任务编排系统-v0.1" /></title>
	<!-- Bootstrap Core CSS -->
	<link href="${request.contextPath}/admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<!-- MetisMenu CSS -->
	<link href="${request.contextPath}/admin/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

	<!-- Custom CSS -->
	<link href="${request.contextPath}/admin/dist/css/sb-admin-2.css" rel="stylesheet">

	<!-- Morris Charts CSS -->
	<link href="${request.contextPath}/admin/vendor/morrisjs/morris.css" rel="stylesheet">

	<!-- Custom Fonts -->
	<link href="${request.contextPath}/admin/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	%{--<!--[if lt IE 9]>--}%
        %{--<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>--}%
        %{--<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>--}%
    %{--<![endif]-->--}%

	<script type="text/javascript">
		window.appModels = new Array();
		window.utf8_headers = {'Content-Type' : 'application/x-www-form-urlencoded; charset=UTF-8'}
		var WEBROOT = '${request.contextPath}';
</script>
	<g:layoutHead/>
</head>

<body>

<div id="wrapper">

	<!-- Navigation -->
	<g:render template="/layouts/adminMenu"/>

	<div id="page-wrapper">
		<!--------->
		<!--------->
		<!----layoutBody----->
		<!--------->
		<!--------->

	<g:layoutBody/>
		<!-- /.row -->
	</div>
	<!-- /#page-wrapper -->

</div>

<!-- jQuery -->
<script src="${request.contextPath}/admin/vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="${request.contextPath}/admin/vendor/bootstrap/js/bootstrap.min.js"></script>
<!-- angular JavaScript -->
<script src="${request.contextPath}/admin/vendor/angular-1.2.15/angular.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="${request.contextPath}/admin/vendor/metisMenu/metisMenu.min.js"></script>
<!-- Morris Charts JavaScript -->
<script src="${request.contextPath}/admin/vendor/raphael/raphael.min.js"></script>
<script src="${request.contextPath}/admin/vendor/morrisjs/morris.min.js"></script>
<script src="${request.contextPath}/admin/data/morris-data.js"></script>
<!-- Custom Theme JavaScript -->
<script src="${request.contextPath}/admin/dist/js/sb-admin-2.js"></script>


<!-- 动态加载js -->
<g:set var="_web_load_angularjs" value="${1}" />
<g:if test="${controllerName && actionName}">
	<g:if test="${ _web_load_angularjs }">
		%{--<g:render template="/${controllerName}/${actionName}_js"/>--}%
		<script src="${request.contextPath}/js/${controllerName}/${actionName}.js" type="text/javascript"></script>
	</g:if>
</g:if>
<!-- index js -->
<g:if test="${ !(controllerName && actionName)}">
	%{--<g:render template="/index_js"/>--}%
	<script src="${request.contextPath}/js/index/index.js"></script>
</g:if>
<!--- angurlarjs app bootstrap ---->
<script src="${request.contextPath}/js/common/angularApp.js"></script>
</body>

</html>
