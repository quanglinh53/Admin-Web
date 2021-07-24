var app = angular.module('sansimso', ["ngSanitize"]);
app.controller('profileController', ['$scope', '$http'
    , function ($scope, $http) {
        /*$scope.customer =  customer;*/
        $scope.customer = {};
        $scope.reset = {};
        $scope.isChanggePass = false;
        /*$scope.newpassword="";*/
        $scope.birthdayDate = {};


        $scope.checkSD = "YES";

        /* $(window).on('load', function () {
             console.log($("#modalCustomer").val());
             if (!isNullString($("#modalCustomer").val())) {
                 $('#change-password').modal('show');
             }
         });*/

        $http.get(preUrl + "/getMyProfile")
            .then(function (response) {
                if (response != null && response != 'undefined' && response.status == 200) {
                    $scope.customer = response.data;
                    $scope.birthdayDate = new Date($scope.customer.birthday);
                }
            });

        $scope.updateCustomer = function () {
            $scope.customer.birthday = $scope.birthdayDate.getTime(); /*dateToTimestamp($scope.birthdayDate);*/
            if (isNullString($scope.customer.email)) {
                toastr.error("Email không được bỏ trống");
            } else if (emailIsValid($scope.customer.email) === false) {
                toastr.error("Email không hợp lệ");
            }
            else{
                $scope.customer.password = $scope.newPassword;
                $http.post(preUrl + "/update-profile", $scope.customer, {headers: {'Content-Type': 'application/json'}})
                    .then(function (response) {
                        if (response.data.success === true) {
                            toastr.success("Cập nhật thông tin cá nhân thành công");
                        } else {
                            toastr.error(response.data.messageError);
                        }
                    });

            }
        };

        $scope.changeAvatar = function () {

            $http.post(preUrl + "/change-avatar", $scope.customer, {headers: {'Content-Type': 'application/json'}})
                .then(function (response) {
                    if (response.data === true) {
                        toastr.success("Thay đổi ảnh đại diện thành công!");
                        $('#myModalChooseFile').modal('hide');
                        window.location.href = preUrl+"/thongtintaikhoan.html";
                    } else {
                        toastr.error("Thay đổi ảnh đại diện thất bại");
                    }
                });
        };

        $uploadCrop = $("#upload-demo").croppie({
            enableExif: true,
            viewport: {
                width: 250,
                height: 250,
                type: 'circle'
            },
            boundary: {
                width: 300,
                height: 300
            }
        });

        $('#upload').on('change', function () {
            var reader = new FileReader();
            reader.onload = function (e) {
                $uploadCrop.croppie('bind', {
                    url: e.target.result
                }).then(function () {
                    console.log('jQuery bind complete');
                });
            };
            reader.readAsDataURL(this.files[0]);
        });

        $scope.uploadAvatar = function () {
            var fullPath = $("#upload").val();
            if (fullPath) {
                var startIndex = (fullPath.indexOf('\\') >= 0 ? fullPath.lastIndexOf('\\') : fullPath.lastIndexOf('/'));
                var filename = fullPath.substring(startIndex);
                if (filename.indexOf('\\') === 0 || filename.indexOf('/') === 0) {
                    filename = filename.substring(1);
                }
            }
            $uploadCrop.croppie('result', {
                type: 'canvas',
                size: 'viewport'
            }).then(function (resp) {
                $scope.customer.image = resp;
                $scope.customer.fileName = filename;
                $scope.changeAvatar();
            });
        };

        function emailIsValid(email) {
            return /\S+@\S+\.\S+/.test(email);
        }


        function hasUnicode(str) {
            for (var i = 0; i < str.length; i++) {
                if (str.charCodeAt(i) > 127) return true;
            }
            return false;
        }

//hàm check chuỗi có bao gồm bấy kỳ khoảng trắng nào k?
        function hasSpace(str) {
            if (/\s/.test(str)) {
                // It has any kind of whitespace
                return true;
            }
            return false;
        }


        $scope.changPass = function () {
            if (isNullString($scope.reset.oldpassword)) {
                toastr.error("Mật khẩu cũ không được bỏ trống");
            } else if (isNullString($scope.reset.newpassword)) {
                toastr.error("Mật khẩu mới không được bỏ trống");
            } else if ($scope.reset.newpassword.length < 7) {
                toastr.error("Mật khẩu phải lớn hơn 8 ký tự");
            } else if (isNullString($scope.confirmPassword)) {
                toastr.error("Xác nhận mật khẩu không được bỏ trống");
            } else if ($scope.confirmPassword != $scope.reset.newpassword) {
                toastr.error("Mật khẩu không khớp");
            } else {
                $http.get(preUrl + "/changePassWord", {
                    params: {
                        oldpassword: $scope.reset.oldpassword,
                        newpassword: $scope.reset.newpassword
                    }
                })
                    .then(function (response) {
                        if (!isNullString(response.data)) {
                            if (response.data.success === true) {
                                toastr.success("Đổi mật khẩu thành công")
                                $('#changePassModal').modal('hide');
                                /*$("#chage").modal();*/
                            } else {
                                toastr.error(response.data.messageError);
                            }
                        }

                    });

            }
        }

        $scope.back = function () {
            window.location.href = preUrl;
        };


    }]);