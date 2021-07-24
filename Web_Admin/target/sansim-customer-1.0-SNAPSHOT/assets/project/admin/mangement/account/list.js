/**
 * Created by Admin on 12/22/2017.
 */
app.controller('accountListCtrl',
    ['$scope', '$http', 'fileUpload', function ($scope, $http, fileUpload) {
      $scope.search = {
        n:'',
        status:null
      };
      $scope.page = page;
      $scope.account = {
        email: '',
        fullname: '',
        isCustomer: 0,
        isSeller: 0,
        password: '123456aA@',
        isVirtualAccount: 1
      }

      $scope.modalADD = function () {
        $("#AddNew").modal();
        $scope.labelAdd = 'ADD';
        $scope.account = {
          email: '',
          fullname: '',
          isCustomer: 0,
          isSeller: 0,
          password: '123456aA@',
          isVirtualAccount: 1
        }
      }

      $scope.searchCondition = {
        name: $scope.name,
        categoryId: $scope.categoryId
      }

      $http.get(preUrl + "/admin/management/account",
          {params: {name: $scope.search.name}})
      .then(function (response) {
        if (response != null && response != 'undefined' && response.status
            == 200) {
          $scope.page = response.data;
          $scope.page.pageCount = getPageCount($scope.page);
          $scope.page.pageList = getPageList($scope.page);
          $scope.userLogin = $scope.page.userLogin;
        }
      });

      $scope.search = function () {
        $scope.page.pageNumber = 1;
        $http.get(preUrl + "/admin/management/account",
            {params: {fullname: $scope.search.n, status: $scope.search.status}})
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
          $http.get(preUrl + "/admin/management/account", {
            params: {
              p: pageNumber,
              name: $scope.searchCondition.name,
              categoryId: $scope.searchCondition.categoryId
            }
          })
          .then(function (response) {
            $scope.page = response.data;
            $scope.page.pageList = getPageList($scope.page);
            $scope.page.pageCount = getPageCount($scope.page);
          });
        }

      };

      $scope.add = function () {
        if (isNullString($scope.account.email)) {
          toastr.error('Chưa nhập email');
          return;
        }
        if (isNullString($scope.account.fullname)) {
          toastr.error('Chưa nhập email');
          return;
        }

        var jsonData = JSON.parse(JSON.stringify($scope.account));
        $http.post(preUrl + "/admin/management/account", jsonData,
            {headers: {'Content-Type': 'application/json'}})
        .then(function (response) {
          if (!isNullString(response.data.id)) {
            $('#AddNew').modal('hide');
            toastr.success('Thêm mới thành công');
            $scope.loadPage(1);
          }
        });
      }

      $scope.idLock = '';
      $scope.action = 'lock';
      $scope.onLockAccount = function (id, action) {
        $scope.idLock = id;
        $scope.action = action;
        $('#modalLock').modal('show');
      }

      $scope.lockAccount = function () {

        $http.post(preUrl + "/admin/management/account/" + $scope.action + "/"
            + $scope.idLock,
            null,
            {headers: {'Content-Type': 'application/json'}})
        .then(function (response) {
          if (!isNullString(response.data.id)) {
            $('#modalLock').modal('hide');
            if ($scope.action == 'lock') {
              toastr.success('Khóa tài khoản thành công');
            } else {
              toastr.success('Mở khóa tài khoản thành công');
            }
            $scope.loadPage($scope.page.pageNumber);
          }
        });
      }

    }]);