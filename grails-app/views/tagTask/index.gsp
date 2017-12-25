
<!DOCTYPE html>
<html lang="cn">
<head>
	<meta name="layout" content="admin"/>
	<title>AI标记编排系统-任务管理</title>
</head>

<body>

<div class="row" ng-controller="tagTaskCtrl">
	<div class="col-lg-12">

		<h3 class="page-header">任务管理</h3>
	</div>
	<!-- /.col-lg-12 -->
	<div class="row">
		<div class="col-lg-8">
		<form role="form">

			<div class="form-group input-group">
				<input type="text" class="form-control" ng-model="searchValue">
				<span class="input-group-btn">
					<button class="btn btn-default" type="button" ng-click="findTagTaskByStr(searchValue)"><i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>
	</div>
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
				标注任务清单
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
						<thead>
						<tr>
							<th>id</th>
							<th>任务名称</th>
							<th>任务类别</th>
							<th>进度</th>
							<th>创建人</th>
							<th>创建日期</th>
							<th>更新日期</th>
							<th>操作</th>
						</tr>
						</thead>
						<tbody>

						<tr class="gradeA" ng-repeat="itagTask in items">
							<td>{{ itagTask.id }}</td>
							<td>{{ itagTask.title }}</td>
							<td>{{ itagTask.taskType }}</td>
							<td>{{ itagTask.taskProgress }}</td>
							<td>{{itagTask.createPerson}}</td>
							<td>{{itagTask.dateCreated}}</td>
							<td>{{itagTask.lastUpdated}}</td>
							<td class="center">
								<a ng-click="delTagTaskById(itagTask.id)">删除</a>
								<a ng-click="addTagTaskById(itagTask.id)">添加</a>
								<a ng-click="updateTagTaskById(itagTask.id)")>更改</a>
						</td>
						</tr>

						</tbody>
					</table>
				<!---分页---->
				<nav>
					<ul class="pagination">
						<li>
							<a ng-click="Previous()">
								<span>上一页</span>
							</a>
						</li>
						<li ng-repeat="page in pageList" ng-class="{active: isActivePage(page)}" >
							<a ng-click="selectPage(page)" >{{ page }}</a>
						</li>
						<li>
							<a ng-click="Next()">
								<span>下一页</span>
							</a>
						</li>
					</ul>
				</nav>

				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
</div>



</body>

</html>
