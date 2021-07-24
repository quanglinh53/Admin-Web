<%@ page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<section id="content">
    <section class="vbox">
        <section class="scrollable padder">
            <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
                <li><a href="<%=request.getContextPath()%>/admin"><i class="fa fa-home"></i>&nbsp;Trang chủ</a></li>
                <li><a href="#">Quản lý tài khoản</a></li>
                <li><a href="javascript:void(0)">Thêm tài khoản</a></li>
            </ul>
            <div class="m-b-md">
               <%-- <h3 class="m-b-none">Thêm mới tài khoản </h3><br/>--%>
                <span style="color:red">${messageError}</span>
            </div>

            <section class="panel panel-default">
                <header class="panel-heading"><i class="fa fa-caret-square-o-right"></i> Thêm mới tài khoản</header>
                <div class="panel-body" style="min-height: 600px;">
                    <form method="post" action="add" theme="simple"  enctype="multipart/form-data" class="form-horizontal" cssStyle="" validate="true">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="line-height: 30px">Tài khoản <span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <div class="input-group m-b">
                                        <span class="input-group-addon">
                                            <i class="fa fa-user" aria-hidden="true"></i>
                                        </span>
                                    <input name="username" maxlength="100" style="width:100%;" value="${user.username}"
                                                 placeholder="Tài khoản" class="form-control"/>

                                </div>
                                <form:errors cssStyle="color: red" path="user.username" />
                            </div>
                        </div>
                        <div class="line line-dashed line-lg pull-in"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="line-height: 30px">Mật khẩu <span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <div class="input-group m-b">
                                        <span class="input-group-addon">
                                            <i class="fa fa-lock"></i>

                                        </span>
                                    <input type="password" name="password" placeholder="Mật khẩu" maxlength="50" style="width:100%;" value="${user.password}"
                                                 class="form-control"/>
                                </div>
                                <form:errors style="color: red" path="user.password" />
                            </div>
                        </div>
                        <div class="line line-dashed line-lg pull-in"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Xác nhận mật khẩu <span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <div class="input-group m-b">
                                        <span class="input-group-addon">
                                            <i class="fa fa-lock"></i>
                                        </span>
                                    <input type="password" name="confirmPassword" maxlength="50" style="width:100%;" value="${confirmPassword}" placeholder="Xác nhận mật khẩu" class="form-control" />
                                </div>
                                <span style="color:red">${messagePassword}</span>
                            </div>
                        </div>
                        <div class="line line-dashed line-lg pull-in"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="line-height: 30px">Họ tên <span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <div class="input-group m-b">
                                        <span class="input-group-addon">
                                            <i class="fa fa-envelope" style="font-size: 11px" aria-hidden="true"></i>
                                        </span>
                                    <input name="fullName" placeholder="Họ tên" value="${user.fullName}" style="width:100%;" class="form-control"/>
                                </div>
                                <form:errors style="color: red" path="user.fullName" />
                            </div>
                        </div>
                        <div class="line line-dashed line-lg pull-in"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Mô tả</label>
                            <div class="col-sm-10">
                                <div class="input-group m-b">
                                        <span class="input-group-addon">
                                            <i class="fa fa-pencil" aria-hidden="true" style="font-size: 10px"></i>
                                        </span>
                                    <input name="description" value="${user.description}" maxlength="200" cssStyle="width:100%;" placeholder="Mô tả" class="form-control" />
                                </div>

                            </div>
                        </div>


                        <div class="line line-dashed line-lg pull-in" style="clear:both ;margin-bottom: 50px"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-5">
                                <a href="<%=request.getContextPath()%>/admin/system/user/list" class="btn btn-default">Hủy bỏ</a>
                                <button type="submit" data-loading-text="Thêm mới" class="btn btn-primary">Thêm mới</button>
                            </div>
                        </div>
                    </form>

                </div>
            </section>
        </section>
        <footer class="footer bg-white b-t b-light"><small>Cổng dịch vụ công chứng &copy; 2019</small></footer>
    </section>
    <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen" data-target="#nav"></a>
</section>
