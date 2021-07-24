/**
 * Created by Admin on 12/22/2017.
 */
var app = angular.module('sansimso', ["ngSanitize"]);
app.controller('indexController', ['$scope', '$http'
    , function ($scope, $http) {
        $scope.goupTopics = [];
        $scope.groupNotifices=[];
        $scope.hotPosts=[];
        $scope.members=[];

        $scope.customer = {};
        $scope.comfirmPassword = "";
       $scope.reset={};

        $scope.checkSD="YES";
        $scope.sessionUser =$('#sessionUser').val();

        //get list group topic
         $http.get(preUrl + "/noi-dung/danh-sach-nhom-chu-de")
             .then(function (response) {
                 if (response != null && response != 'undefined' && response.status == 200) {
                     $scope.goupTopics = response.data;
                 }
             });

        //get list Bài viết hot
         $http.get(preUrl + "/noi-dung/bai-viet-hot")
             .then(function (response) {
                 if (response != null && response != 'undefined' && response.status == 200) {
                     $scope.hotPosts = response.data;
                 }
             });

        //get list thành viên tích cực
        $http.get(preUrl + "/thanh-vien-tich-cuc")
            .then(function (response) {
                if (response != null && response != 'undefined' && response.status == 200) {
                    $scope.members = response.data;
                }
            });


        //get list Thông báo
        $http.get(preUrl + "/noi-dung/danh-sach-chu-de-thong-bao")
            .then(function (response) {
                if (response != null && response != 'undefined' && response.status == 200) {
                    $scope.groupNotifices = response.data;
                }
            });
        //get list topic by grop topic
        //get posts by topic



    }]);