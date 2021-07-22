<%@ page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style>
    .count{
        font-size:30px;
        font-weight: 600;
    }
    .green-special{
        color:#1ABB9C;
    }
    .nau-xam{
        color:#73879C;
        font-weight: 400;
        font-size: 13px;
    }
    .red{
        color:#E74C3C;
    }
    #container {
        min-height: 350px;
        max-height: 600px;
        margin: 0 auto;
    }
</style>
<script>
    var contextPath='<%=request.getContextPath()%>';
</script>
<%--<script src="<%=request.getContextPath()%>/assets/project/admin/index/index.js"></script>--%>
<section id="content"  ng-app="sansimso">
    <section class="vbox">
        <section class="scrollable padder">
            <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
                <li><a href="<%=request.getContextPath()%>/"><i class="fa fa-home"></i>&nbsp;Home</a></li>
            </ul>
            <div class="m-b-md"><h3 class="m-b-none">Workset</h3>
                <small><span class="text-success"><sec:authentication property="principal.fullName" /></span>, mừng bạn trở lại.</small>
            </div>

<%--            <section class="panel panel-default pos-rlt clearfix">--%>

<%--                <div class="panel-body clearfix" style="display:none" id="chitieu" >--%>
<%--                    <div class="form-group ">--%>
<%--                        <div class="col-md-3">--%>
<%--                                <select name="type" class="select2-option" style="width:100%" ng-model="type" ng-change="changeType(type)">--%>
<%--                                    <option value="">Chọn chỉ tiêu</option>--%>
<%--                                    <option value="0">Tuần</option>--%>
<%--                                    <option value="1">Tháng</option>--%>
<%--                                    <option value="2">Năm</option>--%>
<%--                                </select>--%>
<%--                            <span class="red">{{typeError}}</span>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-3" ng-show="showYear">--%>
<%--                                <select name="year" class="select2-option" style="width:100%" ng-model="year">--%>
<%--                                    <option value="">Chọn năm</option>--%>
<%--                                    <option  ng-repeat="item in listYear" value="{{item}}">{{item}}</option>--%>
<%--                                </select>--%>
<%--                            <span class="red">{{yearError}}</span>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-3" ng-show="showMonth">--%>
<%--                                <select name="month" class="select2-option" style="width:100%" ng-model="month">--%>
<%--                                    <option value="">Chọn tháng</option>--%>
<%--                                    <option value="1">Tháng 1</option>--%>
<%--                                    <option value="2">Tháng 2</option>--%>
<%--                                    <option value="3">Tháng 3</option>--%>
<%--                                    <option value="4">Tháng 4</option>--%>
<%--                                    <option value="5">Tháng 5</option>--%>
<%--                                    <option value="6">Tháng 6</option>--%>
<%--                                    <option value="7">Tháng 7</option>--%>
<%--                                    <option value="8">Tháng 8</option>--%>
<%--                                    <option value="9">Tháng 9</option>--%>
<%--                                    <option value="10">Tháng 10</option>--%>
<%--                                    <option value="11">Tháng 11</option>--%>
<%--                                    <option value="12">Tháng 12</option>--%>
<%--                                </select>--%>
<%--                            <span class="red">{{monthError}}</span>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-3" ng-show="showWeek">--%>
<%--                                <select name="week" class="select2-option" style="width:100%" ng-model="week">--%>
<%--                                    <option value="">Chọn tuần</option>--%>
<%--                                    <option value="1">Tuần 1</option>--%>
<%--                                    <option value="2">Tuần 2</option>--%>
<%--                                    <option value="3">Tuần 3</option>--%>
<%--                                    <option value="4">Tuần 4</option>--%>
<%--                                    <option value="5">Tuần 5</option>--%>
<%--                                    <option value="6">Tuần 6</option>--%>
<%--                                    <option value="7">Tuần 7</option>--%>
<%--                                    <option value="8">Tuần 8</option>--%>
<%--                                    <option value="9">Tuần 9</option>--%>
<%--                                    <option value="10">Tuần 10</option>--%>
<%--                                    <option value="11">Tuần 11</option>--%>
<%--                                    <option value="12">Tuần 12</option>--%>
<%--                                </select>--%>
<%--                            <span class="red">{{weekError}}</span>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <div class="line line-dashed line-lg pull-in" style="clear:both ;border-top:0px"></div>--%>
<%--                    <div class="form-group text-center">--%>
<%--                        <a ng-click="search()" class="btn btn-info btn-sm">Áp dụng</a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </section>--%>

<%--            <div class="row">--%>
<%--                <div class="col-md-8">--%>
<%--                    <section class="panel panel-default">--%>
<%--                        <header class="panel-heading font-bold">Biểu đồ doanh thu {{nameTitle}}</header>--%>
<%--                        <div class="panel-body">--%>
<%--                            <div id="container"></div>--%>
<%--                            &lt;%&ndash;<button id="plain" class="btn btn-success btn-sm">Dạng cột</button>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;<button id="inverted" class="btn btn-primary btn-sm">Dạng ngang</button>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;<button id="polar" class="btn btn-info btn-sm">Đường đối cực</button>&ndash;%&gt;--%>
<%--                        </div>--%>

<%--                    </section>--%>
<%--                </div>--%>

<%--            </div>--%>

        </section>
    </section>
    <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen" data-target="#nav"></a>
</section>

<!-- Bootstrap --> <!-- App -->
<script src="<%=request.getContextPath()%>/assets/js/jquery-3.1.1.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/note/js/charts/sparkline/jquery.sparkline.min.js" cache="false"></script>
<script src="<%=request.getContextPath()%>/assets/note/js/charts/easypiechart/jquery.easy-pie-chart.js" cache="false"></script>
<script src="<%=request.getContextPath()%>/assets/js/highcharts/highcharts.js" cache="false"></script>
<script src="<%=request.getContextPath()%>/assets/js/highcharts/highcharts-more.js" cache="false"></script>
<script src="<%=request.getContextPath()%>/assets/js/highcharts/exporting.js" cache="false"></script>
<script src="<%=request.getContextPath()%>/assets/note/js/charts/flot/jquery.flot.min.js" ></script>
<script src="<%=request.getContextPath()%>/assets/note/js/charts/flot/jquery.flot.tooltip.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/note/js/charts/flot/jquery.flot.resize.js"></script>
<script src="<%=request.getContextPath()%>/assets/note/js/charts/flot/jquery.flot.grow.js"></script>
<%--<script src="<%=request.getContextPath()%>/assets/note/js/charts/flot/demo.js"></script>--%>

<%--<script src="<%=request.getContextPath()%>/assets/project/index/demo.js"></script>--%>

<%--Cho bieu do` tron`--%>
<script src="<%=request.getContextPath()%>/assets/vendors/Chart.js/dist/Chart.min.js"></script>
<%--<script src="<%=request.getContextPath()%>/assets/project/index/bieudotron.js"></script>--%>
<script>
    function toggler(divId) {
        $("#" + divId).toggle();
    }
    //giup cai mui ten doi chieu khi click
    $(document).on('click', '.chitieu', function(e){
        e && e.preventDefault();
        var $this = $(e.target), $target;
        if (!$this.is('a')) $this = $this.closest('a');
        $target = $this.closest('.panel');
        $this.toggleClass('active');
    });
</script>