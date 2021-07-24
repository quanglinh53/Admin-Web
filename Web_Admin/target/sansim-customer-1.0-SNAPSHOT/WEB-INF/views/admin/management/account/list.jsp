<%@ page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="<%=request.getContextPath()%>/assets/ckeditor/ckeditor.js"></script>
<script src="<%=request.getContextPath()%>/assets/ckfinder/ckfinder.js"></script>
<script src="<%=request.getContextPath()%>/assets/project/admin/mangement/account/list.js"></script>
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
<section id="content" ng-app="sansimso" ng-controller="accountListCtrl">
    <section class="vbox">
        <section class="scrollable padder">
            <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
                <li><a href="<%=request.getContextPath()%>/admin"><i class="fa fa-home"></i>&nbsp;Trang
                    chủ</a></li>
                <li><a href="#">Quản lý khách hàng</a></li>
                <li><a href="javascript:void(0)">Danh sách</a></li>
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
                    khách hàng

                </header>
                <div class="text-sm wrapper bg-light lt">
                    <form cssClass="form-inline padder" action="list" role="form" theme="simple">

                        <div class="line line-dashed line-lg pull-in"
                             style="clear:both ;border-top:0px"></div>
                        <div class="form-group">

                            <div class="col-sm-6">
                                <label class="col-sm-3 control-label" style="text-align: end;">Tên
                                    khách hàng</label>
                                <div class="col-sm-9">
                                    <input ng-model="search.n"
                                           class="input-sm form-control"/>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <label class="col-sm-3 control-label" style="text-align: end;">Loại
                                    khách hàng</label>
                                <div class="col-sm-9">
                                    <select ng-model="search.s" class="form-control">
                                        <option value="">Tất cả</option>
                                    </select>
                                </div>
                            </div>


                        </div>
                        <div class="line line-dashed line-lg pull-in"
                             style="clear:both ;border-top:0px"></div>
                        <div class="form-group text-center">
                            <a ng-click="search()" class="btn btn-info btn-sm ">Tìm kiếm</a>
                            <sec:authorize access="hasRole('ROLE_CONTENT_ARTICLE_VIEW')">
                            <a class="btn btn-sm btn-primary <%--pull-right--%>"
                               ng-click="modalADD()"><i
                                    class="fa fa-plus"></i> Tạo tài khoản ảo</a>
                            </sec:authorize>

                    </form>
                </div>

                <div class="table-responsive table-overflow-x-fix">
                    <table id="tbl" class="table table-striped table-bordered m-b-none text-sm">
                        <thead>
                        <tr>
                            <th class="box-shadow-inner small_col text-center">#</th>
                            <th class="box-shadow-inner small_col text-center">Email</th>
                            <th class="box-shadow-inner small_col text-center">Tên đầy đủ</th>
                            <th class="box-shadow-inner small_col text-center">Ngày đăng ký</th>
                            <th class="box-shadow-inner small_col text-center">Là khách</th>
                            <th class="box-shadow-inner small_col text-center">Kích hoạt VIP</th>
                            <th class="box-shadow-inner small_col text-center">Hạn</th>
                            <th class="box-shadow-inner small_col text-center">Là người bán</th>
                            <th class="box-shadow-inner small_col text-center">Hạn</th>
                            <th class="box-shadow-inner small_col text-center">Là tài khoản ảo</th>
                            <th class="box-shadow-inner small_col text-center">Số lần lên top</th>
                            <th class="box-shadow-inner small_col text-center">Trạng thái</th>
                            <th class="box-shadow-inner small_col text-center">Số dư</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="item in page.items track by $index">
                            <td class="align-center truong-text-verticel">{{(page.pageNumber - 1)
                            * page.numberPerPage +
                            $index + 1}}
                            </td>
                            <td class="align-center">{{item.email}}</td>
                            <td class="align-center">{{item.fullname}}</td>
                            <td class="align-center">{{item.createdDate
                            | date:'dd/MM/yyyy HH:mm:ss'}}
                            </td>
                            <td class="align-center">{{item.isCustomer == 1 ? 'Có' : 'Không'}}</td>
                            <td class="align-center">{{item.vipStatus == 0 ? 'Chưa' : 'Đã'}}</td>
                            <td class="align-center">{{item.vipDuration
                            | date:'dd/MM/yyyy HH:mm:ss'}}
                            </td>
                            <td class="align-center">{{item.isSeller == 1 ? 'Có' : 'Không'}}</td>
                            <td class="align-center">0</td>
                            <td class="align-center">{{item.virtualAccount == 1 ? 'Có' : 'Không'}}
                            </td>
                            <td class="align-center">{{item.timesToTop}}</td>
                            <td class="align-center">
                                {{item.status == 0 ? 'Hoạt động' : 'Bị khóa'}}
                                <a href="javascript:void(0)" style="text-decoration: underline" ng-if="item.status == 0" ng-click = "onLockAccount(item.id, 'lock')">Khóa</a>
                                <a href="javascript:void(0)" style="text-decoration: underline" ng-if="item.status == 1" ng-click = "onLockAccount(item.id, 'unlock')">Kích hoạt</a>
                            </td>
                            <td class="align-center">{{item.wallet}}</td>
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
    <div class="modal fade" id="AddNew" role="dialog" aria-labelledby="myModalLabel1"
         aria-hidden="true"
         data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content" style="width:800px;">
                <div class="modal-header"
                     style="padding: 7px;background-color: #027DB4;;border-radius: 4px 4px 0 0;">
                    <button type="button" style="color: red;" class="close" data-dismiss="modal"
                            aria-hidden="true">
                        &times;
                    </button>

                    <h6 class="modal-title font-weight-bold" id="myModalLable1" style="
                    background-color: #027DB4;
                    border-radius: 4px 4px 0 0;
                    color: white;" ng-if="labelAdd=='ADD'">Thêm mới</h6>
                    <h6 class="modal-title font-weight-bold" style="
                    background-color: #027DB4;
                    border-radius: 4px 4px 0 0;
                    color: white;" ng-if="labelAdd=='EDIT'">Sửa</h6>

                </div>


                <div style="text-align: center;    text-align: center;
                 padding-top: 10px;
                 padding-bottom: 10px;
                 font-size: 19px;
                 color: #027DB4;"></div>
                <form id="form-save">
                    <div class="modal-body" style="padding: 10px;">
                        <section class="panel panel-default">
                            <div class="row" style="padding-top: 1%; padding-bottom: 1%">
                                <div class="col-sm-12">
                                    <div class="col-sm-2">
                                        <label>Email<span
                                                class="red"> *</span></label>
                                    </div>
                                    <div class="col-sm-10">
                                        <input ng-model="account.email" class="form-control"
                                               type="text"
                                               placeholder="" required
                                               data-parsley-trigger="change"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="padding-top: 1%; padding-bottom: 1%">
                                <div class="col-sm-12">
                                    <div class="col-sm-2">
                                        <label>Tên đầy đủ<span
                                                class="red"> *</span></label>
                                    </div>
                                    <div class="col-sm-10">
                                        <input ng-model="account.fullname" class="form-control"
                                               type="text"
                                               placeholder="" required
                                               data-parsley-trigger="change"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="padding-top: 1%; padding-bottom: 1%">
                                <div class="col-sm-12">
                                    <div class="col-sm-2">
                                        <label>Là khách<span
                                                class="red"> *</span></label>
                                    </div>
                                    <div class="col-sm-10">
                                        <label>
                                            <input type="radio" ng-model="account.isCustomer" ng-value="1">
                                            Có
                                        </label><br/>
                                        <label>
                                            <input type="radio" ng-model="account.isCustomer"
                                                   ng-value="0">
                                            Không
                                        </label><br/>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="padding-top: 1%; padding-bottom: 1%">
                                <div class="col-sm-12">
                                    <div class="col-sm-2">
                                        <label>Là người bán<span
                                                class="red"> *</span></label>
                                    </div>
                                    <div class="col-sm-10">
                                        <label>
                                            <input type="radio" ng-model="account.isSeller" ng-value="1">
                                            Có
                                        </label><br/>
                                        <label>
                                            <input type="radio" ng-model="account.isSeller"
                                                   ng-value="0">
                                            Không
                                        </label><br/>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </form>
                <div class="modal-footer">
                    <div class="row" style="text-align: center;">

                        <button  data-toggle="modal" ng-click="add()"
                                class="btn btn-primary"><i
                                class="fa fa-save"></i>Lưu
                        </button>

                        <button type="button" class="btn btn-danger" data-dismiss="modal"><i
                                class="fa fa-times"></i>Hủy
                        </button>
                    </div>
                </div>

            </div>
        </div>

    </div>
    <div class="modal fade" id="modalLock" role="dialog" aria-labelledby="myModalLabel1"
         aria-hidden="true">
        <div class="modal-dialog" style="max-width: 500px;">
            <div class="modal-content" style="max-width: 500px;">
                <div class="modal-header" style="padding: 7px;">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h5 class="modal-title" ng-if="action == 'lock' ">Khóa tài khoản</h5>
                    <h5 class="modal-title" ng-if="action == 'unlock' ">Mở khóa tài khoản</h5>
                </div>

                <div class="modal-body" style="padding: 10px;">
                    <div class="form-group">
                        <label class="control-label">Bạn chắc chắn lưu thay đổi này hay
                            không?</label>
                    </div>

                </div>
                <div class="modal-footer" style="padding: 10px;">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Hủy bỏ
                    </button>
                    <button ng-click="lockAccount()" class="btn btn-danger">Đồng ý</button>
                </div>
            </div>
        </div>
    </div>

    <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen"
       data-target="#nav"></a>
    <sec:authorize access="hasAnyRole('ROLE_CONTENT_ARTICLE_DELETE')">
        <div class="modal fade" id="modalxoa" role="dialog" aria-labelledby="myModalLabel1"
             aria-hidden="true">
            <div class="modal-dialog" style="max-width: 500px;">
                <div class="modal-content" style="max-width: 500px;">
                    <div class="modal-header" style="padding: 7px;">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h5 class="modal-title" id="myModalLable">Xóa bài viết</h5>
                    </div>

                    <div class="modal-body" style="padding: 10px;">
                        <div class="form-group">
                            <label class="control-label">Bạn xác nhận xóa bài viết này?</label>
                        </div>

                    </div>
                    <div class="modal-footer" style="padding: 10px;">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Hủy bỏ
                        </button>
                        <button ng-click="comfimXoa()" class="btn btn-danger">Xóa</button>
                    </div>
                </div>
            </div>
        </div>
    </sec:authorize>

</section>

