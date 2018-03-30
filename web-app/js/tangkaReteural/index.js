/**
 * tagtaskmodel
 * @type {string}
 */
var appid = "tangkaReturalmodel"
window.appModels.push(appid)
//
var app = angular.module(appid, []);
app.controller('tangkaReturalCtrl', function($scope,$http) {

    $scope.id_value = "";
    $scope.tangkaList = [];

    $scope.pages;
    $scope.newPages;
    $scope.pageList = [];
    $scope.selPage = 1;

    ////*
    // 获取数据库表
    // *///
    $scope.getTangkaList= function (){
        $http({method : 'POST',url : WEBROOT+'/TangkaReteural/getTangkaList',params:{districtid:'test'},headers : window.utf8_headers})
            .success(function(rtndata, status, headers, config){
                $scope.tangkaList = rtndata.data;
                for (var i = 0 ; i<$scope.tangkaList.length; i++){
                    var createDate = new Date($scope.tangkaList[i].create_time).format("yyyy-MM-dd hh:mm:ss")
                    $scope.tangkaList[i].dateCreatedTr = createDate;
                    $scope.tangkaList[i].related_image = 'http://localhost:18080/tangka/'+$scope.tangkaList[i].related_image;
                        // http://localhost:18080/tangka/A_01.jpg
                }

                $scope.pageSize = 10;
                $scope.pages = Math.ceil($scope.tangkaList.length / $scope.pageSize);
                $scope.items = $scope.tangkaList.slice(0, $scope.pageSize);
                //alert($scope.pages);
                $scope.newPages = $scope.pages > 10 ? 10: $scope.pages;
                //alert($scope.newPages);

            })
            .error(function(data, status, headers, config){

            });
    }

    /*
    * 更改
    * */
    $scope.updateTangkaById=function (id,image_url,image_name) {
        // alert(id)
        $scope.id_value = id;
        $scope.image_url = image_url;
        $scope.image_name = image_name;
        $('#myModal').modal('show')
    }

    /*
    * 更新
    * */
    $scope.updateTangka=function () {
        $('#myModal').modal('hide')
        $http({method : 'POST',url : WEBROOT+'/TangkaReteural/updateTangka',params:{idValue:$scope.id_value,
            image_name:$scope.image_name,image_url:$scope.image_url},headers : window.utf8_headers})
            .success(function(rtndata, status, headers, config){
                alert("ok")
                $scope.getTangkaList();
            })
            .error(function(data, status, headers, config){

            });
    }
    /*
    * 删除
    * */
    $scope.delTagTaskById=function (id) {
        $scope.del_id = id;
        $('#myModalDel').modal('show')
    }

    $scope.deleteTangka=function () {
        $('#myModalDel').modal('hide')
        $http({method : 'POST',url : WEBROOT+'/TangkaReteural/deleteTangka',params:{idValue:$scope.del_id,
        },headers : window.utf8_headers})
            .success(function(rtndata, status, headers, config){
                alert("ok")
                $scope.getTangkaList();
            })
            .error(function(data, status, headers, config){

            });
    }

    //分页
    $scope.setData = function () {
        $scope.items = $scope.tangkaList.slice(($scope.pageSize * ($scope.selPage - 1)),
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


    /////////////////////////////////////////////////
    /*
    * 日期时间格式转换
    * */
    Date.prototype.format = function(fmt) {
        var o = {
            "M+" : this.getMonth()+1,                 //月份
            "d+" : this.getDate(),                    //日
            "h+" : this.getHours(),                   //小时
            "m+" : this.getMinutes(),                 //分
            "s+" : this.getSeconds(),                 //秒
            "q+" : Math.floor((this.getMonth()+3)/3), //季度
            "S"  : this.getMilliseconds()             //毫秒
        };
        if(/(y+)/.test(fmt)) {
            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
        }
        for(var k in o) {
            if(new RegExp("("+ k +")").test(fmt)){
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
            }
        }
        return fmt;
    }

    //getMethod
    $scope.getTangkaList();

});
