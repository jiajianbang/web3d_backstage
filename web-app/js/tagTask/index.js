/**
 * tagtaskmodel
 * @type {string}
 */
var appid = "tagtaskmodel"
window.appModels.push(appid)
//
var app = angular.module(appid, []);
app.controller('tagTaskCtrl', function($scope,$http) {

    $scope.searchValue = "";

    $scope.tagTaskList = [];
    $scope.updateId;
    $scope.pages;
    $scope.newPages;
    $scope.pageList = [];
    $scope.selPage = 1;

    ////*
    // 获取数据库表
    // *///
    $scope.getTagTaskList= function (){
        $http({method : 'POST',url : WEBROOT+'/TagTask/tagTaskList',params:{districtid:'test'},headers : window.utf8_headers})
            .success(function(rtndata, status, headers, config){
                $scope.tagTaskList = rtndata.data;
                $scope.pageSize = 10;
                $scope.pages = Math.ceil($scope.tagTaskList.length / $scope.pageSize);
                $scope.items = $scope.tagTaskList.slice(0, $scope.pageSize);
                //alert($scope.pages);
                $scope.newPages = $scope.pages > 10 ? 10: $scope.pages;
                //alert($scope.newPages);

            })
            .error(function(data, status, headers, config){

            });
    }


    //分页
    $scope.setData = function () {
        $scope.items = $scope.tagTaskList.slice(($scope.pageSize * ($scope.selPage - 1)),
            ($scope.selPage * $scope.pageSize));//通过当前页数筛选出表格当前显示数据
    }

    //分页要repeat的数组
    for (var i = 0; i < $scope.newPages; i++) {
        $scope.pageList.push(i + 1);
    }
    //打印当前选中页索引
    $scope.selectPage = function (page) {
        //不能小于1大于最大
        if (page < 1 || page > $scope.pages) return;
        //最多显示分页数5
        if (page > 2) {
            //因为只显示5个页数，大于2页开始分页转换
            var newpageList = [];
            for (var i = (page - 3) ;
                 i < ((page + 2) > $scope.pages ? $scope.pages : (page + 2)) ; i++) {
                newpageList.push(i + 1);
            }
            $scope.pageList = newpageList;
        }
        $scope.selPage = page;
        $scope.setData();
        $scope.isActivePage(page);
        //console.log("选择的页：" + page);
    };
    //设置当前选中页样式
    $scope.isActivePage = function (page) {
        return $scope.selPage == page;
    };
    //上一页
    $scope.Previous = function () {
        $scope.selectPage($scope.selPage - 1);
    }
    //下一页
    $scope.Next = function () {
        $scope.selectPage($scope.selPage + 1);
    };
    //删除任务
    $scope.delTagTaskById= function (id){
        $http({method : 'POST',url : WEBROOT+'/TagTask/delTagTaskById',params:{taskId:id},headers : window.utf8_headers})
            .success(function(rtndata, status, headers, config){
               // $scope.tagTaskList.splice(id,1);
                $scope.getTagTaskList();

            })
            .error(function(data, status, headers, config){

            });
    }
    /*
    * 更新表格内容，修改任务
    * */
    $scope.updateTagTaskById= function (id){
        $http({method : 'POST',url : WEBROOT+'/TagTask/updateTagTaskById',params:{taskId:id},headers : window.utf8_headers})
            .success(function(rtndata, status, headers, config){
                // $scope.tagTaskList.splice(id,1);
                $socpe.updateId = rthdata.data;
                window.location.href = "${request.contextPath}/tagTask/updateTask"
                //$scope.getTagTaskList();

            })
            .error(function(data, status, headers, config){

            });
    }
    /*
    *查找任务
     */
    $scope.findTagTaskByStr= function (str){
        $http({method : 'POST',url : WEBROOT+'/TagTask/findTagTaskByStr',params:{searchStr:$scope.searchValue},headers : window.utf8_headers})
            .success(function(rtndata, status, headers, config){
             alert('find ok ')
            })
            .error(function(data, status, headers, config){
                alert('error')
            });
    }
    /////////////////////////////////////////////////
    //getMethod
    $scope.getTagTaskList();

});
