/**
 * Created by Admin on 12/22/2017.
 */
app.controller('groupTopicCtrl',['$scope','$http','$filter','$window','$timeout','$q'
    ,function ($scope,$http,$filter,$window,$timeout,$q) {
        $scope.groupName="";
        $scope.page=page;

        $http.get(preUrl+"/admin/content/group-topic/list/search", {params: {groupName:$scope.groupName}})
            .then(function (response) {
                if(response!=null && response!='undefined' && response.status==200){
                    $scope.page=response.data;
                    $scope.page.pageCount=getPageCount($scope.page);
                    $scope.page.pageList=getPageList($scope.page);
                }
            });
        /*----------------------for auto complete-------------------------------------*/

        /*----------------------------------------------------------------------------------*/
        $scope.search=function () {
            $scope.page.pageNumber=1;
            $http.get(preUrl+"/admin/content/group-topic/list/search", {params: {groupName:$scope.groupName}})
                .then(function (response) {
                    if(response!=null && response!='undefined' && response.status==200){
                        $scope.page=response.data;
                        $scope.page.pageCount=getPageCount($scope.page);
                        $scope.page.pageList=getPageList($scope.page);
                    }
                });
        };

        $scope.loadPage=function (pageNumber) {
            if(pageNumber>=1){
                $http.get(preUrl+"/admin/content/group-topic/list/search", {params: {p:pageNumber,groupName:$scope.groupName}})
                    .then(function (response) {
                        $scope.page=response.data;
                        $scope.page.pageList=getPageList($scope.page);
                        $scope.page.pageCount=getPageCount($scope.page);
                    });
            }

        };

        $scope.itemDeleteId=0;
        $scope.deleteItem=function (id) {
            $scope.itemDeleteId=0;
            if(id>0){
                $scope.itemDeleteId=id;
            }
        }

    }]);