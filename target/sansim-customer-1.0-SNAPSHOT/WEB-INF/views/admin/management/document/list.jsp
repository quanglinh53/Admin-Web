<%@ page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="<%=request.getContextPath()%>/assets/ckeditor/ckeditor.js"></script>
<script src="<%=request.getContextPath()%>/assets/ckfinder/ckfinder.js"></script>
<script src="<%=request.getContextPath()%>/assets/project/admin/mangement/document/list.js"></script>
<script type="text/javascript">
  $("#sansim-status").show();
  setTimeout(function () {
    $("#sansim-status").hide();
  }, 5000);
</script>
<style>
  img {
    width: 100%;
  }

  .red {
    color: red;
  }
</style>
<section id="content" ng-app="sansimso" ng-controller="documentCtrl">
    <section class="vbox">
        <section class="scrollable padder">
            <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
                <li><a href="<%=request.getContextPath()%>/admin"><i class="fa fa-home"></i>&nbsp;Trang
                    chủ</a></li>
                <li><a href="#">Quản lý tài liệu</a></li>
                <li><a href="#">Danh sách</a></li>
            </ul>
            <div class="m-b-md" id="sansim-status">
                <h3 class="m-b-none" style="color: #009900">
                    <c:if test="${success.length()>0}">${success}</c:if>
                </h3>
                <h3 class="m-b-none" style="color:red">
                    <c:if test="${messageError.length()>0}">${messageError}</c:if>
                </h3>
            </div>
            <section class="panel panel-default">
                <header class="panel-heading"><i class="fa fa-caret-square-o-right"></i> Quản lý
                    tài liệu

                </header>
                <div class="text-sm wrapper bg-light lt">

                    <div class="line line-dashed line-lg pull-in"
                         style="clear:both ;border-top:0px"></div>
                    <div class="form-group">

                        <div class="col-sm-6">
                            <label class="col-sm-3 control-label" style="text-align: end;">Tên sản phẩm</label>
                            <div class="col-sm-9">
                                <input ng-model="data.name" name="name" placeholder=""
                                       maxlength="50" my-enter="search()"
                                       class="input-sm form-control"/>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <label class="col-sm-3 control-label" style="text-align: end;">
                                Người bán
                            </label>
                            <div class="col-sm-9">
                                <%--<select ng-model="search.status" class="form-control">
                                    <option value="">Tất cả</option>
                                </select>--%>
                                <input ng-model="data.account" name="account" placeholder=""
                                       maxlength="50" my-enter="search()"
                                       class="input-sm form-control"/>
                            </div>
                        </div>


                    </div>
                    <div class="line line-dashed line-lg pull-in"
                         style="clear:both ;border-top:0px"></div>
                    <div class="form-group text-center">
                        <a ng-click="search()" class="btn btn-info btn-sm ">Tìm kiếm</a>
                    </div>

                </div>

                <div class="table-responsive table-overflow-x-fix">
                    <table id="tbl" class="table table-striped table-bordered m-b-none text-sm">
                        <thead>
                        <tr>
                            <th class="box-shadow-inner small_col text-center">#</th>
                            <th class="box-shadow-inner small_col text-center">Loại sản phẩm</th>
                            <th class="box-shadow-inner small_col text-center">Tên sản phẩm</th>
                            <th class="box-shadow-inner small_col text-center">Giá sản phẩm</th>
                            <th class="box-shadow-inner small_col text-center">Đánh giá</th>
                            <th class="box-shadow-inner small_col text-center">Người bán</th>
                            <th class="box-shadow-inner small_col text-center">Trạng thái</th>
                            <th class="box-shadow-inner small_col text-center">Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="item in page.items track by $index">
                            <td class="align-center truong-text-verticel">{{(page.pageNumber - 1)
                            * page.numberPerPage +
                            $index + 1}}
                            </td>
                            <td class="align-center">Tài liệu</td>
                            <td class="align-center">{{item.title}}</td>
                            <td class="align-center">{{item.price}}</td>
                            <td class="align-center">{{item.rate}}*</td>
                            <td class="align-center">{{item.account.fullname}}</td>
                            <td class="align-center">{{item.status == 0 ? 'Vô hiệu hóa'
                                    : 'Cho phép đăng bài'}}
                            </td>
                            <td class="align-center">
                                <a href="javascript:void(0)" data-toggle="modal"
                                   data-target="#modalConfirm" ng-click="onEdit(item)">
                                    <i class="fa fa-edit"></i>
                                </a>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>
                <footer class="panel-footer">
                    <div class="row">
                        <div class="col-sm-12 text-right text-center-xs">
                            <div class="col-sm-6 text-left">
                                <span>Tổng số <code>{{page.rowCount}}</code> dữ liệu</span>
                            </div>
                            <div class="col-sm-6">
                                <ul class="pagination pagination-sm m-t-none m-b-none">
                                    <li ng-if="page.pageNumber>1"><a href="javascript:void(0)"
                                                                     ng-click="loadPage(1)">«</a>
                                    </li>
                                    <li ng-repeat="item in page.pageList">
                                        <a href="javascript:void(0)" ng-if="item==page.pageNumber"
                                           style="color:mediumvioletred;"> {{item}}</a>
                                        <a href="javascript:void(0)" ng-if="item!=page.pageNumber"
                                           ng-click="loadPage(item)"> {{item}}</a>
                                    </li>
                                    <li ng-if="page.pageNumber<page.pageCount"><a
                                            href="javascript:void(0)"
                                            ng-click="loadPage(page.pageCount)">»</a>
                                    </li>
                                </ul>
                            </div>

                        </div>
                    </div>
                </footer>
            </section>
        </section>
    </section>
    <div class="modal fade" id="modalConfirm" role="dialog" aria-labelledby="myModalLabel1"
         aria-hidden="true">
        <div class="modal-dialog" style="max-width: 500px;">
            <div class="modal-content" style="max-width: 500px;">
                <div class="modal-header" style="padding: 7px;">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h5 class="modal-title" id="myModalLable">Xác nhận</h5>
                </div>

                <div class="modal-body" style="padding: 10px;">
                    <div class="form-group">
                        <label class="control-label" ng-if="item.status==0">Bạn xác nhận vô hiệu hóa
                            bài đăng này?</label>
                        <label class="control-label" ng-if="item.status==1">Bạn xác nhận cho phép
                            bài đăng này?</label>
                    </div>

                </div>
                <div class="modal-footer" style="padding: 10px;">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Hủy bỏ
                    </button>
                    <button ng-click="confirm()" class="btn btn-danger">Đồng ý</button>
                </div>
            </div>
        </div>
    </div>

    <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen"
       data-target="#nav"></a>

</section>

