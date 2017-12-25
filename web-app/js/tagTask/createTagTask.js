/**
 * tagtaskmodel
 * @type {string}
 */
var appid = "crtTagTaskProgressCtrlModel"
window.appModels.push(appid)
//
var app = angular.module(appid, []);
app.controller('crtTagTaskProgressCtrl', function($scope,$http) {

    $scope.task = { };
    $scope.catalogs = [{level:0}];
    $scope.tagTask = [];
    $scope.taskCatalog = [];
    $scope.secondGrade =[{addcontent:0, taskDate:""}];
    $scope.subCalss = [];
    $scope.subTasks = [{level:0}];
    /**
     * addCatalogACtion
     * @param catalog
     * @param catalogItem
     */
    $scope.addCatalogAction = function (catalog,catalogItem) {
        $scope.catalogs.push({level:catalog.level+1});

    }

    //添加一级分类
    $scope.addTaskCatalog = function (src) {
        var test = $scope.secondGrade.length;
        $scope.secondGrade.push({addcontent:test, taskDate:""});
    }

    //添加二级分类
    $scope.addSubClass = function (sec) {
            var test = $scope.subCalss.length;
            $scope.subCalss.push({subClssId:test,taskDate:sec.taskDate,lastNameId:sec.addcontent,subItem1:"",
                subItem2:"",subItem3:"",subItem4:"其他"});

    }

    //保存任务
    $scope.saveTask= function (){

        if(!angular.isDefined($scope.tagTask.levels)){
            $scope.tagTask.levels = "1"
        }else if(!$scope.tagTask.levels)
        {
            $scope.tagTask.levels = "1"
        }
        $http({method : 'POST',url : WEBROOT+'/TagTask/saveTask',params:$scope.tagTask,headers : window.utf8_headers})
            .success(function(rtndata, status, headers, config){
                alert("ok")
                $scope.tagTaskInstance = rtndata.tagTaskInstance
            })
            .error(function(data, status, headers, config){

            });
    }

    //保存secondGrade
    $scope.saveSecondGrade = function () {
        $http({method : 'POST',url : WEBROOT+'/TagTask/saveSecondGrade',params:$scope.secondGrade,headers : window.utf8_headers})
            .success(function(rtndata, status, headers, config){
            })
            .error(function(data, status, headers, config){
                alert("error");
            });
    }

    //保存subClass
    $scope.savesubCalss = function () {
            $http({method : 'POST',url : WEBROOT+'/TagTask/savesubCalss',params:$scope.subCalss,headers : window.utf8_headers})
                .success(function(rtndata, status, headers, config){
                })
                .error(function(data, status, headers, config){
                    alert("error");
                });


    }

    //保存任务
    $scope.saveTaskCatalog= function (){
        //relatedTagTaskId
        if(angular.isDefined( $scope.tagTaskInstance)&& $scope.tagTaskInstance.id!=""){
            $scope.taskCatalog.relatedTagTaskId = $scope.tagTaskInstance.id
        }else
        {
            alert('标注任务ID不能为空')
          return;
        }
        if ($scope.secondGrade.length>0)
        {
            $scope.saveSecondGrade();
        }
        if ($scope.subCalss.length > 0)
        {
            $scope.savesubCalss()
        }

        $http({method : 'POST',url : WEBROOT+'/TagTask/saveTaskCatalog',params:$scope.taskCatalog,headers : window.utf8_headers})
            .success(function(rtndata, status, headers, config){
                alert("ok");
            })
            .error(function(data, status, headers, config){
                alert("error");
            });
    }

    //删除任务
    $scope.delCurrentTagTask= function (id){

        $http({method : 'POST',url : WEBROOT+'/TagTask/delCurrentTagTask',params:{taskId:id},headers : window.utf8_headers})
            .success(function(rtndata, status, headers, config){
                alert("ok")
            })
            .error(function(data, status, headers, config){

            });
    }

    /**
     * remove catalogAction
     * @param catalog
     */
    $scope.removeCatalogAction = function (catalog) {
        //lang.splice(1,1);
        $scope.catalogs.splice(catalog.level,1);
    }
    //task
    // $scope.$watch("task.subTaskTimes",function(newVal,oldVal){
    //     if(angular.isDefined($scope.task.subTaskTimes)&& $scope.task.subTaskTimes > 0){
    //                 console.log("subtiems:"+$scope.task.subTaskTimes);
    //
    //         if($scope.task.subTaskTimes > $scope.subTasks.length){
    //             for(var i= ($scope.subTasks.length);i< ($scope.task.subTaskTimes) ; i++){
    //                 $scope.subTasks.push({num:i});
    //             }
    //         }
    //         var delcont = $scope.subTasks.length - $scope.task.subTaskTimes;
    //         if(delcont > 0 )
    //         {   //delete
    //             console.log('delcont : '+delcont);
    //             for(var i= 0;i<  delcont ; i++){
    //                 $scope.subTasks.pop();
    //             }
    //         }
    //
    //
    //     }
    // });

});
