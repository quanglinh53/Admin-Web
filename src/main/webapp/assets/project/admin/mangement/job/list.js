/**
 * Created by Admin on 12/22/2017.
 */
app.controller('documentCtrl',
    ['$scope', '$http', '$filter', '$window', '$timeout', '$q'
      , function ($scope, $http, $filter, $window, $timeout, $q) {
      $scope.name = null;
      $scope.page = page;
      $scope.action = "ADD";
      $scope.data = {
        name: '',
        tuNgay: '',
        denNgay: '',
        employer: ''
      }

      $(document).ready(function () {
            $('#selectDate1').datetimepicker({
              locale: 'vi-VN',
              format: 'DD/MM/YYYY'
            }).on('dp.change', function (e) {
              if (e != null) {
                $scope.data.tuNgay = $("#startDate").val();
              }
            });

            $('#selectDate2').datetimepicker({
              locale: 'vi-VN',
              format: 'DD/MM/YYYY'
            }).on('dp.change', function (e) {
              if (e != null) {
                $scope.data.denNgay = $("#endDate").val();
              }
            });
          }
      );

      $http.get(preUrl + "/admin/management/job",
          {params: {transactionName: $scope.name}})
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
        $http.get(preUrl + "/admin/management/job",
            {
              params:
                  {
                    title: $scope.data.name,
                    employerName: $scope.data.employer,
                    tuNgay: $scope.data.tuNgay,
                    denNgay: $scope.data.denNgay
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
          $http.get(preUrl + "/admin/management/job",
              {params: {p: pageNumber, transactionName: $scope.name}})
          .then(function (response) {
            $scope.page = response.data;
            $scope.page.pageList = getPageList($scope.page);
            $scope.page.pageCount = getPageCount($scope.page);
          });
        }

      };

      $scope.item = {
        status: 0,
        id: ''
      }
      $scope.onEdit = function (item) {
        if (item.status == 0) {
          $scope.item.status = 1;
        } else {
          $scope.item.status = 0;
        }
        $scope.item.id = item.id;
      };
      $scope.confirm = function () {
        var jsonData = JSON.parse(JSON.stringify($scope.item));
        $http.post(
            preUrl + "/admin/management/job/change-status/" + $scope.item.id,
            jsonData,
            {headers: {'Content-Type': 'application/json'}})
        .then(function (response) {
          if (!isNullString(response.data.id)) {
            $('#modalConfirm').modal('hide');
            if ($scope.item.status == 0) {
              toastr.success('Vô hiệu hóa khoản thành công');
            } else {
              toastr.success('Cho phép đăng bài thành công');
            }
            $scope.loadPage($scope.page.pageNumber);
          }
        });
      }

    }]);