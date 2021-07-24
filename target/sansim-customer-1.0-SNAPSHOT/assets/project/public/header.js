
var app = angular.module('sansimso', ["ngSanitize"]);
app.controller('headerController', ['$scope', '$http'
    , function ($scope, $http) {
        $scope.customer = {};
        $scope.comfirmPassword = "";
        $scope.reset={};

        clearData();
        $scope.checkSD="YES";

       /* $(window).on('load', function () {
            console.log($("#modalCustomer").val());
            if (!isNullString($("#modalCustomer").val())) {
                $('#change-password').modal('show');
            }
        });*/
        $scope.addCustomer = function () {
            $scope.customer.birthday = $('#birthday').val();
            if (isNullString($scope.customer.username)) {
                toastr.error("Tài khoản đăng nhập không được bỏ trống");
            }
            else if (hasUnicode($scope.customer.username) || hasSpace($scope.customer.username)) {
                toastr.error("Tài khoản phải viết liền không dấu")
            }
            else if (isNullString($scope.customer.password)) {
                toastr.error("Mật khẩu không được bỏ trống")
            }
            else if ($scope.customer.password.length < 7) {
                toastr.error("Mật khẩu phải lớn hơn 8 ký tự");
            }
            else if (isNullString($scope.confirmPassword)) {
                toastr.error("Xác nhận mật khẩu không được bỏ trống");
            }
            else if ($scope.confirmPassword != $scope.customer.password) {
                toastr.error("Mật khẩu không khớp");
            }
            else if (isNullString($scope.customer.email)) {
                toastr.error("Email không được bỏ trống");
            }
            else if (emailIsValid($scope.customer.email) === false) {
                toastr.error("Email không hợp lệ");
            }
            else
            {
                $http.post(preUrl + "/register", $scope.customer, {headers: {'Content-Type': 'application/json'}})
                    .then(function (response) {
                        if (response.data === true) {
                            toastr.error("Tài khoản đã tồn tại");
                        } else {
                            clearData();
                            toastr.success("Đăng ký thành công");
                        }
                    });
            }
        }

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

        $scope.resetPass = function (){

            if (isNullString($scope.customer.username)) {
                toastr.error("Tài khoản đăng nhập không được bỏ trống");
            }
            else if (isNullString($scope.customer.email)) {
                toastr.error("Email không được bỏ trống");
            }
            else if (emailIsValid($scope.customer.email) === false) {
                toastr.error("Email không hợp lệ");
            }else{
                $('#btn_send').attr("disabled", true);
                $http.get(preUrl + "/reset", {params: {username: $scope.customer.username, email: $scope.customer.email}})
                    .then(function (response) {
                        if (!isNullString(response.data)) {
                            console.log(response.data)
                            toastr.success("Vui lòng kiểm tra email của bạn!");
                            clearData();
                            $('#btn_send').attr("disabled", false);
                        } else {
                            toastr.error("Tài khoản hoặc email không đúng");
                            $('#btn_send').attr("disabled", false);
                        }
                    });

            }};

        $scope.changePassword=function () {
            /*var code=$("#modalCustomer").val();*/
            /*$scope.customer.code=code;*/
            if (isNullString($scope.customer.password)) {
                toastr.error("Mật khẩu không được bỏ trống")
            }
            else if ($scope.customer.password.length < 7) {
                toastr.error("Mật khẩu phải lớn hơn 8 ký tự");
            }
            else if (isNullString($scope.confirmPassword)) {
                toastr.error("Xác nhận mật khẩu không được bỏ trống");
            }
            else if ($scope.confirmPassword != $scope.customer.password) {
                toastr.error("Mật khẩu không khớp");
            }else {
                $http.post(preUrl + "/resetPassword", $scope.customer, {headers: {'Content-Type': 'application/json'}})
                    .then(function (response) {
                        if (response.data === true) {
                            clearData();
                            toastr.success("Thay đổi mật khẩu thành công");
                            /*$("#change-password").modal('hide');*/
                            window.location.href=preUrl+"/";
                        } else {
                            toastr.error("Đã có lỗi xảy ra! Vui Lòng thử lại");
                        }
                    });}
        }
        $scope.login=function () {
            if (isNullString($scope.customer.username)) {
                toastr.error("Tài khoản đăng nhập không được bỏ trống");
            } else if (isNullString($scope.customer.password)) {
                toastr.error("Mật khẩu không được bỏ trống")
            }
            else {
                $http.post(preUrl + "/login", $scope.customer, {headers: {'Content-Type': 'application/json'}})
                    .then(function (response) {
                        if (!isNullString(response.data)) {
                            /*$("#login").modal('hide');*/
                            toastr.success("Đăng nhập thành công");
                            window.location.href=preUrl+"/";
                        } else {
                            toastr.error("Tài khoản hoặc mật khẩu không đúng");
                        }
                    });}

        }


        function clearData() {
            $('#birthday').val('');
            $scope.customer = {username:null,email:null,password:null};
            $scope.confirmPassword=null;
            $scope.reset={oldpassword:null,newpassword:null};
            $scope.load={cardType:null,code:null,pin:null,seri:null,valuecard:null}
            /*document.getElementById("disableCardType").disabled = false;
            document.getElementById("disableCode").disabled = false;*/
        }
        $scope.changPass=function () {
            if(isNullString($scope.reset.oldpassword)){
                toastr.error("Mật khẩu cũ không được bỏ trống");
            }else if(isNullString($scope.reset.newpassword)){
                toastr.error("Mật khẩu mới không được bỏ trống");
            } else if ($scope.reset.newpassword.length < 7) {
                toastr.error("Mật khẩu phải lớn hơn 8 ký tự");
            }
            else if (isNullString($scope.confirmPassword)) {
                toastr.error("Xác nhận mật khẩu không được bỏ trống");
            }
            else if ($scope.confirmPassword != $scope.reset.newpassword) {
                toastr.error("Mật khẩu không khớp");
            }else {
                $http.get(preUrl + "/changePassWord", {params: {oldpassword: $scope.reset.oldpassword, newpassword: $scope.reset.newpassword}})
                    .then(function (response) {
                        if (!isNullString(response.data)) {
                            if(response.data=="200"){
                                toastr.success("Đổi password thành công")
                                /*$("#chage").modal();*/
                            }else {
                                toastr.error("Thất bại vui lòng liên hệ với quản trị viên");
                            }
                        }

                    });

            }}


        /*$scope.openLogin = function () {
            clearData();
            $("#login").modal();
        }*/
        $scope.openLoad = function () {
            grecaptcha.reset();
            $scope.checkSD='NO';
            $scope.load.username=$("#userloadcard").val();
            if(isNullString($scope.load.username)){
                toastr.error("Vui lòng đăng nhập trước khi nạp thẻ!");
            }else {
                clearData();
                $("#loadcard").modal();}
        }
       /* $scope.openReset = function () {
            clearData();
            $("#reset-password").modal();
        }*/

        /*$scope.openChange=function () {
            clearData();
            $("#chage").modal();
        }*/
        /*$scope.openRegister = function () {
            clearData();
            $("#register").modal();
        }*/

    }]);