/**
 * Created by Admin on 12/22/2017.
 */
app.controller('transactionHistoryCtrl',
    ['$scope', '$http', '$filter', '$window', '$timeout', '$q'
      , function ($scope, $http, $filter, $window, $timeout, $q) {
      $scope.name = null;
      $scope.page = page;
      $scope.action = "ADD";
      $scope.data = {
        nguoiBan: '',
        tuNgay: '',
        denNgay: '',
        status: ''
      }

      $(document).ready(function () {
            $('#selectDate1').datetimepicker({
              locale : 'vi-VN',
              format : 'DD/MM/YYYY'
            }).on('dp.change',function(e){
              if(e != null) {
                $scope.data.tuNgay = $("#startDate").val();
              }
            });

            $('#selectDate2').datetimepicker({
              locale : 'vi-VN',
              format : 'DD/MM/YYYY'
            }).on('dp.change',function(e){
              if(e != null) {
                $scope.data.denNgay = $("#endDate").val();
              }
            });
          }
      );

      $scope.idEdit = -1;
      $scope.addOrEdit = function (action, item) {
        $scope.action = action;
        $scope.data.transactionName = item.transactionName;
        $scope.idEdit = item.id;
      };

      $http.get(preUrl + "/admin/management/transaction-history",
          {
            params: {
              nguoiBan: $scope.data.nguoiBan,
              tuNgay: $scope.data.tuNgay,
              denNgay: $scope.data.denNgay,
              status: $scope.data.status
            }
          })
      .then(function (response) {
        if (response != null && response != 'undefined' && response.status
            == 200) {
          $scope.page = response.data;
          $scope.page.pageCount = getPageCount($scope.page);
          $scope.page.pageList = getPageList($scope.page);
        }
      });
      /*----------------------for auto complete-------------------------------------*/

      /*----------------------------------------------------------------------------------*/
      $scope.search = function () {
        $scope.page.pageNumber = 1;
        $http.get(preUrl + "/admin/management/transaction-history",
            {
              params: {
                nguoiBan: $scope.data.nguoiBan,
                tuNgay: $scope.data.tuNgay,
                denNgay: $scope.data.denNgay,
                status: $scope.data.status
              }
            })
        .then(function (response) {
          if (response != null && response != 'undefined' && response.status
              == 200) {
            $scope.page = response.data;
            $scope.page.pageCount = getPageCount($scope.page);
            $scope.page.pageList = getPageList($scope.page);
          }
        });
      };

      $scope.loadPage = function (pageNumber) {
        if (pageNumber >= 1) {
          $http.get(preUrl + "/admin/management/transaction-history",
              {
                params: {
                  nguoiBan: $scope.data.nguoiBan,
                  tuNgay: $scope.data.tuNgay,
                  denNgay: $scope.data.denNgay,
                  status: $scope.data.status
                }
              })
          .then(function (response) {
            $scope.page = response.data;
            $scope.page.pageList = getPageList($scope.page);
            $scope.page.pageCount = getPageCount($scope.page);
          });
        }

      };

    }]);