<%@ page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style>

  .dropdown:hover .dropdown-menu {
    display: block;
  }

</style>
<header class="header--section header--style-1">
    <!-- Header Topbar Start -->
    <div class="header--topbar bg--color-2">
        <div class="container">
            <div class="float--left float--xs-none text-xs-center">
                <!-- Header Topbar Info Start -->
                <ul class="header--topbar-info nav">
                    <li><i class="fa fm fa-map-marker"></i>Liên hệ Quảng cáo</li>
                    <li>0978 145 314</li>
                    <li>nguyenthienat10a@gmail.com</li>
                </ul>
                <!-- Header Topbar Info End -->
            </div>

            <div class="float--right float--xs-none text-xs-center">
                <ul class="header--topbar-social nav hidden-sm hidden-xxs">
                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                    <li><a href="#"><i class="fa fa-rss"></i></a></li>
                    <li><a href="#"><i class="fa fa-youtube-play"></i></a></li>
                </ul>
                <!-- Header Topbar Social End -->
            </div>
        </div>
    </div>
    <!-- Header Topbar End -->

    <!-- Header Mainbar Start -->
    <div class="header--mainbar">
        <div class="container">
            <!-- Header Logo Start -->
            <div class="header--logo float--left float--sm-none text-sm-center">
                <h1 class="h1">
                    <a href="home-1.html" class="btn-link">
                        <img src="<%=request.getContextPath()%>/assets/webforum/img/logo.png"
                             alt="USNews Logo">
                    </a>
                </h1>
            </div>
            <!-- Header Logo End -->

            <!-- Header Ad Start -->
            <div class="header--ad float--right float--sm-none hidden-xs">
                <a href="#">
                    <img src="<%=request.getContextPath()%>/assets/webforum/img/banner.png"
                         alt="Advertisement">
                </a>
            </div>
            <!-- Header Ad End -->
        </div>
    </div>
    <!-- Header Mainbar End -->

    <!-- Header Navbar Start -->
    <div class="header--navbar style--1 navbar bd--color-1 bg--color-1" data-trigger="sticky">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#headerNav" aria-expanded="false" aria-controls="headerNav">
                    <span class="sr-only">Toggle Navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>

            <div id="headerNav" class="navbar-collapse collapse float--left">
                <!-- Header Menu Links Start -->
                <ul class="header--menu-links nav navbar-nav" data-trigger="hoverIntent">
                    <li>
                        <a href="<%=request.getContextPath()%>/">Trang chủ</a>

                    </li>

                    <c:forEach items="${ltsCategory}" var="item">
                        <li class="dropdown">

                            <a href="<%=request.getContextPath()%>/chuyen-muc/${item.category.url}.html"
                               class="dropdown">${item.category.name}&nbsp;<i
                                    class="fa flm fa-angle-down"></i></a>

                            <ul class="dropdown-menu">
                                <c:forEach items="${item.lts}" var="item2">
                                    <li class="dropdown">
                                        <a href="<%=request.getContextPath()%>/chuyen-muc/${item2.url}.html"
                                           class="dropdown-toggle">${item2.name}<i
                                                class="fa flm fa-angle-right"></i></a>
                                    </li>
                                </c:forEach>

                            </ul>

                        </li>
                    </c:forEach>


                </ul>
                <!-- Header Menu Links End -->
            </div>

            <!-- Header Search Form Start -->
            <%--<form action="#" class="header--search-form float--right" data-form="validate">--%>
            <%--<input type="search" name="search" placeholder="Search..." class="header--search-control form-control" required>--%>

            <%--<button type="submit" class="header--search-btn btn"><i class="header--search-icon fa fa-search"></i></button>--%>
            <%--</form>--%>
            <!-- Header Search Form End -->
        </div>
    </div>
    <!-- Header Navbar End -->
</header>
