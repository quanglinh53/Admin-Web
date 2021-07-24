<%@ page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.osp.common.Constant" %>

<%--<script src="<%=request.getContextPath()%>/assets/project/admin/mangement/transactionHistory/list.js"></script>--%>
<script type="text/javascript">
  $("#sansim-status").show();
  setTimeout(function () {
    $("#sansim-status").hide();
  }, 5000);
</script>
<section id="content" ng-app="sansimso" ng-controller="transactionHistoryCtrl">
    <section class="vbox">
        <section class="scrollable padder">
            <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
                <li><a href="<%=request.getContextPath()%>/admin"><i class="fa fa-home"></i>&nbsp;Trang
                    chủ</a></li>
                <li><a href="#">Báo cáo doanh thu</a></li>
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
                <header class="panel-heading"><i class="fa fa-caret-square-o-right"></i>
                    Báo cáo doanh thu
                </header>
                <div class="text-sm wrapper bg-light lt">
                    <div class="line line-dashed line-lg pull-in"
                         style="clear:both ;border-top:0px"></div>
                    <div class="form-group col-sm-12">
                        <label class="col-sm-2 control-label" style="text-align: end;">Lọc theo
                            ngày</label>
                        <div class="col-sm-4">
                            <div class='input-group date' id="selectDate1">
                                <input type='text' class="form-control datepickerEnter"
                                       name="startDateFrom"
                                       id="startDate" ng-model="data.tuNgay"
                                       style="width: 100%; height: 60%" placeholder="Từ ngày"
                                       ngModelChange="modelChanged($event)"/>
                                <span class="input-group-addon">
                                              <i class="fa fa-calendar"></i>
                                            </span>
                            </div>
                        </div>
                        <div class="col-sm-2"></div>
                        <div class="col-sm-4">
                            <div class='input-group date' id="selectDate2">
                                <input type='text' class="form-control datepickerEnter"
                                       name="startDateFrom"
                                       id="endDate" ng-model="data.denNgay"
                                       style="width: 100%; height: 60%" placeholder="Đến ngày"
                                       ngModelChange="modelChanged($event)"/>
                                <span class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </span>
                            </div>
                        </div>
                    </div>
                    <div class="line line-dashed line-lg pull-in"
                         style="clear:both ;border-top:0px"></div>
                    <div class="form-group text-center">
                        <a ng-click="search()" class="btn btn-info btn-sm ">Tìm kiếm</a>
                    </div>
                </div>

                <div style="padding: 10px;"><span>Doanh thu team</span>
                    <div class="table-responsive table-overflow-x-fix">
                        <table id="tbl" class="table table-striped table-bordered m-b-none text-sm">
                            <thead>
                            <tr>
                                <th class="box-shadow-inner small_col text-center">#</th>
                                <th class="box-shadow-inner small_col text-center">Mã giao dịch</th>
                                <th class="box-shadow-inner small_col text-center">Ngày giao dịch
                                </th>
                                <th class="box-shadow-inner small_col text-center">Hình thức giao
                                    dịch
                                </th>
                                <th class="box-shadow-inner small_col text-center">Loại thanh toán
                                </th>
                                <th class="box-shadow-inner small_col text-center">Doanh thu
                                </th>
                                <th class="box-shadow-inner small_col text-center">Lợi nhuận (Đã trừ
                                    chi phí + Chiết khấu)
                                </th>

                            </tr>
                            </thead>
                            <tbody>
                            <tr ng-repeat="item in page.items track by $index">
                                <td class="align-center">{{(page.pageNumber - 1)
                                * page.numberPerPage
                                + $index + 1}}
                                </td>
                                <td class="align-center"></td>
                                <td class="align-center"></td>
                                <td class="align-center">{{item.transactionForm.transactionName}}
                                </td>
                                <td class="align-center">{{item.transactionMoney}}</td>
                                <td class="align-center">{{item.seller.fullname}}</td>
                                <td class="align-center">{{item.transactionDate
                                | date:'dd/MM/yyyy HH:mm:ss'}}
                                </td>
                                <td class="align-center">{{item.status == 0
                                        ? 'Chưa thực hiện giao dịch'
                                        :
                                        item.status == 1 ? 'Đang giao dịch' : 'Thành công'}}
                                </td>
                                <td class="align-center">{{item.transactionPosition}}</td>
                                <td class="align-center"></td>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                    <footer class="panel-footer">
                        <div class="row">
                            <div class="col-sm-12 text-right text-center-xs">
                                <div class="col-sm-6 text-left">
                                    <span ng-if="page.pageNumber>=1">Tổng số <code>{{page.rowCount}}</code> dữ liệu</span>
                                </div>
                                <div class="col-sm-6">
                                    <ul class="pagination pagination-sm m-t-none m-b-none">
                                        <li ng-if="page.pageNumber>1"><a href="javascript:void(0)"
                                                                         ng-click="loadPage(1)">«</a>
                                        </li>
                                        <li ng-repeat="item in page.pageList">
                                            <a href="javascript:void(0)"
                                               ng-if="item==page.pageNumber"
                                               style="color:mediumvioletred;"> {{item}}</a>
                                            <a href="javascript:void(0)"
                                               ng-if="item!=page.pageNumber"
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
                </div>
                <div style="padding: 10px;width: 50%">
                    <span>Chiết khấu cho nhân sự trong giao dịch chuyển tiền bank trực tiếp</span>
                    <div class="table-responsive table-overflow-x-fix">
                        <table id="tbl" class="table table-striped table-bordered m-b-none text-sm">
                            <thead>
                            <tr>
                                <th class="box-shadow-inner small_col text-center">#</th>
                                <th class="box-shadow-inner small_col text-center">Tên nhân sự</th>
                                <th class="box-shadow-inner small_col text-center">Số tiền
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr ng-repeat="item in page.items track by $index">
                                <td class="align-center">{{(page.pageNumber - 1)
                                * page.numberPerPage
                                + $index + 1}}
                                </td>
                                <td class="align-center"></td>
                                <td class="align-center"></td>
                                <td class="align-center">{{item.transactionForm.transactionName}}
                                </td>
                                <td class="align-center">{{item.transactionMoney}}</td>
                                <td class="align-center">{{item.seller.fullname}}</td>
                                <td class="align-center">{{item.transactionDate
                                | date:'dd/MM/yyyy HH:mm:ss'}}
                                </td>
                                <td class="align-center">{{item.status == 0
                                        ? 'Chưa thực hiện giao dịch'
                                        :
                                        item.status == 1 ? 'Đang giao dịch' : 'Thành công'}}
                                </td>
                                <td class="align-center">{{item.transactionPosition}}</td>
                                <td class="align-center"></td>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                    <footer class="panel-footer">
                        <div class="row">
                            <div class="col-sm-12 text-right text-center-xs">
                                <div class="col-sm-6 text-left">
                                    <span ng-if="page.pageNumber >= 1">Tổng số <code>{{page.rowCount}}</code> dữ liệu</span>
                                </div>
                                <div class="col-sm-6">
                                    <ul class="pagination pagination-sm m-t-none m-b-none">
                                        <li ng-if="page.pageNumber>1"><a href="javascript:void(0)"
                                                                         ng-click="loadPage(1)">«</a>
                                        </li>
                                        <li ng-repeat="item in page.pageList">
                                            <a href="javascript:void(0)"
                                               ng-if="item==page.pageNumber"
                                               style="color:mediumvioletred;"> {{item}}</a>
                                            <a href="javascript:void(0)"
                                               ng-if="item!=page.pageNumber"
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
                </div>
            </section>
        </section>
    </section>
    <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen"
       data-target="#nav"></a>


</section>
<script>

</script>
