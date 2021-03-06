<%@ page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%!
    public boolean isActive(String navPath, HttpServletRequest request) {
        String namespace = (String) request.getAttribute("javax.servlet.forward.request_uri");
        return namespace.startsWith(navPath);
    }

    ;

    public boolean isActiveIndex(String navPath, HttpServletRequest request) {
        String namespace = (String) request.getAttribute("javax.servlet.forward.request_uri");
        return namespace.equals(navPath);
    }

    public boolean isNavXs(HttpServletRequest request) {
        if (request.getSession().getAttribute("nav-xs") != null) {
            Boolean thugon = (Boolean) request.getSession().getAttribute("nav-xs");
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
<aside class="bg-dark lter b-r aside-md hidden-print hidden-xs<%= isNavXs(request) ? "nav-xs" : "" %>"
       id="nav">
    <section class="vbox">
        <section class="w-f scrollable">
            <div class="slim-scroll" data-height="auto" data-disable-fade-out="true"
                 data-distance="0" data-size="5px"
                 data-color="#333333">
                <nav class="nav-primary hidden-xs">
                    <ul class="nav">
                        <li class="<%= isActive(request.getContextPath()+"/admin/revenue-report",request) ? "active" : "" %>">
                            <a href="<%=request.getContextPath()%>/admin/revenue-report"
                               class=""> <i class="fa fa-money icon"> <b class="bg-light dker"></b>
                            </i><span>B??o c??o doanh thu</span>
                            </a>
                        </li>
                        <li class="<%= isActive(request.getContextPath()+"/admin/management/account/list",request) ? "active" : "" %>">
                            <a href="<%=request.getContextPath()%>/admin/management/account/list"
                               class=""> <i class="fa fa-users icon"> <b class="bg-dark bg"></b> </i>
                                <span>Qu???n l?? kh??ch h??ng</span>
                            </a>
                        </li>
                        <li class="<%= isActive(request.getContextPath()+"/admin/management/document/list",request)
                         || isActive(request.getContextPath()+"/admin/management/job/list",request)
                         ? "active" : "" %>">
                            <a href="#"
                               class=""> <i class="fa fa-file-text icon"> <b class="bg-info dker"></b>
                            </i> <span
                                    class="pull-right"> <i
                                    class="fa fa-angle-down text"></i> <i
                                    class="fa fa-angle-up text-active"></i> </span> <span>Qu???n l?? s???n ph???m</span>
                            </a>
                            <ul class="nav lt">
                                <li class="<%= isActive(request.getContextPath()+"/admin/management/document/list",request) ? "active" : "" %>
                "><a href="<%=request.getContextPath()%>/admin/management/document/list"
                     class=""> <i class="fa
                fa-angle-right"></i> <span>T??i li???u</span> </a></li>
                                <li class="<%= isActive(request.getContextPath()+"/admin/management/job/list",request) ? "active" : "" %>
                "><a href="<%=request.getContextPath()%>/admin/management/job/list"
                     class=""> <i class="fa
                fa-angle-right"></i> <span>Vi???c freelancer</span> </a></li>

                            </ul>
                        </li>
                        <li class="<%= isActive(request.getContextPath()+"/admin/management/promotion",request) ? "active" : "" %>">
                            <a href="<%=request.getContextPath()%>/admin/management/promotion/list"
                               class=""> <i class="fa fa-paw icon"> <b class="bg-primary"></b> </i>
                                <span>Qu???n l?? khuy???n m???i</span>
                            </a>
                        </li>
                        <li class="<%= isActive(request.getContextPath()+"/admin/management/transaction-history/list",request) ? "active" : "" %>">
                            <a href="<%=request.getContextPath()%>/admin/management/transaction-history/list"
                               class=""> <i class="fa fa-bar-chart icon"> <b class="bg-primary dker"></b> </i>
                                <span>Qu???n l?? giao d???ch</span>
                            </a>
                        </li>

                        <li class="<%= isActive(request.getContextPath()+"/admin/management/transaction-form",request) ||
                            isActive(request.getContextPath()+"/admin/management/category",request)
             ? "active" : "" %>"><a href="#" class=""> <i class="fa fa-file-text icon"> <b
                                class="bg-success dker"></b> </i> <span class="pull-right"> <i
                                class="fa fa-angle-down text"></i> <i
                                class="fa fa-angle-up text-active"></i> </span>
                            <span>Qu???n l?? danh m???c</span>
                        </a>
                            <ul class="nav lt">
                                <li class="<%= isActive(request.getContextPath()+"/admin/management/transaction-form/list",request) ? "active" : "" %>
                "><a href="<%=request.getContextPath()%>/admin/management/transaction-form/list"
                     class=""> <i class="fa
                fa-angle-right"></i> <span>H??nh th???c giao d???ch</span> </a></li>
                                <li class="<%= isActive(request.getContextPath()+"/admin/management/category/list",request) ? "active" : "" %>
                "><a href="<%=request.getContextPath()%>/admin/management/category/list" class="">
                                    <i class="fa
                fa-angle-right"></i> <span>Ch??? ????? s???n ph???m</span> </a></li>
                                <%--            </sec:authorize>--%>
                            </ul>
                        </li>



                        <sec:authorize
                                access="hasAnyRole('ROLE_SYSTEM_USER_VIEW','ROLE_SYSTEM_GROUP_VIEW','ROLE_SYSTEM_LOG_VIEW')">
                            <li class="<%= isActive(request.getContextPath()+"/admin/system",request) ? "active" : "" %>">
                                <a href="#"
                                   class=""> <i class="fa fa-cogs icon"> <b class="bg-warning"></b>
                                </i> <span class="pull-right"> <i class="fa
            fa-angle-down text"></i> <i class="fa fa-angle-up text-active"></i> </span> <span>Qu???n tr??? h??? th???ng</span>
                                </a>
                                <ul class="nav lt">
                                    <sec:authorize access="hasRole('ROLE_SYSTEM_USER_VIEW')">
                                        <li class="<%= isActive(request.getContextPath()+"/admin/system/user",request) ? "active" : "" %>">
                                            <a
                                                    href="<%=request.getContextPath()%>/admin/system/user/list"
                                                    class=""> <i class="fa fa-angle-right"></i>
                                                <span>Qu???n tr??? vi??n</span> </a></li>
                                    </sec:authorize>
                                    <sec:authorize access="hasRole('ROLE_SYSTEM_GROUP_VIEW')">
                                        <li class="<%= isActive(request.getContextPath()+"/admin/system/group",request) ? "active" : "" %>">
                                            <a
                                                    href="<%=request.getContextPath()%>/admin/system/group/list"
                                                    class=""> <i class="fa fa-angle-right"></i>
                                                <span>Nh??m quy???n</span> </a></li>
                                    </sec:authorize>
                                    <sec:authorize access="hasRole('ROLE_SYSTEM_LOG_VIEW')">
                                        <li class="<%= isActive(request.getContextPath()+"/admin/system/history",request) ? "active" : "" %>">
                                            <a href="<%=request.getContextPath()%>/admin/system/history/list"
                                                    class=""> <i class="fa
                fa-angle-right"></i> <span>L???ch s??? h??? th???ng</span> </a></li>
                                    </sec:authorize>
                                </ul>
                            </li>
                        </sec:authorize>
                        <li class="<%= isActive(request.getContextPath()+"/admin/history",request) ? "active" : "" %>">
                            <a
                                    href="<%=request.getContextPath()%>/admin/history">
                                <i class="fa fa-clock-o icon">
                                    <b class="bg-danger dker"></b>
                                </i><span>L???ch s??? c???a t??i</span></a>
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
            <a href="#nav" id="changeNavXS" data-toggle="class:nav-xs"
               class="pull-right btn btn-smbtn-dark btn-icon">
                <i class="fa fa-angle-left text"></i>
                <i class="fa fa-angle-right text-active"></i>
            </a>
        </footer>

    </section>
</aside>

<script type="text/javascript">
  $(document).ready(function () {
    $('#changeNavXS').click(function () {
      $.ajax({
        type: "get",
        url: "<%=request.getContextPath()%>/change-nav",
        success: function (msg) {
        }
      });
    });

  });
</script>