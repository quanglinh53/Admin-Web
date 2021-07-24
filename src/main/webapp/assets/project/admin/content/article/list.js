/**
 * Created by Admin on 12/22/2017.
 */
app.controller('newsListCtrl',['$scope','$http','fileUpload', function ($scope, $http, fileUpload) {
        $scope.search={};
        $scope.page=page;
        $scope.listCate="";
        $scope.article={};
        $scope.listCategory=[];
        $scope.labelAdd="ADD";
        $scope.pending="OFF"
        var path="";

        $scope.searchCondition={name:$scope.name, categoryId:$scope.categoryId}

        $http.get(preUrl+"/admin/content/article/list/search", {params: {name:$scope.search.name}})
            .then(function (response) {
                if(response!=null && response!='undefined' && response.status==200){
                    $scope.page=response.data;
                    $scope.page.pageCount=getPageCount($scope.page);
                    $scope.page.pageList=getPageList($scope.page);
                    $scope.userLogin=$scope.page.userLogin;
                }
            });
        $http.get(preUrl+"/admin/content/category/list/all")
            .then(function (response) {
                if(response!=null && response!='undefined' && response.status==200){
                    $scope.listCategory=response.data;
                }
            });

        $scope.search=function () {
            $scope.page.pageNumber=1;
            $http.get(preUrl+"/admin/content/article/list/search", {params: {name:$scope.search.name,status:$scope.search.status}})
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
                $http.get(preUrl+"/admin/content/article/list/search", {params: {p:pageNumber,name:$scope.searchCondition.name,categoryId:$scope.searchCondition.categoryId}})
                    .then(function (response) {
                        $scope.page=response.data;
                        $scope.page.pageList=getPageList($scope.page);
                        $scope.page.pageCount=getPageCount($scope.page);
                    });
            }

        };
        var idDelete=0;
       $scope.xoa=function (idxoa) {
           idDelete=idxoa;
              $("#modalxoa").modal();


       }
       $scope.baiviet={};
       $scope.openDetail=function (item) {
           $scope.baiviet=item;
           $("#detail").modal();
       }

       $scope.comfimXoa=function () {
           $http.get(preUrl+"/admin/content/article/delete", {params: {id:idDelete}})
               .then(function (response) {
                   $scope.loadPage(1);
                   $scope.page.pageCount=getPageCount($scope.page);
                   $("#modalxoa").modal("hide");
                   toastr.success("Xóa thành công!");
               });
       }
       $scope.modalADD=function () {
           $("#AddNew").modal();
           $scope.labelAdd='ADD';
           $scope.article={};

           CKEDITOR.instances["contentnews"].setData("");
       }
        $scope.uploadImage = function (event) {
            $scope.pending="ON";
            var file = $scope.filebackground;
            var uploadUrl = preUrl + "/common/anhBaiViet";
            fileUpload.uploadFileToUrl(file, uploadUrl).then(function (response) {
                    path=response.data.path;
                    console.log(path);
                    $scope.pending="OFF";
                }

            );

        };
    $scope.modalLuu=function () {
        if(!isUndefined(path)){
        $scope.article.thumbail=path;}
        $scope.article.content=editor.getData();
        var auctioneerJson = JSON.parse(JSON.stringify($scope.article));
        $http.post(preUrl + "/admin/content/article/add", auctioneerJson, {headers: {'Content-Type': 'application/json'}})
            .then(function (response) {
                if(response.data==true){
                    toastr.success("Cập nhật thành công!");
                    $("#AddNew").modal("hide");
                    $scope.loadPage(1);

                }else {
                    toastr.error("Có lỗi xảy ra!");

                }
            })
    }
    var idDuyet=0;
    $scope.capNhat=function (i,item) {
        $scope.article=angular.copy(item);
        idDuyet=i;
        $("#modalDuyet").modal();
    }
    $scope.comfimDuyet=function(){
        $scope.article.status=idDuyet;
        var auctioneerJson = JSON.parse(JSON.stringify($scope.article));
        $http.post(preUrl + "/admin/content/article/add", auctioneerJson, {headers: {'Content-Type': 'application/json'}})
            .then(function (response) {
                if(response.data==true){
                    toastr.success("Cập nhật thành công!");
                    $("#AddNew").modal("hide");
                    $("#modalDuyet").modal('hide');
                    $scope.loadPage(1);

                }else {
                    toastr.error("Có lỗi xảy ra!");

                }
            })
    }
    $scope.edit=function(item){
        $scope.article=angular.copy(item);
        $("#AddNew").modal();
        CKEDITOR.instances["contentnews"].setData($scope.article.content);
        $scope.labelAdd='EDIT';
    }

    }]);