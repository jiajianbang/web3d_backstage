<!DOCTYPE html>
<html lang="cn">

<head>
	<meta name="layout" content="admin"/>
	<title>AI标记编排系统-v1.0</title>

</head>

<body>

<div class="row">
	<div class="col-lg-12">
		<h3 class="page-header">编排任务流程</h3>

	</div>
	<!-- /.col-lg-12 -->
</div>

<!-- /.row -->
<div class="row" ng-controller="crtTagTaskProgressCtrl">


	<g:render template="createTagTask_createTask"/>

	<!-- /.col-lg-12 -->
	<g:render template="createTagTask_createTaskCatalog"/>

	<!-- /.col-lg-3 -->


	<!-- /.col-lg-3 -->
</div>


</body>

</html>
