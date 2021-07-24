<%@ page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.osp.common.Constant" %>

<script src="<%=request.getContextPath()%>/assets/project/admin/mangement/promotion/list.js"></script>

<script type="text/javascript">
  $("#sansim-status").show();
  setTimeout(function () {
    $("#sansim-status").hide();
  }, 5000);
</script>
<section id="content" ng-app="sansimso" ng-controller="promotionCtrl">
    <section class="vbox">
        <section class="scrollable padder">
            <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
                <li><a href="<%=request.getContextPath()%>/admin"><i class="fa fa-home"></i>&nbsp;Trang
                    chủ</a></li>
                <li><a href="#">QL khuyến mại</a></li>
                <li><a href="javascript:void(0)">Danh sách</a></li>
            </ul>
            <section class="panel panel-default">
                <header class="panel-heading"><i class="fa fa-caret-square-o-right"></i>
                    Quản lý khuyến mại
                </header>
                <div class="text-sm wrapper bg-light lt">
                    <form cssClass="form-inline padder" action="list" role="form" theme="simple">
                        <div class="line line-dashed line-lg pull-in"
                             style="clear:both ;border-top:0px"></div>
                        <div class="form-group col-sm-12">

                                <label class="col-sm-2 control-label" style="text-align: end;">Loại dịch vụ</label>
                                <div class="col-sm-4">
                                    <select ng-model="search.type" name="add_org"
                                            class="form-control" style="width: 100%">
                                        <option value="">--Lựa chọn--</option>
                                        <option ng-value="0">Tài liệu</option>
                                        <option ng-value="1">Việc tuyển dụng</option>
                                        </option>
                                    </select>
                                </div>
                            <label class="col-sm-2 control-label" style="text-align: end;">Ngày đăng</label>
                            <div class="col-sm-4">
                                <div class='input-group date' id="selectDate2">
                                    <input type='text' class="form-control datepickerEnter"
                                           name="startDateFrom"
                                           id="startDate2" ng-model="search.ngayDang"
                                           style="width: 100%; height: 60%"
                                           />
                                    <span class="input-group-addon">
                                              <i class="fa fa-calendar"></i>
                                            </span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-sm-12" style="text-align: center" s>
                            <a ng-click="search()" class="btn btn-info btn-sm ">Tìm kiếm</a>
                            <sec:authorize access="hasRole('ROLE_CONTENT_CATEGORY_ADD')">
                                <a class="btn btn-sm btn-primary <%--pull-right--%>"
                                   data-toggle="modal" ng-click="addOrEdit('ADD', null)"
                                   data-target="#addOrEditModal"><i
                                        class="fa fa-plus"></i> Thêm mới</a>
                            </sec:authorize>
                        </div>
                        <div class="line line-dashed line-lg pull-in"
                             style="clear:both ;border-top:0px"></div>
                        <%-- <div class="form-group text-center">
                             <a ng-click="search()" class="btn btn-info btn-sm ">Tìm kiếm</a>
                             <sec:authorize access="hasRole('ROLE_CONTENT_CATEGORY_ADD')">
                                 <a class="btn btn-sm btn-primary pull-right"
                                    href="<%=request.getContextPath()%>/admin/content/category/add"><i class="fa fa-plus"></i> Thêm mới</a>
                             </sec:authorize>
                         </div>--%>
                    </form>
                </div>

                <div class="table-responsive table-overflow-x-fix">
                    <table id="tbl" class="table table-striped table-bordered m-b-none text-sm">
                        <thead>
                        <tr>
                            <th class="box-shadow-inner small_col text-center">#</th>
                            <th class="box-shadow-inner small_col text-center">Mã khuyến mại</th>
                            <th class="box-shadow-inner small_col text-center">Loại dịch vụ</th>
                            <th class="box-shadow-inner small_col text-center">Tiêu đề khuyến mại
                            </th>
                            <th class="box-shadow-inner small_col text-center">Nội dung khuyến mại
                            </th>
                            <th class="box-shadow-inner small_col text-center">Giá trị khuyến mại
                            </th>
                            <th class="box-shadow-inner small_col text-center">Thời gian áp dụng
                            </th>
                            <th class="box-shadow-inner small_col text-center">Ngày tạo</th>
                            <th class="box-shadow-inner small_col text-center">Người tạo</th>
                            <th class="box-shadow-inner small_col text-center action-thead-2-items">
                                Hoạt động
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="item in page.items track by $index">
                            <td class="align-center">{{(page.pageNumber - 1) * page.numberPerPage
                            + $index + 1}}
                            </td>
                            <td class="align-center">{{item.code}}</td>
                            <td class="align-center">{{item.type == 0 ? 'Tài liệu'
                                    : 'Việc tuyển dụng'}}
                            </td>
                            <td class="align-center">{{item.title}}</td>
                            <td class="align-center">{{item.description}}</td>
                            <td class="align-center">{{item.value}}%</td>
                            <td class="align-center">{{item.duration
                            | date:'dd/MM/yyyy HH:mm:ss'}}
                            </td>
                            <td class="align-center">{{item.createdDate | date:'dd/MM/yyyy HH:mm:ss'}}
                            </td>
                            <td class="align-center">{{item.createdBy}}</td>
                            <%--                            <sec:authorize access="hasAnyRole('ROLE_CONTENT_CATEGORY_EDIT','ROLE_CONTENT_CATEGORY_DELETE')">--%>
                            <td class="align-center">
                                <%--                                    <sec:authorize access="hasAnyRole('ROLE_CONTENT_CATEGORY_EDIT')">--%>
                                <a href="javascript:void(0)" data-toggle="modal"
                                   data-target="#addOrEditModal" ng-click="addOrEdit('EDIT', item)">
                                    <i class="fa fa-edit"></i>
                                </a>
                                <%--                                    </sec:authorize>--%>
                                <%--                                    <sec:authorize access="hasAnyRole('ROLE_CONTENT_CATEGORY_DELETE')">--%>
                                <a href="javascript:void(0)" data-toggle="modal"
                                   data-target="#deleteItem" ng-click="onDelete(item.id)">
                                    <i class="fa fa-trash"></i>
                                </a>
                                <%--                                    </sec:authorize>--%>
                            </td>
                            <%--                            </sec:authorize>--%>
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
                                            ng-click="loadPage(page.pageCount)">»</a></li>
                                </ul>
                            </div>

                        </div>
                    </div>
                </footer>
            </section>
        </section>
    </section>
    <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen"
       data-target="#nav"></a>
    <div class="modal fade" id="deleteItem" role="dialog" aria-labelledby="myModalLabel1"
         aria-hidden="true">
        <div class="modal-dialog" style="max-width: 500px;">
            <div class="modal-content" style="max-width: 500px;">
                <div class="modal-header" style="padding: 7px;">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h5 class="modal-title" id="myModalLable">Xóa</h5>
                </div>
                <div class="modal-body" style="padding: 10px;">
                    <div class="form-group">
                        <label class="control-label">Bạn xác nhận xóa tên hình thức giao dịch
                            này?</label>
                    </div>

                </div>
                <div class="modal-footer" style="padding: 10px;">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Hủy bỏ
                    </button>
                    <button ng-click="delete()" class="btn btn-danger">Xóa</button>
                </div>

            </div>
        </div>
    </div>

    <div class="modal fade" id="addOrEditModal" role="dialog" aria-labelledby="myModalLabel1"
         aria-hidden="true">
        <div class="modal-dialog" style="max-width: 700px;">
            <div class="modal-content" style="max-width: 700px;">
                <div class="modal-header" style="padding: 7px;">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h5 class="modal-title" ng-if="action == 'ADD'">Thêm mới</h5>
                    <h5 class="modal-title" ng-if="action == 'EDIT'">Cập nhật</h5>
                </div>
                <div class="modal-body" style="padding: 10px;">
                    <div class="panel-body">
                        <div class="form-group col-sm-12">

                            <label class="col-sm-4 control-label" style="line-height: 30px">
                                Tiêu đề khuyến mại<span style="color:red ">*</span>
                            </label>
                            <div class="col-sm-8">
                                <input id="title"
                                       maxlength="100"
                                       ng-model="data.title"
                                       style="width:100%;"
                                       class="form-control valid_form"/>
                            </div>
                        </div>
                        <div class="form-group  col-sm-12">
                            <label class="col-sm-4 control-label" style="line-height: 30px">
                                Nội dung khuyến mại<span style="color:red ">*</span>
                            </label>
                            <div class="col-sm-8">
                                <textarea id="description"
                                          rows="3"
                                          ng-model="data.description"
                                          style="width:100%;"
                                          class="form-control valid_form">
                                </textarea>
                            </div>
                        </div>
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label" style="line-height: 30px">
                                Giá trị khuyến mại<span style="color:red ">*</span>
                            </label>
                            <div class="col-sm-8">
                                <input id="value" placeholder="0-99%"
                                       type="number" min="0" max="99" size="1" maxlength="2"
                                       ng-model="data.value"
                                       style="width:100%;"
                                       class="form-control valid_form"/>
                            </div>
                        </div>
                        <div class="col-sm-12 form-group">
                            <label class="col-sm-4 control-label"
                                   style="line-height: 30px">Loại dịch vụ<span
                                    style="color:red ">*</span>
                            </label>
                            <div class="col-sm-8">
                                <select ng-model="data.type" name="add_org" id="add_org"
                                        class="form-control" style="width: 100%">
                                    <option value="">--Lựa chọn--</option>
                                    <option ng-value="0">Tài liệu</option>
                                    <option ng-value="1">Việc tuyển dụng</option>
                                    </option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">
                                Ngày giao dịch<span style="color:red ">*</span>
                            </label>
                            <div class="col-sm-8">
                                <div class='input-group date' id="selectDate1">
                                    <input type='text' class="form-control datepickerEnter"
                                           name="startDateFrom"
                                           id="startDate" ng-model="duration"
                                           style="width: 100%; height: 60%"
                                           ngModelChange="modelChanged($event)"/>
                                    <span class="input-group-addon">
                                              <i class="fa fa-calendar"></i>
                                            </span>
                                </div>
                            </div>
                        </div>


                    </div>

                </div>
                <div class="modal-footer" style="padding: 10px;">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Hủy bỏ
                    </button>
                    <button ng-if="action == 'ADD'" ng-click="add()" class="btn btn-primary">Thêm
                    </button>
                    <button ng-if="action == 'EDIT'" ng-click="edit()" class="btn btn-primary">Cập
                        nhật
                    </button>
                </div>

            </div>
        </div>
    </div>
</section>

