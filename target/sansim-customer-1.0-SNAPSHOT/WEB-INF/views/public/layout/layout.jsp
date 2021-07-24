<%@ page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
    <meta charset="utf-8"/>
    <title><tiles:insertAttribute name="title"/></title>
    <%--<meta property="og:image" content="<%=request.getContextPath()%>/assets/public/img/favicon.png">--%>
    <meta name="description" content="san sim"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/note/css/bootstrap.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/note/css/animate.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/note/css/font-awesome.min.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/note/css/font.css" type="text/css" cache="false"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/note/js/datatables/datatables.css"
          type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/note/js/select2/select2.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/note/js/select2/theme.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/note/js/fuelux/fuelux.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/note/js/slider/slider.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/note/js/datepicker/datepicker.css"
          type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/note/css/style.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/note/css/app.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/project/angularjs/autocomplete/autocomplete.css"
          type="text/css"/>
    <%--<[if lt IE 9]>--%>
    <script src="<%=request.getContextPath()%>/assets/note/js/ie/html5shiv.js" cache="false"></script>
    <script src="<%=request.getContextPath()%>/assets/note/js/ie/respond.min.js" cache="false"></script>
    <script src="<%=request.getContextPath()%>/assets/note/js/ie/excanvas.js" cache="false"></script>
    <%--<[endif]>--%>

    <script src="<%=request.getContextPath()%>/assets/note/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/note/js/bootstrap.js"></script>
    <%--<script src="<%=request.getContextPath()%>/assets/note/js/jquery-ui-1.10.3.custom.min.js"></script>--%>
    <script src="<%=request.getContextPath()%>/assets/note/js/datepicker/bootstrap-datepicker.js"></script>
    <script src="<%=request.getContextPath()%>/assets/note/js/app.js"></script>
    <script src="<%=request.getContextPath()%>/assets/note/js/app.plugin.js"></script>
    <script src="<%=request.getContextPath()%>/assets/note/js/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/note/js/datatables/jquery.dataTables.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/note/js/select2/select2.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/note/js/fuelux/fuelux.js"></script>
    <script src="<%=request.getContextPath()%>/assets/note/js/slider/bootstrap-slider.js"></script>
    <script src="<%=request.getContextPath()%>/assets/note/js/libs/moment.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/note/js/combodate/combodate.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/toastr.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/toastr.min.css" type="text/css"/>

    <script src="<%=request.getContextPath()%>/assets/project/angularjs/angular.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/project/angularjs/angular-sanitize.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/project/common.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/CommonFunction.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/croppie.js"></script>
    <script src="<%=request.getContextPath()%>/assets/project/angularjs/autocomplete/autocomplete.js"></script>
    <script src="<%= request.getContextPath()%>/assets/js/jquery.flipcountdown.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/bootstrap-dialog.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/moment-with-locales.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/note/css/bootstrap-datetimepicker.css"
          type="text/css"/>
    <script src="<%=request.getContextPath()%>/assets/js/bootstrap-datetimepicker.js"></script>

    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/webforum/css/style.css">
    <script>
        var preUrl = '<%=request.getContextPath()%>';
    </script>
    <link rel="icon" href="<%=request.getContextPath()%>/assets/webforum/img/sm.png" type="image/png">

    <!-- ==== Google Font ==== -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700">

    <!-- ==== Font Awesome ==== -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/webforum/css/font-awesome.min.css">

    <!-- ==== Bootstrap Framework ==== -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/webforum/css/bootstrap.min.css">

    <!-- ==== Bar Rating Plugin ==== -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/webforum/css/fontawesome-stars-o.min.css">

    <!-- ==== Main Stylesheet ==== -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/webforum/style.css">

    <!-- ==== Responsive Stylesheet ==== -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/webforum/css/responsive-style.css">

    <!-- ==== Theme Color Stylesheet ==== -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/webforum/css/colors/theme-color-1.css"
          id="changeColorScheme">

    <!-- ==== Custom Stylesheet ==== -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/webforum/css/custom.css">
</head>
<body>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v9.0" nonce="dEyhxOdT"></script>
<div class="wrapper">
    <tiles:insertAttribute name="header"/>
    <div class="main-content--section pbottom--30">
        <div class="container">
            <div class="row">
                <tiles:insertAttribute name="page"/>
                <div class="main--sidebar col-md-4 col-sm-5 ptop--30 pbottom--30" data-sticky-content="true">
                    <div class="sticky-content-inner">
                        <!-- Widget Start -->
                        <!-- Widget End -->

                        <!-- Widget Start -->
                        <div class="widget">
                            <div class="widget--title">
                                <h2 class="h4">Danh mục</h2>
                                <i class="icon fa fa-folder-open-o"></i>
                            </div>

                            <!-- Nav Widget Start -->
                            <div class="nav--widget">
                                <ul class="nav">
                                    <c:forEach items="${danhmuc}" var="item">
                                        <li>
                                            <a href="<%=request.getContextPath()%>/chuyen-muc/${item.url}.html"><span>${item.name}</span></a>
                                        </li>

                                    </c:forEach>
                                </ul>
                            </div>
                            <!-- Nav Widget End -->
                        </div>

                        <div class="widget">
                            <div class="widget--title">
                                <h2 class="h4">Xem nhiều</h2>
                                <i class="icon fa fa-newspaper-o"></i>
                            </div>
                            <div class="list--widget list--widget-1">
                                <div class="post--items post--items-3" data-ajax-content="outer">
                                    <ul class="nav" data-ajax-content="inner">
                                        <c:forEach items="${ltsTop}" var="item" varStatus="stat">
                                            <li>
                                                <!-- Post Item Start -->
                                                <div class="post--item post--layout-3">
                                                    <div class="post--img">
                                                        <a href="<%=request.getContextPath()%>/detail/${item.url}.html"
                                                           class="thumb"><img
                                                                src="<%=request.getContextPath()%>/${item.thumbail}"
                                                                alt=""></a>

                                                        <div class="post--info">
                                                            <ul class="nav meta">
                                                                <a href="#"><fmt:formatDate type="both"
                                                                                            dateStyle="short"
                                                                                            timeStyle="short"
                                                                                            value="${item.dateCreated}"/></a>
                                                            </ul>

                                                            <div class="title">
                                                                <h3 class="h4"><a
                                                                        href="<%=request.getContextPath()%>/detail/${item.url}.html"
                                                                        class="btn-link"> ${item.title}</a></h3>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Post Item End -->
                                            </li>
                                        </c:forEach>

                                    </ul>

                                    <!-- Preloader Start -->
                                    <div class="preloader bg--color-0--b" data-preloader="1">
                                        <div class="preloader--inner"></div>
                                    </div>
                                    <!-- Preloader End -->
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <tiles:insertAttribute name="footer"/>
</div>
<!-- Wrapper End -->

<!-- Sticky Social Start -->


</body>
</html>
