<%@ page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<section id="content">
    <section class="vbox">
        <section class="scrollable padder">
            <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
                <li><a href="<%=request.getContextPath()%>/admin"><i class="fa fa-home"></i>&nbsp;Trang chủ</a></li>
                <li><a href="#">Quản trị viên</a></li>
                <li><a href="javascript:void(0)">Danh sách</a></li>
            </ul>
            <div class="m-b-md"><h3 class="m-b-none" id="sansim-status" style="color: #009900"><c:if test="${success.length()>0}">${success}</c:if></h3>
            </div>

            <section class="panel panel-default">
                <header class="panel-heading"><i class="fa fa-caret-square-o-right"></i> Tài khoản quản trị viên

                </header>
                <div class="text-sm wrapper bg-light lt">
                    <form cssClass="form-inline padder" action="list" role="form" theme="simple" >
                        <div class="form-group">
                            <div class="col-md-6">
                                <div class="col-sm-8">
                                    <input name="filterUsername"  placeholder="Username" maxlength="50" value="${filterUsername}" class="input-sm form-control"/>
                                </div>
                                <div class="col-sm-4"><button type="submit" class="btn btn-info btn-sm">Tìm kiếm</button></div>
                            </div>
                            <div class="col-md-6">
                                <sec:authorize access="hasRole('ROLE_SYSTEM_USER_ADD')">
                                <a class="btn btn-sm btn-primary pull-right"
                                   href="<%=request.getContextPath()%>/admin/system/user/add"><i class="fa fa-plus"></i> Thêm mới</a>
                                </sec:authorize>
                            </div>
                        </div>
                        <div class="line line-dashed line-lg pull-in" style="clear:both ;border-top:0px"></div>
                    </form>
                </div>

                <div class="table-responsive table-overflow-x-fix">
                    <table class="table table-striped table-bordered m-b-none text-sm">
                        <thead>
                        <tr>
                            <th class="box-shadow-inner small_col text-center">#</th>
                            <th class="box-shadow-inner small_col text-center">Username</th>
                            <th class="box-shadow-inner small_col text-center">Họ tên</th>
                            <th class="box-shadow-inner small_col text-center">Mô tả</th>
                            <th class="box-shadow-inner small_col text-center action-thead-3-items">Hoạt động</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${page.items}" var="item" varStatus="stat">
                            <tr>
                                <td class="align-center">${stat.count+((page.pageNumber-1)*page.numberPerPage)}</td>
                                <td class="align-center">${item.username}</td>
                                <td class="align-center">${item.fullName}</td>
                                <td class="align-center">${item.description}</td>
                                <sec:authorize access="hasAnyRole('ROLE_SYSTEM_USER_EDIT','ROLE_SYSTEM_USER_AUTHORITY','ROLE_SYSTEM_LOG_VIEW')">
                                <td class="align-center">
                                    <sec:authorize access="hasRole('ROLE_SYSTEM_USER_EDIT')">
                                        <a href="<%=request.getContextPath()%>/admin/system/user/edit/${item.id}">
                                            <i class="fa fa-edit fa-2x" aria-hidden="true"  title="Chỉnh sửa"></i>
                                        </a></li>
                                    </sec:authorize>
                                    <sec:authorize access="hasRole('ROLE_SYSTEM_USER_AUTHORITY')">
                                        <a href="<%=request.getContextPath()%>/admin/system/user/user-group/${item.id}">
                                            <i class="fa fa-key fa-2x" aria-hidden="true" title="Phân quyền"></i>
                                        </a>
                                    </sec:authorize>
                                    <sec:authorize access="hasRole('ROLE_SYSTEM_LOG_VIEW')">

                                        <a href="<%=request.getContextPath()%>/admin/system/history/${item.id}">
                                            <i class="fa fa-history fa-2x" aria-hidden="true"  title="Xem lịch sử"></i>
                                        </a>

                                    </sec:authorize>
                                </td>
                                </sec:authorize>
                            </tr>

                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <footer class="panel-footer">
                    <div class="row">
                        <div class="col-sm-12 text-right text-center-xs">
                            <div class="col-sm-6 text-left">
                                <span>Tổng số <code  class="currencyHtml">${page.rowCount}</code> dữ liệu</span>
                            </div>
                            <div class="col-sm-6">
                            <ul class="pagination pagination-sm m-t-none m-b-none">
                                <c:if test="${page.pageNumber > 1}">
                                    <li>
                                        <a href="<%=request.getContextPath()%>/admin/system/user/list.html?p=1&filterUsername=${filterUsername}">«</a>
                                    </li>
                                </c:if>
                                <c:forEach items="${page.pageList}" var="item" varStatus="stat">
                                    <c:choose>
                                        <c:when test="${page.pageNumber==item}">
                                            <li><a style="color: #aa1111"
                                                   href="<%=request.getContextPath()%>/admin/system/user/list.html?p=${item}&filterUsername=${filterUsername}">${item}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li><a  href="<%=request.getContextPath()%>/admin/system/user/list.html?p=${item}&filterUsername=${filterUsername}">${item}</a></li>
                                        </c:otherwise>
                                    </c:choose>

                                </c:forEach>
                                <c:if test="${page.pageNumber < page.getPageCount()}">
                                    <li>
                                        <a href="<%=request.getContextPath()%>/admin/system/user/list.html?p=${page.getPageCount()}&filterUsername=${filterUsername}">»</a>
                                    </li>
                                </c:if>
                            </ul>
                            </div>
                        </div>
                    </div>
                </footer>
            </section>
        </section>
    </section>
    <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen" data-target="#nav"></a>
</section>

<script>
    $(document).ready(function () {

        $('#tblUser').dataTable({
            "bFilter": false,
            "bPaginate": false,
            "bAutoWidth": false,
            "sPaginationType": "full_numbers"
        });

    });
</script>
