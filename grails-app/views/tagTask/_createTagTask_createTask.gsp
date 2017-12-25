<div class="col-lg-4">
	<div class="panel panel-default">
		<div class="panel-heading">
			创建分类流程（默认1步）
		</div>
		<!-- /.panel-heading -->
		<div class="panel-body">
			<div class="col-md-12">
				<form class="form-horizontal" role="form">

					<div class="form-group">
						<label for="inputEmail33" class="col-sm-4 control-label">
							名称
						</label>
						<div class="col-sm-8">
							<input
									ng-model="tagTask.taskName" required
									style="border-color:#878787;
							border-style:solid;
							border-top-width:0px;
							border-right-width:0px;
							border-bottom-width:1px;
							border-left-width:0px"
								   type="text" class="form-control" id="inputEmail33"
								   placeholder="手机分类"/>
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword33" class="col-sm-4 control-label">
							类别
						</label>
						<div class="col-sm-8">
							<select ng-model="tagTask.taskType"
									class="form-control" id="inputPassword33">
								<option>商品分类</option>
								<option>图片标注</option>
								<option>成人图片分类</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail323" class="col-sm-4 control-label">
							分类路径长度
						</label>
						<div class="col-sm-8">
							<input
									ng-model="tagTask.levels"
									style="border-color:#878787;
							border-style:solid;
							border-top-width:0px;
							border-right-width:0px;
							border-bottom-width:1px;
							border-left-width:0px"
								   type="text" class="form-control" id="inputEmail323"
								   placeholder="1" readonly value="1"/>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-6 col-sm-6">
							<button type="submit" class="btn btn-default" ng-click="saveTask()">
								保存
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- /.panel-body -->
	</div>
	<!-- /.panel -->
	<div class="panel panel-default">
		<div class="panel-heading">
			创建分类流程（默认1步）
		</div>
		<!-- /.panel-heading -->
		<div class="panel-body">
			<table class="table">
				<tr>
					<td>名称</td>
					<td>操作</td>
				</tr>
				<tr>
					<td>{{tagTaskInstance.taskName}}&nbsp;&nbsp;{{tagTaskInstance.taskType}}</td>
					<td>
						<a ng-click="delCurrentTagTask(tagTaskInstance.id)">删除</a>

					</td>
				</tr>
			</table>
		</div>
		<!-- /.panel-body -->
	</div>
</div>