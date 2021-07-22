/**
 * Created by Admin on 12/22/2017.
 */
app.controller('promotionCtrl',
    ['$scope', '$http', '$filter', '$window', '$timeout', '$q'
      , function ($scope, $http, $filter, $window, $timeout, $q) {
      $scope.name = '';
      $scope.page = page;
      $scope.action = "ADD";
      $scope.data = {
        title: '',
        description: '',
        value: null,
        type: '',
        duration: ''
      }
      $scope.search = {
        type: '',
        ngayDang: ''
      }
      $scope.duration = '';
      $(document).ready(function () {
            $('#selectDate1').datetimepicker({
              locale: 'vi-VN',
              format: 'HH:mm:ss DD/MM/YYYY',
              sideBySide: true
            }).on('dp.change', function (e) {
              if (e != null) {
                $scope.duration = $("#startDate").val();
              }
            });
        $('#selectDate2').datetimepicker({
          locale : 'vi-VN',
          format : 'DD/MM/YYYY'
        }).on('dp.change',function(e){
          if(e != null) {
            $scope.search.ngayDang = $("#startDate2").val();
          }
        });
          }
      );

      $scope.idEdit = -1;
      $scope.addOrEdit = function (action, item) {
        $scope.action = action;
        $scope.data = {
          title: '',
          description: '',
          value: null,
          type: '',
          duration: ''
        }
        $scope.duration = '';
        $('#selectDate1').data("DateTimePicker").date(null);
        if (action == 'EDIT') {
          $scope.data = angular.copy(item);
          $scope.duration = moment($scope.data.duration).format(
              'HH:mm:ss DD/MM/YYYY');
          $('#selectDate1').data("DateTimePicker").date(
              moment($scope.data.duration).format('HH:mm:ss DD/MM/YYYY'));
          $scope.idEdit = item.id;
        }

      };

      $http.get(preUrl + "/admin/management/promotion",
          {params: {type: $scope.search.type, ngayDang: $scope.search.ngayDang}})
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
        $http.get(preUrl + "/admin/management/promotion",
            {params: {type: $scope.search.type, ngayDang: $scope.search.ngayDang}})
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
          $http.get(preUrl + "/admin/management/promotion",
              {params: {type: $scope.search.type, ngayDang: $scope.search.ngayDang}})
          .then(function (response) {
            $scope.page = response.data;
            $scope.page.pageList = getPageList($scope.page);
            $scope.page.pageCount = getPageCount($scope.page);
          });
        }

      };

      $scope.add = function () {

        $scope.data.duration = moment($scope.duration, 'HH:mm:ss DD/MM/YYYY');
        var jsonData = JSON.parse(JSON.stringify($scope.data));
        let check = validate();
        if (check != 'OK') {
          toastr.error(check);
          return;
        }
        $http.post(preUrl + "/admin/management/promotion", jsonData,
            {headers: {'Content-Type': 'application/json'}})
        .then(function (response) {
          if (!isNullString(response.data.id)) {
            $('#addOrEditModal').modal('hide');
            $scope.data = {
              transactionName: ''
            }
            toastr.success('Thêm mới thành công');
            $scope.loadPage(1);
          }
        });
      }

      $scope.idDelete = -1;
      $scope.onDelete = function (idDelete) {
        $scope.idDelete = idDelete;
      }
      $scope.delete = function () {
        $http.delete(
            preUrl + "/admin/management/promotion/" + $scope.idDelete,
            null, {headers: {'Content-Type': 'application/json'}})
        .then(function (response) {
          $('#deleteItem').modal('hide');
          toastr.success('Xóa thành công');
          $scope.loadPage(1);
        });
      }

      $scope.edit = function () {

        $scope.data.duration = moment($scope.duration, 'HH:mm:ss DD/MM/YYYY');
        var jsonData = JSON.parse(JSON.stringify($scope.data));
        let check = validate();
        if (check != 'OK') {
          toastr.error(check);
          return;
        }
        $http.put(preUrl + "/admin/management/promotion/" + $scope.idEdit,
            jsonData,
            {headers: {'Content-Type': 'application/json'}})
        .then(function (response) {
          if (!isNullString(response.data.id)) {
            $('#addOrEditModal').modal('hide');
            toastr.success('Cập nhật thành công');
            $scope.loadPage(1);
          }
        });
      }

      function validate() {
        if (isNullString($scope.data.title)) {
          return 'Vui lòng nhập tiêu đề khuyến mại!';
        } else if (isNullString($scope.data.description)) {
          return 'Vui lòng nhập nội dụng khuyến mại!';
        } else if (isNullString($scope.data.value)) {
          return 'Vui lòng nhập giá trị khuyến mại!';
        } else if (isNullString($scope.data.type)) {
          return 'Vui lòng chọn loại dịch vụ!';
        } else if (isNullString($scope.duration)) {
          return 'Vui lòng nhập thời gian áp dụng!';
        } else if ($scope.data.duration < new Date()) {
          return 'Vui lòng nhập thời gian áp dụng lớn hơn thời gian hiện tại!';
        } else {
          return 'OK';
        }

      }

    }]);