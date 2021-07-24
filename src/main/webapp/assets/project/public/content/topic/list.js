/**
 * Created by Admin on 12/22/2017.
 */
var app = angular.module('sansimso', ["ngSanitize"]);
app.controller('publicListTopicCtrl', ['$scope', '$http'
    , function ($scope, $http) {
        $scope.topics = [];
        $scope.hotPosts=[];
        $scope.groupTopicId = groupTopicId;

        //get list group topic
        $http.get(preUrl + "/noi-dung/chu-de/lay-danh-sach-chu-de-cua-group", {params: {groupTopicId:$scope.groupTopicId}})
            .then(function (response) {
                if (response != null && response != 'undefined' && response.status == 200) {
                    $scope.topics = response.data;
                }
            });

        //get list Bài viết hot
        $http.get(preUrl + "/noi-dung/bai-viet-hot")
            .then(function (response) {
                if (response != null && response != 'undefined' && response.status == 200) {
                    $scope.hotPosts = response.data;
                }
            });




    }]);