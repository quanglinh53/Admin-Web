<%@ page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<section id="content">
    <section class="vbox">
        <section class="scrollable padder">
            <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
                <li><a href="<%=request.getContextPath()%>/admin"><i class="fa fa-home"></i>&nbsp;Trang chủ</a></li>
                <li><a href="#">Quản lý nội dung</a></li>
                <li><a href="#">Nhóm chủ đề</a></li>
                <li><a href="javascript:void(0)">Thêm mới</a></li>
            </ul>
            <div class="m-b-md">
                <%--<h3 class="m-b-none">Thêm chuyên mục</h3><br/>--%>
                <span style="color:red">${messageError}</span>
            </div>

            <section class="panel panel-default">
                <header class="panel-heading"><i class="fa fa-caret-square-o-right"></i> Thêm mới nhóm chủ đề</header>
                <div class="panel-body" style="min-height: 600px;">
                    <form method="post" ction="<%=request.getContextPath()%>/admin/content/group-topic/add" theme="simple"  enctype="multipart/form-data" class="form-horizontal" cssStyle="" validate="true">

                        <input type="hidden" id="isNotifice" name="isNotifice" value="0">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Nhóm chủ đề là thông báo?</label>
                            <div class="col-sm-10">
                                <label class="switch">
                                    <input id="checkboxisNotifice" type="checkbox" ${item.isNotifice==1?"checked":""} onclick="changeStatusIsNotifice()">
                                    <span></span>
                                </label>
                            </div>
                        </div>
                        <div class="line line-dashed line-lg pull-in"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="line-height: 30px">Tên nhóm chủ đề<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <div class="input-group m-b">
                                        <span class="input-group-addon">
                                            <i class="fa fa-file-text" aria-hidden="true"></i>
                                        </span>
                                    <input name="groupName" maxlength="100" style="width:100%;" value="${item.groupName}"
                                           placeholder="" class="form-control"/>

                                </div>
                                <form:errors cssStyle="color: red" path="groupTopic.groupName" />
                            </div>
                        </div>
                        <div class="line line-dashed line-lg pull-in"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="line-height: 30px">Mô tả </label>
                            <div class="col-sm-10">
                                <div class="input-group m-b">
                                        <span class="input-group-addon">
                                            <i class="fa fa-rotate-right" style="font-size: 11px" aria-hidden="true"></i>
                                        </span>
                                    <input name="description" placeholder="" maxlength="500" value="${item.description}" style="width:100%;" class="form-control"/>
                                </div>
                            </div>
                        </div>

                        <div class="line line-dashed line-lg pull-in" style="clear:both ;margin-bottom: 50px"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-5">
                                <a href="<%=request.getContextPath()%>/admin/content/group-topic/list" class="btn btn-default">Hủy bỏ</a>
                                <button type="submit" data-loading-text="Thêm mới" class="btn btn-primary">Thêm mới</button>
                            </div>
                        </div>
                    </form>

                </div>
            </section>
        </section>
        <footer class="footer bg-white b-t b-light"><small>GAME-FULL &copy; 2020</small></footer>
    </section>
    <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen" data-target="#nav"></a>
</section>

<script>
    function changeStatusIsNotifice() {
        if ($('#checkboxisNotifice').is(":checked")) {
            $('#isNotifice').val(1);
        } else $('#isNotifice').val(0);
    }
</script>
