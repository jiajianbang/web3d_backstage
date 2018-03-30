
<!DOCTYPE html>
<html lang="cn">
<head>
	<meta name="layout" content="admin"/>
	<title>青海非物质文化遗产-管理系统</title>
</head>

<body>

<div class="row" ng-controller="tangkaReturalCtrl">
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
							<th>md5加密值</th>
							<th>图像URL</th>
							<th>图像标签</th>
							<th>图片名字</th>
							<th>创建日期</th>
							<th>操作</th>
						</tr>
						</thead>
						<tbody>

						<tr class="gradeA" ng-repeat="itagTask in items">
							<td>{{ itagTask.id }}</td>
							<td>{{ itagTask.image_md }}</td>
							<td>{{ itagTask.image_url }}</td>
							<td>{{ itagTask.image_label }}</td>
							<td>{{itagTask.image_name}}</td>
							<td>{{itagTask.dateCreatedTr}}</td>
							<td class="center">
								<a ng-click="delTagTaskById(itagTask.id)">删除</a>
								<a ng-click="addTagTaskById(itagTask.id)">添加</a>
								<a ng-click="updateTangkaById(itagTask.id,itagTask.image_url,itagTask.image_name)")>更改</a>
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
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						唐卡更改
					</h4>
				</div>
				<div class="modal-body">
					<label hidden="hidden" ng-model="id_value"></label>
					图片URL：<input class="form-control" ng-model="image_url">
					图片名称：<input class="form-control" ng-model="image_name">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-primary" ng-click="updateTangka()">
						提交更改
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
</div>

	<div class="modal fade" id="myModalDel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel1">
						唐卡删除
					</h4>
				</div>
				<div class="modal-body">
					<label hidden="hidden" ng-model="del_id"></label>
					您确定要删除该条数据吗？
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-primary" ng-click="deleteTangka()">
						确定
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>

</div>


</body>

</html>
