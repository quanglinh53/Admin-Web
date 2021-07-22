/**
 * Created by Admin on 12/22/2017.
 */
app.controller('publicListPostCtrl',['$scope','$http'
    ,function ($scope,$http) {
        $scope.name="";
        $scope.page=page;
        $scope.listCate="";
        $scope.topicId = topicId;

        $scope.searchCondition={name:$scope.name, categoryId:$scope.categoryId}

        $http.get(preUrl+"/noi-dung/chu-de/danh-sach-bai-viet", {params: {topicId:$scope.topicId}})
            .then(function (response) {
                if(response!=null && response!='undefined' && response.status==200){
                    $scope.page=response.data;
                    $scope.page.pageCount=getPageCount($scope.page);
                    $scope.page.pageList=getPageList($scope.page);
                }
            });

      /*  $scope.search=function () {
            $scope.page.pageNumber=1;
            $http.get(preUrl+"/noi-dung/chu-de/danh-sach-bai-viet", {params: {name:$scope.searchCondition.name,categoryId:$scope.searchCondition.categoryId}})
                .then(function (response) {
                    if(response!=null && response!='undefined' && response.status==200){
                        $scope.page=response.data;
                        $scope.page.pageCount=getPageCount($scope.page);
                        $scope.page.pageList=getPageList($scope.page);
                    }
                });
        };*/

        $scope.loadPage=function (pageNumber) {
            if(pageNumber>=1){
                $http.get(preUrl+"/noi-dung/chu-de/danh-sach-bai-viet", {params: {p:pageNumber,topicId:$scope.topicId}})
                    .then(function (response) {
                        $scope.page=response.data;
                        $scope.page.pageList=getPageList($scope.page);
                        $scope.page.pageCount=getPageCount($scope.page);
                    });
            }

        };



    }]);