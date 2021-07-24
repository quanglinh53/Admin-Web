<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/4/2020
  Time: 1:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="<%=request.getContextPath()%>/assets/note/js/croppie/croppie.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/note/js/croppie/croppie.css" type="text/css"/>

<script src="<%=request.getContextPath()%>/assets/project/public/profile.js"></script>
<section id="content" ng-app="sansimso" ng-controller="profileController">
    <input type="hidden" id="sessionData" value="${customer}"/>
    <section class="vbox background-white">
        <section class="scrollable padder">
            <ul class="bg-light breadcrumb no-border no-radius b-b b-light pull-in">
                <li><a href="<%=request.getContextPath()%>/"><i class="fa fa-home"></i>&nbsp;Trang chủ</a></li>
                <li><a href="javascript:void(0)">Thông tin tài khoản</a></li>
            </ul>
            <div id="msgId" class="m-b-md" style="display: none;">
                <script>
                    $(document).ready(function () {
                        /*$("#msgId").addClass("alert-error");*/
                    });
                </script>
                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span>
                <%--<div class="title-message">{{logger}}</div>--%>
            </div>

            <section class="panel panel-default" style="margin-bottom: 500px;">
                <header class="panel-heading">
                    <a href="javascript:void(0)"><h4 class="panel-title font-bold" data-toggle="collapse"
                                                     data-target="#collapseTwo">
                        THÔNG TIN TÀI KHOẢN
                    </h4></a>
                </header>
                <div id="collapseTwo" class="panel-collapse collapse in" aria-expanded="true">
                    <div class="panel-body background-xam">

                        <form id="frmUpdateUser" class="form-horizontal" autocomplete="off">
                            <div class="col-md-12 p-l-0">
                                <div class="col-md-6">

                                    <div class="form-group">
                                        <label class="col-md-4 control-label text-dark">Tài khoản đăng nhập</label>
                                        <div class="col-md-8 control-label text-dark">{{customer.username}}</div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-4 control-label text-dark">Họ tên</label>
                                        <div class="col-md-8">
                                            <input ng-model="customer.fullName" class="form-control input-sm"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-4 control-label text-dark required">Email</label>
                                        <div class="col-md-8">
                                            <input ng-model="customer.email" class="form-control input-sm"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-4 control-label text-dark">Mật khẩu</label>
                                        <div class="col-md-8 control-label">
                                            <a href="javascript:void(0);" data-toggle="modal"
                                               data-target="#changePassModal"
                                               style="color: blue;text-decoration: underline;">Đổi mật khẩu</a>
                                        </div>
                                    </div>



                                    <div class="form-group">
                                        <label class="col-md-4 control-label text-dark">Ngày sinh</label>
                                        <div class="col-md-8">
                                            <input id="birthday" ng-model="birthdayDate" type="date" class="input-sm <%--datepicker-input--%> form-control" size="16" value="12-02-2013" data-date-format="dd-mm-yyyy" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-4 control-label text-dark">Giới tính</label>
                                        <div class="col-md-8">
                                            <select name="account" ng-model="customer.sex" class="form-control m-b">
                                                <option value="1" ng-selected="customer.sex==1">Nam</option>
                                                <option value="0" ng-selected="customer.sex==0">Nữ</option>
                                            </select>
                                        </div>
                                    </div>

                                </div>

                                <div class="col-md-6">
                                    <center>
                                        <div style="width: 270px;border: solid #d4d4d4 1px">
                                            <div class="profile_pic" id="profile_pic">

                                                <c:if test="${sessionScope['customer'].linkFile!=null && sessionScope['customer'].linkFile!=''}">
                                                    <img style="margin: 10px;max-width: 250px;height: 250px"
                                                         src="<%=request.getContextPath()%>${customer.linkFile}" alt="..."
                                                         class="img-circle profile_img">
                                                </c:if>

                                                <c:if test="${sessionScope['customer'].linkFile==null || sessionScope['customer'].linkFile==''}">
                                                    <img style="margin: 10px;max-width: 250px;height: 250px"
                                                         src="<%=request.getContextPath()%>/assets/images/user.png" alt="..."
                                                         class="img-circle profile_img">
                                                </c:if>
                                            </div>
                                        </div>
                                        <button style="margin: 10px 0px;" onclick="setStyleImageCenter();" type="button"
                                                class="btn btn-primary" data-toggle="modal"
                                                data-target="#myModalChooseFile">
                                            Cập nhật ảnh đại diện
                                        </button>
                                    </center>
                                    <!-- Modal -->
                                    <div class="modal fade" id="myModalChooseFile" role="dialog">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                        <span aria-hidden="true">&times;</span></button>
                                                    <h4 class="modal-title">Cập nhật ảnh đại diện</h4>
                                                </div>
                                                <div class="modal-body">

                                                    <div class="row">
                                                        <div style="top:-50px;">
                                                            <div class="col-md-12 text-center">
                                                                <div id="upload-demo"></div>
                                                            </div>
                                                            <label for="upload"
                                                                   style="cursor:pointer;position: absolute;top: 280px;right:143px;z-index: 100;margin-right: 5px;margin-bottom: 5px">
                                                                <img style="width:40px;height:40px;"
                                                                     src="<%=request.getContextPath()%>/assets/images/camera.png"/>
                                                            </label>
                                                            <input type="file" id="upload" value="${customer.linkFile}"
                                                                   style="display: none">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">
                                                        Hủy
                                                    </button>
                                                    <button type="button" class="btn btn-primary"
                                                            ng-click="uploadAvatar();">
                                                        Lưu ảnh đại diện
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-12 text-center" style="padding-top: 30px;">
                                <button type="button" class="btn btn-danger btn-sm btn-s-sm"
                                        ng-click="updateCustomer();">
                                    <i class="fa fa-save"></i> Lưu
                                </button>
                                <button type="button" class="btn btn-gray btn-sm btn-s-sm" ng-click="back();"
                                        style="margin-left: 10px;">
                                    Hủy bỏ
                                </button>
                            </div>

                        </form>

                    </div>
                </div>
            </section>

        </section>
    </section>


    <div class="modal fade" id="changePassModal" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
        <div class="modal-dialog" <%--style="max-width: 1000px;"--%>>
            <div class="modal-content" <%--style="max-width: 1000px;"--%>>
                <div class="modal-header" style="padding: 7px;">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h5 class="modal-title" id="modalDetailSocialTopic">Thay đổi mật khẩu</h5>
                </div>
                <div theme="simple" class="form-horizontal">

                    <div class="col-md-12">

                        <div class="form-group" style="padding-top: 15px">
                            <label class="col-sm-3 control-label required">Mật khẩu cũ</label>
                            <div class="col-sm-9">
                                <input id="password" ng-model="reset.oldpassword" type="password"
                                       class="form-control input-sm"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label required">Mật khẩu mới</label>
                            <div class="col-sm-9">
                                <input id="newPassword" ng-model="reset.newpassword" type="password"
                                       class="form-control input-sm"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label required">Xác nhận mật khẩu mới</label>
                            <div class="col-sm-9">
                                <input id="rePassword" ng-model="confirmPassword" type="password"
                                       class="form-control input-sm"/>
                            </div>
                        </div>

                    </div>

                </div>
                <div class="modal-footer" style="padding: 10px;">
                    <div class="center">
                        <button type="button" class="btn btn-s-md btn-default"
                                data-dismiss="modal">Hủy bỏ
                        </button>
                        <button type="button" ng-click="changPass()" class="btn btn-s-md btn-primary">Lưu</button>
                    </div>

                </div>
            </div>
        </div>
    </div>
    </div>

</section>
<script>
    $("#trang-chu").addClass("active");

    var setStyleImageCenter_ = 0;

    function setStyleImageCenter() {
        if (setStyleImageCenter_ == 0) {
            setStyleImageCenter_++;
            $(".croppie-container .cr-image").attr("style", "transform: translate3d(91.2031px, 134px, 0px) scale(50); transform-origin: 58.7969px 16px;");
        }
    }
</script>
