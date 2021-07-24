/**
 * Created by Admin on 12/22/2017.
 */
app.controller('admCategoryCtrl',
    ['$scope', '$http', '$filter', '$window', '$timeout', '$q'
      , function ($scope, $http, $filter, $window, $timeout, $q) {
      $scope.name = null;
      $scope.page = page;
      $scope.action = "ADD";
      $scope.data = {
        name: '',
        rootId: 0
      }
      $scope.listRoot = {};

      $scope.getListRoot = function () {
        $http.get(preUrl + "/admin/management/category", {params: {p: 1}})
        .then(function (response) {
          $scope.listRoot = response.data;
        });
      }
      $scope.getListRoot();
      $scope.idEdit = -1;
      $scope.addOrEdit = function (action, item) {
        $scope.data = {
          name: '',
          rootId: 0
        }
        $scope.action = action;
        $scope.data.name = item.name;
        $scope.idEdit = item.id;
        $scope.data.rootId = item.rootId;
      };

      $http.get(preUrl + "/admin/management/category",
          {params: {name: $scope.name}})
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
        $http.get(preUrl + "/admin/management/category",
            {params: {name: $scope.name}})
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
          $http.get(preUrl + "/admin/management/category",
              {params: {p: pageNumber, name: $scope.name}})
          .then(function (response) {
            $scope.page = response.data;
            $scope.page.pageList = getPageList($scope.page);
            $scope.page.pageCount = getPageCount($scope.page);
          });
        }

      };

      $scope.add = function () {
        if (isNullString($scope.data.name)) {
          toastr.error('Chưa nhập tên category');
          return;
        }
        var jsonData = JSON.parse(JSON.stringify($scope.data));
        $http.post(preUrl + "/admin/management/category", jsonData,
            {headers: {'Content-Type': 'application/json'}})
        .then(function (response) {
          if (!isNullString(response.data.id)) {
            $('#addOrEditModal').modal('hide');
            $scope.data = {
              name: '',
              rootId: 0
            }
            toastr.success('Thêm mới thành công');
            $scope.loadPage(1);
            $scope.getListRoot();
          }
        });
      }

      $scope.idDelete = -1;
      $scope.onDelete = function (idDelete) {
        $scope.idDelete = idDelete;
      }
      $scope.delete = function () {
        $http.delete(
            preUrl + "/admin/management/category/" + $scope.idDelete,
            null, {headers: {'Content-Type': 'application/json'}})
        .then(function (response) {
          $('#deleteItem').modal('hide');
          toastr.success('Xóa thành công');
          $scope.loadPage(1);
          $scope.getListRoot();
        });
      }

      $scope.edit = function () {
        if (isNullString($scope.data.name)) {
          toastr.error('Chưa nhập tên hình thức giao dịch')
          return;
        }
        var jsonData = JSON.parse(JSON.stringify($scope.data));
        $http.put(preUrl + "/admin/management/category/" + $scope.idEdit , jsonData,
            {headers: {'Content-Type': 'application/json'}})
        .then(function (response) {
          if (!isNullString(response.data.id)) {
            $('#addOrEditModal').modal('hide');
            toastr.success('Cập nhật thành công');
            $scope.loadPage(1);
            $scope.getListRoot();
          }
        });
      }

    }]);