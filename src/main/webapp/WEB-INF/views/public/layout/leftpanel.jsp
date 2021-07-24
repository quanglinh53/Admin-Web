    <%@ page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
        <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
            <%!
    public boolean isActive(String navPath,HttpServletRequest request) {
        String namespace = (String)request.getAttribute("javax.servlet.forward.request_uri");
        return namespace.startsWith(navPath);
    };
    public boolean isActiveIndex(String navPath,HttpServletRequest request){
        String namespace = (String)request.getAttribute("javax.servlet.forward.request_uri");
        return namespace.equals(navPath);
    }
    public boolean isNavXs(HttpServletRequest request){
        if(request.getSession().getAttribute("nav-xs")!=null){
            Boolean thugon=(Boolean) request.getSession().getAttribute("nav-xs");
            return thugon.equals(true);
        }
        return false;
    }
//    public boolean isSun(HttpServletRequest request){
//        if(request.getSession().getAttribute("sun-moon")!=null){
//            Boolean sun=(Boolean) request.getSession().getAttribute("sun-moon");
//            return sun;
//        }
//        return false;
//    }
%>
        <%--<aside class="bg-light lter b-r aside-md hidden-print" id="nav">--%>
        <aside class="bg-dark lter b-r aside-md hidden-print hidden-xs<%= isNavXs(request) ? "nav-xs" : "" %>" id="nav">
        <section class="vbox">
        <%--<header class="header bg-primary lter text-center clearfix">--%>
        <%--&lt;%&ndash;<div class="btn-group">&ndash;%&gt;--%>
        <%--&lt;%&ndash;&lt;%&ndash;<button type="button" class="btn btn-sm btn-dark btn-icon"><i class="fa fa-envelope"></i></button>&ndash;%&gt;&ndash;%&gt;--%>

        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--</header>--%>
        <section class="w-f scrollable">
        <div class="slim-scroll" data-height="auto" data-disable-fade-out="true" data-distance="0" data-size="5px"
        data-color="#333333">
        <nav class="nav-primary hidden-xs">
        <ul class="nav">
        <li class="<%= isActiveIndex(request.getContextPath()+"/",request) ? "active" : "" %>"><a
        href="<%=request.getContextPath()%>/admin">
        <i class="fa fa-dashboard icon">
        <b class="bg-info"></b>
        </i><span>BÁO CÁO</span></a>
        </li>


        <sec:authorize access="hasAnyRole('ROLE_CONTENT_ARTICLE_VIEW')">
            <li class="<%= isActive(request.getContextPath()+"/admin/content",request) ? "active" : "" %>"><a href="#"
            class=""> <i class="fa fa-file-text icon"> <b class="bg-primary"></b> </i> <span class="pull-right"> <i
            class="fa fa-angle-down text"></i> <i class="fa fa-angle-up text-active"></i> </span> <span>QL nội
            dung</span> </a>
            <ul class="nav lt">
            <sec:authorize access="hasRole('ROLE_CONTENT_ARTICLE_VIEW')">
                <li class="<%= isActive(request.getContextPath()+"/admin/content/article",request) ? "active" : "" %>
                "><a href="<%=request.getContextPath()%>/admin/content/article/list" class=""> <i class="fa
                fa-angle-right"></i> <span>Bài viết</span> </a></li>
            </sec:authorize>
            </ul>
            </li>
        </sec:authorize>
            <sec:authorize access="hasAnyRole('ROLE_CUSTOMER_MANAGER')">
                <li class="<%= isActive(request.getContextPath()+"/admin/content",request) ? "active" : "" %>"><a href="#"
                                                                                                                  class=""> <i class="fa fa-file-text icon"> <b class="bg-primary"></b> </i> <span class="pull-right"> <i
                        class="fa fa-angle-down text"></i> <i class="fa fa-angle-up text-active"></i> </span> <span>QL người chơi</span> </a>
                    <ul class="nav lt">
                        <sec:authorize access="hasRole('ROLE_CUSTOMER_VIEW')">
                            <li class="<%= isActive(request.getContextPath()+"/admin/content/customer",request) ? "active" : "" %> ">
                                <a href="<%=request.getContextPath()%>/admin/content/customer/list" class=""> <i class="fa
                fa-angle-right"></i> <span>Danh sách người chơi</span> </a></li>
                        </sec:authorize>
                    </ul>
                </li>
            </sec:authorize>



        <sec:authorize access="hasAnyRole('ROLE_SYSTEM_USER_VIEW','ROLE_SYSTEM_GROUP_VIEW','ROLE_SYSTEM_LOG_VIEW')">
            <li class="<%= isActive(request.getContextPath()+"/admin/system",request) ? "active" : "" %>"><a href="#"
            class=""> <i class="fa fa-cogs icon"> <b class="bg-warning"></b> </i> <span class="pull-right"> <i class="fa
            fa-angle-down text"></i> <i class="fa fa-angle-up text-active"></i> </span> <span>Quản trị hệ thống</span>
            </a>
            <ul class="nav lt">
            <sec:authorize access="hasRole('ROLE_SYSTEM_USER_VIEW')">
                <li class="<%= isActive(request.getContextPath()+"/admin/system/user",request) ? "active" : "" %>"><a
                href="<%=request.getContextPath()%>/admin/system/user/list" class=""> <i class="fa fa-angle-right"></i>
                <span>Người dùng</span> </a></li>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_SYSTEM_GROUP_VIEW')">
                <li class="<%= isActive(request.getContextPath()+"/admin/system/group",request) ? "active" : "" %>"><a
                href="<%=request.getContextPath()%>/admin/system/group/list" class=""> <i class="fa fa-angle-right"></i>
                <span>Nhóm quyền</span> </a></li>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_SYSTEM_LOG_VIEW')">
                <li class="<%= isActive(request.getContextPath()+"/admin/system/history",request) ? "active" : "" %>"><a
                href="<%=request.getContextPath()%>/admin/system/history/list" class=""> <i class="fa
                fa-angle-right"></i> <span>Lịch sử hệ thống</span> </a></li>
            </sec:authorize>
            </ul>
            </li>
        </sec:authorize>
        <li class="<%= isActive(request.getContextPath()+"/admin/history",request) ? "active" : "" %>"><a
        href="<%=request.getContextPath()%>/admin/history">
        <i class="fa fa-clock-o icon">
        <b class="bg-danger dker"></b>
        </i><span>Lịch sử của tôi</span></a>
        </li>
        </ul>
        </nav>
        </div>
        </section>
        <%--<footer class="footer lt hidden-xs b-light">--%>
        <footer class="footer lt hidden-xs b-t b-dark">
        <%--<a href="#nav" data-toggle="class:nav-xs" class="pull-right btn btn-sm btn-default btn-icon">--%>
        <%--<i class="fa fa-angle-left text"></i><i class="fa fa-angle-right text-active"></i>--%>
        <%--</a>--%>
        <a href="#nav" id="changeNavXS" data-toggle="class:nav-xs" class="pull-right btn btn-smbtn-dark btn-icon">
        <i class="fa fa-angle-left text"></i>
        <i class="fa fa-angle-right text-active"></i>
        </a>
        </footer>

        </section>
        </aside>

        <script type="text/javascript">
        $(document).ready(function() {
        $('#changeNavXS').click(function (){
        $.ajax({
        type: "get",
        url: "<%=request.getContextPath()%>/change-nav",
        success: function(msg){
        }
        });
        });

        });
        </script>