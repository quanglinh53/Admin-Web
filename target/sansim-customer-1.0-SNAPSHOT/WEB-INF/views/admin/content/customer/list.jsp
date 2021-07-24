<%@ page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<script src="<%=request.getContextPath()%>/assets/project/admin/content/customer/list.js"></script>
<script type="text/javascript">
    $("#sansim-status").show();
    setTimeout(function () {
        $("#sansim-status").hide();
    }, 5000);
</script>
<style>
    .switch2 {
        position: relative;
        display: inline-block;
        width: 60px;
        height: 34px;
    }

    .switch2 input {
        opacity: 0;
        width: 0;
        height: 0;
    }

    .slider2 {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #ccc;
        -webkit-transition: .4s;
        transition: .4s;
        border-radius: 34px;
    }

    .slider2:before {
        position: absolute;
        content: "";
        height: 26px;
        width: 26px;
        left: 4px;
        bottom: 4px;
        background-color: white;
        -webkit-transition: .4s;
        transition: .4s;
        border-radius: 34px;
    }

    input:checked + .slider2 {
        background-color: #2196F3;
    }

    input:focus + .slider2 {
        box-shadow: 0 0 1px #2196F3;
    }

    input:checked + .slider2:before {
        -webkit-transform: translateX(26px);
        -ms-transform: translateX(26px);
        transform: translateX(26px);
    }

</style>
<section id="content" ng-app="sansimso" ng-controller="newsListCtrl">
    <section class="vbox">
        <section class="scrollable padder">
            <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
                <li><a href="<%=request.getContextPath()%>/admin"><i class="fa fa-home"></i>&nbsp;Trang chủ</a></li>
                <li><a href="#">Quản lý nội dung</a></li>
                <li><a href="#">Quản lý bài viết</a></li>
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
                <header class="panel-heading"><i class="fa fa-caret-square-o-right"></i>Quản lý danh sách người chơi

                </header>
                <div class="text-sm wrapper bg-light lt">
                    <form cssClass="form-inline padder" action="list" role="form" theme="simple">

                        <div class="line line-dashed line-lg pull-in" style="clear:both ;border-top:0px"></div>
                        <div class="form-group">

                            <div class="col-md-6">
                                <label class="col-sm-2 control-label" style="text-align: end;">Tiêu đề</label>
                                <div class="col-sm-10">
                                    <input ng-model="name" name="name" placeholder="" maxlength="50" my-enter="search()"
                                           class="input-sm form-control"/>
                                </div>
                            </div>


                        </div>
                        <div class="line line-dashed line-lg pull-in" style="clear:both ;border-top:0px"></div>
                        <div class="form-group text-center">
                            <a ng-click="search()" class="btn btn-info btn-sm ">Tìm kiếm</a>
                            <sec:authorize access="hasRole('ROLE_CONTENT_ARTICLE_VIEW')">
                            <a class="btn btn-sm btn-primary &lt;%&ndash;pull-right&ndash;%&gt;"
                               href="<%=request.getContextPath()%>/admin/content/article/add"><i
                                    class="fa fa-plus"></i> Thêm mới</a>
                            </sec:authorize>

<%--
                        <div class="line line-dashed line-lg pull-in" style="clear:both ;border-top:0px"></div>
                        <div class="form-group">
                            <div class="col-md-4">
                                &lt;%&ndash;<label class="col-sm-4 control-label">Tiêu đề</label>&ndash;%&gt;

                                    Tiêu đề
                                    <input ng-model="searchCondition.name" name="name" placeholder="" maxlength="50" my-enter="search()"
                                           class="input-sm form-control"/>

                            </div>

                            <div class="col-md-4">
                                &lt;%&ndash;<label class="col-sm-4 control-label">Tiêu đề</label>&ndash;%&gt;

                                    Chuyên mục
                                    <select name="categoryId" class="select2 form-control" id="active-select"
                                            &lt;%&ndash;style="min-width:200px"&ndash;%&gt; ng-model="searchCondition.categoryId">
                                        <option value="">Tất cả</option>
                                        <option ng-repeat="item in listCate" value="{{item.id}}">{{item.name}}</option>
                                    </select>

                            </div>

                        </div>
                        <div class="line line-dashed line-lg pull-in" style="clear:both ;border-top:0px"></div>
                        <div class="form-group text-center">
                            <a ng-click="search()" class="btn btn-info btn-sm ">Tìm kiếm</a>
                            <sec:authorize access="hasRole('ROLE_CONTENT_ARTICLE_VIEW')">
                                <a class="btn btn-sm btn-primary &lt;%&ndash;pull-right&ndash;%&gt;"
                                   href="<%=request.getContextPath()%>/admin/content/article/add"><i
                                        class="fa fa-plus"></i> Thêm mới</a>
                            </sec:authorize>
                        </div>--%>
                    </form>
                </div>
                <sec:authorize access="hasAnyRole('ROLE_CUSTOMER_BLOCK')">
                    <label class="switch2">
                        <input type="checkbox">
                        <span class="slider2"></span>
                    </label>

                </sec:authorize>
                <div class="table-responsive table-overflow-x-fix">
                    <table id="tbl" class="table table-striped table-bordered m-b-none text-sm">
                        <thead>
                        <tr>
                            <th class="box-shadow-inner small_col text-center" style="width: 20px;">#</th>
                            <th class="box-shadow-inner small_col text-center" style="width: 40%">email</th>
                            <th class="box-shadow-inner small_col text-center" style="width: 40%">Tài khoản</th>
                            <th class="box-shadow-inner small_col text-center" style="width: 40%">Ngày tạo</th>
                            <sec:authorize
                                    access="hasAnyRole('ROLE_CONTENT_ARTICLE_EDIT','ROLE_CONTENT_ARTICLE_DELETE')">
                                <th class="box-shadow-inner small_col text-center action-thead-3-items">Hoạt động</th>
                            </sec:authorize>
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="item in page.items track by $index">
                            <td class="align-center" style="width: 20px;">{{(page.pageNumber-1)*page.numberPerPage + $index+1}}</td>
                            <td class="align-center"><a
                                    href="<%=request.getContextPath()%>/admin/content/article/detail/{{item.id}}">{{item.username}}</a>
                            </td>
                            <td class="align-center"><a
                                    href="<%=request.getContextPath()%>/admin/content/article/detail/{{item.id}}">{{item.email}}</a>
                            </td>
                            <td class="align-center">{{item.gendate | date:'dd/MM/yyyy HH:mm:ss'}}</td>
                            <sec:authorize
                                    access="hasAnyRole('ROLE_CUSTOMER_BLOCK')">
                                <td class="align-center">

                                    <sec:authorize access="hasAnyRole('ROLE_CUSTOMER_BLOCK')">
                                        <label class="switch2">
                                            <input type="checkbox">
                                            <span class="slider2"></span>
                                        </label>

                                    </sec:authorize>
                                    
                                </td>
                            </sec:authorize>
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
                                                                     ng-click="loadPage(1)">«</a></li>
                                    <li ng-repeat="item in page.pageList">
                                        <a href="javascript:void(0)" ng-if="item==page.pageNumber"
                                           style="color:mediumvioletred;"> {{item}}</a>
                                        <a href="javascript:void(0)" ng-if="item!=page.pageNumber"
                                           ng-click="loadPage(item)"> {{item}}</a>
                                    </li>
                                    <li ng-if="page.pageNumber<page.pageCount"><a href="javascript:void(0)"
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
    <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen" data-target="#nav"></a>
    <sec:authorize access="hasAnyRole('ROLE_CONTENT_ARTICLE_DELETE')">
        <div class="modal fade" id="modalxoa" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
            <div class="modal-dialog" style="max-width: 500px;">
                <div class="modal-content" style="max-width: 500px;">
                    <div class="modal-header" style="padding: 7px;">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h5 class="modal-title" id="myModalLable">Xóa bài viết</h5>
                    </div>

                        <div class="modal-body" style="padding: 10px;">
                            <div class="form-group">
                                <label class="control-label">Bạn xác nhận xóa bài viết này?</label>
                            </div>

                        </div>
                        <div class="modal-footer" style="padding: 10px;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Hủy bỏ</button>
                            <button ng-click="modalxoa()" class="btn btn-danger">Xóa</button>
                        </div>
                </div>
            </div>
        </div>
    </sec:authorize>
</section>
<script>
    $("#deleteAd").click(function(){
        var id=$(this).data('item.id');
    });
</script>
