/**
 * Created by Admin on 12/22/2017.
 */
app.controller('newsListCtrl',['$scope','$http'
    ,function ($scope,$http) {
        $scope.name="";
        $scope.page=page;
        $scope.customer={};

        $scope.name=null;


        $http.get(preUrl+"/admin/content/customer/list/search", {params: {name:$scope.name}})
            .then(function (response) {
                if(response!=null && response!='undefined' && response.status==200){
                    $scope.page=response.data;
                    $scope.page.pageCount=getPageCount($scope.page);
                    $scope.page.pageList=getPageList($scope.page);
                }
            });
        $scope.search=function () {
            $http.get(preUrl+"/admin/content/customer/list/search", {params: {name:$scope.name}})
                .then(function (response) {
                    if(response!=null && response!='undefined' && response.status==200){
                        $scope.page=response.data;
                        $scope.page.pageCount=getPageCount($scope.page);
                        $scope.page.pageList=getPageList($scope.page);
                    }
                });
        }
        $scope.loadPage=function (pageNumber) {
            $http.get(preUrl+"/admin/content/customer/list/search", {params: {p:pageNumber,name:$scope.name}})
                .then(function (response) {
                    if(response!=null && response!='undefined' && response.status==200){
                        $scope.page=response.data;
                        $scope.page.pageCount=getPageCount($scope.page);
                        $scope.page.pageList=getPageList($scope.page);
                    }
                });
        }

    }]);