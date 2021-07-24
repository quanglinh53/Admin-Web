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
        <div class="post--items post--items-5 pd--30-0">
            <ul class="nav">

                <c:forEach items="${page.items}" var="item" varStatus="stat">
                    <li>
                        <!-- Post Item Start -->

                        <div class="post--item post--title-larger">
                            <div class="row">
                                <div class="col-md-4 col-sm-12 col-xs-4 col-xxs-12">
                                    <div class="post--img">
                                        <a href="<%=request.getContextPath()%>/detail/${item.url}.html"><img src="<%=request.getContextPath()%>/${item.thumbail}" alt=""></a>


                    </div>
                                </div>

                                <div class="col-md-8 col-sm-12 col-xs-8 col-xxs-12">
                                    <div class="post--info">
                                        <ul class="nav meta">
                                            <li><a href="#"><fmt:formatDate type = "both"
                                                                            dateStyle = "short" timeStyle = "short" value = "${item.dateCreated}" /><span><i class="fa fm fa-eye"></i>${item.view}</span></a> </li>

                                        </ul>

                                        <div class="title">
                                            <h3 class="h4"><a href="<%=request.getContextPath()%>/detail/${item.url}.html" class="btn-link"> ${item.title}</a></h3>
                                        </div>
                                    </div>

                                    <div class="post--content">
                                        <p>${item.shortContent}...</p>
                                    </div>

                                    <div class="post--action">
                                        <a href="<%=request.getContextPath()%>/detail/${item.url}.html">Đọc tin</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Post Item End -->
                    </li>
                </c:forEach>
            </ul>
        </div>
        <!-- Post Items End -->

        <!-- Pagination Start -->
        <div class="pagination--wrapper clearfix bdtop--1 bd--color-2 ptop--60 pbottom--30">

            <ul class="pagination float--right">
                <c:if test="${page.pageNumber > 1}">
                    <li>
                        <a href="<%=request.getContextPath()%>/chuyen-muc/${url}.html?p=1"><i class="fa fa-long-arrow-left"></i>1</a>
                    </li>
                </c:if>
                <c:forEach items="${page.pageList}" var="item" varStatus="stat">
                <c:choose>
                    <c:when test="${page.pageNumber==item}">
                        <li><a style="color: #aa1111"
                               href="<%=request.getContextPath()%>/chuyen-muc/${url}.html?p=${item}">${item}</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a  href="<%=request.getContextPath()%>/chuyen-muc/${url}.html?p=${item}">${item}</a></li>
                    </c:otherwise>
                </c:choose>
                </c:forEach>
                    <c:if test="${page.pageNumber < page.getPageCount()}">
                        <li>
                            <a href="<%=request.getContextPath()%>/chuyen-muc/${url}.html?p=${page.getPageCount()}">»</a>
                        </li>
                    </c:if>

            </ul>
        </div>
        <!-- Pagination End -->
    </div>
</div>