<%@ page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>

<div class="main--breadcrumb">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="home-1.html" class="btn-link"><i class="fa fm fa-home"></i>${title==null?"Trang chủ":title}</a></li>

        </ul>
    </div>
</div>
<div class="main--content col-md-8 col-sm-7" data-sticky-content="true">
    <div class="sticky-content-inner">
        <!-- Post Items Start -->
        <div class="post--item post--single post--title-largest pd--30-0">

            <div class="post--info">
                <ul class="nav meta">
                    <li><a href="#"><fmt:formatDate type = "both"
                                                    dateStyle = "short" timeStyle = "short" value = "${item.dateCreated}" /></a></li>
                    <li><span><i class="fa fm fa-eye"></i>${item.view}</span></li>
                </ul>

                <div class="title">
                    <h2 class="h4">${item.shortContent}</h2>
                </div>
            </div>

            <div class="post--content">
                 ${item.content}
            </div>
        </div>
    </div>
    <div class="post--related ptop--30">
        <!-- Post Items Title Start -->
        <div class="post--items-title" data-ajax="tab">
            <h2 class="h4">Cùng chủ đề</h2>

            <div class="nav">
                <a href="#" class="prev btn-link" data-ajax-action="load_prev_related_posts">
                    <i class="fa fa-long-arrow-left"></i>
                </a>

                <span class="divider">/</span>

                <a href="#" class="next btn-link" data-ajax-action="load_next_related_posts">
                    <i class="fa fa-long-arrow-right"></i>
                </a>
            </div>
        </div>
        <!-- Post Items Title End -->

        <!-- Post Items Start -->
        <div class="post--items post--items-2" data-ajax-content="outer">
            <ul class="nav row" data-ajax-content="inner">
<c:forEach items="${ltsTop}" var="item" varStatus="stat">
                <li class="col-sm-3 pbottom--30">
                    <!-- Post Item Start -->
                    <div class="post--item post--layout-1">
                        <div class="post--img">
                            <a href="<%=request.getContextPath()%>/detail/${item.url}.html"><img src="<%=request.getContextPath()%>/${item.thumbail}" alt=""></a>


                            <div class="post--info">
                                <ul class="nav meta">
                                    <li><a href="<%=request.getContextPath()%>/detail/${item.url}.html"><fmt:formatDate type = "both"
                                                                    dateStyle = "short" timeStyle = "short" value = "${item.dateCreated}" /></a></li>
                                    <li><a href="<%=request.getContextPath()%>/detail/${item.url}.html"><span><i class="fa fm fa-eye"></i>${item.view}</span></a></li>
                                </ul>

                                <div class="title">
                                    <h3 class="h4"><a href="<%=request.getContextPath()%>/detail/${item.url}.html">${item.title}</a></h3>
                                </div>
                            </div>
                        </div>

                        <div class="post--content">
                            <p>${item.shortContent}...</p>
                        </div>

                        <div class="post--action">
                            <a href="<%=request.getContextPath()%>/detail/${item.url}.html">Xem thêm... </a>
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
        <!-- Post Items End -->
    </div>
    <div class="sticky-content-inner">
        <div class="fb-share-button" data-href="https://sacmau4phuong.com/" data-layout="button_count" data-size="large"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fsacmau4phuong.com%2F&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Chia sẻ</a></div>
        <div class="fb-comments" data-href="https://sacmau4phuong.com/detail/${item.url}.html" data-width="100%" data-numposts="5"></div>
    </div>
</div>
