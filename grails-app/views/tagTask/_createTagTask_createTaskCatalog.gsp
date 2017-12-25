<div class="col-lg-8">
	<div class="row" ng-repeat="icatalog in catalogs">
		<div class="col-lg-12">
			<!-- /.panel -->
			<div class="panel panel-default">
				<div class="panel-heading">
					第&nbsp;&nbsp;<span class="badge"> {{ icatalog.level }}</span> &nbsp;&nbsp;级
					<div class="pull-right">
						<a ng-click="removeCatalogAction(icatalog)"
						   style="cursor:pointer;text-decoration:none;" ><span class="glyphicon glyphicon-remove"></span></a>&nbsp;
					</div>
				</div>
				<div class="panel-body">

					<!--- tag tasks 添加分类名称---->
					<div class="col-lg-6">
						<form class="form-horizontal" role="form">
							<div class="form-group">
								<label for="inputEmail333" class="col-sm-4 control-label">
									上级分类名
								</label>
								<div class="col-sm-8">
									<input

											style="border-color:#878787;
									border-style:solid;
									border-top-width:0px;
									border-right-width:0px;
									border-bottom-width:1px;
									border-left-width:0px"
										   type="text" class="form-control" id="inputEmail333"
										   placeholder="上级分类名" readonly value="3C数码"
									/>
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-4 control-label">
									分类标题
								</label>
								<div class="col-sm-8">
									<input
										   ng-model="taskCatalog.catalogTitle"
										   style="border-color:#878787;
									border-style:solid;
									border-top-width:0px;
									border-right-width:0px;
									border-bottom-width:1px;
									border-left-width:0px"
										   type="text" class="form-control" id="inputEmail3"
										   placeholder="3C数码产品归类"
									/>
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassworsd3" class="col-sm-4 control-label">
									有效投票
								</label>
								<div class="col-sm-8">
									<select
											ng-model="taskCatalog.votes"
											class="form-control" id="inputPassworsd3">
										<option>1</option>
										<option>2</option>
										<option>3</option>

									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassworsd333" class="col-sm-4 control-label">
									投票轮次
								</label>
								<div class="col-sm-8">
									<select ng-model="taskCatalog.times"
											class="form-control" id="inputPassworsd333">
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
									</select>
								</div>
							</div>


						</form>
					</div>

					<!--- end tag tasks 添加分类名称---->


					<!--- tag task catalog and catalog`s items ---->
					<!--- defualt 第一季分类 ---->
					<div class="col-lg-6">
						<div class="col-sm-12">
							{{secondGrade}}
							<div class="row" ng-repeat="sec in secondGrade">
							<div class="aa" id="mm" ng-if="sec.addcontent > 0">
								<p>上级分类名：
									<input type="text" style="..." class="form-control"  ng-model="taskCatalog.catalogTitle"
								readonly/>
								</p>
								<p> 分　 　类{{sec.addcontent}}：
									<input type="text" style="..." class="form-control" ng-model="sec.taskDate"/>
									<button type="submit" class="btn btn-default" ng-click="addSubClass(sec)">添加子类</button>
								</p>
							</div>


								<div class="form-group" ng-if="sec.addcontent == 0">
									<div class="col-sm-offset-6 col-sm-6">

										<button type="submit" class="btn btn-default" ng-click="saveTaskCatalog()">
											保存
										</button>
										<button type="submit" class="btn btn-default" ng-click="addTaskCatalog(sec)">
											添加
										</button>
									</div>
							</div>
						</div>

					</div>
					</div>
					<!--- end tag task catalog and catalog`s items ---->
					<!--- end tag task catalog and catalog`s items ---->

				</div>
				<!-- /.panel-body -->
			</div>

		</div>
	</div>
	<!---二级分类--->
	{{subCalss}}
	<div class="col-lg-6">
	<div class="col-sm-12">
	<div class="row" ng-repeat="subtest in subCalss">
	<div ng-if="subCalss.length > 0">

		<p>上级目录：<input type="text" style="..." class="form-control"  ng-model="subtest.taskDate" readonly/></p>
		<p>分 类1
			<input type="text" style="..." class="form-control"  ng-model="subtest.subItem1"/></p>
		<p>分 类2
			<input type="text" style="..." class="form-control"  ng-model="subtest.subItem2"/></p>
		<p>分 类3
			<input type="text" style="..." class="form-control"  ng-model="subtest.subItem3"/></p>
		<p>分 类4
			<input type="text" style="..." class="form-control"  ng-model="subtest.subItem4" readonly/></p>

	</div>

	</div>
	</div>
</div>

</div>