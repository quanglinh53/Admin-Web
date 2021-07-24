<%@ page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="<%=request.getContextPath()%>/assets/js/checkbox.js"></script>
<section id="content">
    <section class="vbox">
        <section class="scrollable padder">
            <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
                <li><a href="<%=request.getContextPath()%>/admin"><i class="fa fa-home"></i>&nbsp;Home</a></li>
                <li><a href="<%=request.getContextPath()%>/admin/system/group/list">Group</a></li>
                <li><a href="javascript:void(0)">Sửa nhóm quyền</a></li>
            </ul>
            <div class="m-b-md">
                <%--<h3 class="m-b-none">Sửa nhóm quyền </h3><br/>--%>
                <span style="color:red">${messageError}</span>
            </div>

            <section class="panel panel-default">
                <header class="panel-heading"><i class="fa fa-caret-square-o-right"></i> Chỉnh sửa nhóm quyền</header>
                <div class="panel-body" style="min-height: 600px;">
                    <form method="post" action="<%=request.getContextPath()%>/admin/system/group/edit" theme="simple"  enctype="multipart/form-data" class="form-horizontal" cssStyle="" validate="true">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="line-height: 30px">Tên nhóm quyền <span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <div class="input-group m-b">
                                        <span class="input-group-addon">
                                            <i class="fa fa-user" aria-hidden="true"></i>
                                        </span>
                                    <input type="text" class="form-control input-sm" value="${item.groupName}" name="groupName"/>
                                    <input type="hidden" class="form-control input-sm" value="${item.id}" name="id"/>

                                </div>
                                <form:errors cssStyle="color: red" path="groupView.groupName" />
                            </div>
                        </div>
                        <div class="line line-dashed line-lg pull-in"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="line-height: 30px">Diễn giải </label>

                            <div class="col-sm-10">
                                 <textarea  name="description"  path=""
                                            class="form-control">${item.description}</textarea>

                            </div>
                        </div>
                        <div class="line line-dashed line-lg pull-in"></div>
                        <span class="control-span m-l">Phân quyền:</span>
                        <div class="line line-dashed line-lg pull-in"></div>
                        <div class="form-group ">

                            <div class="col-md-12" style="margin-left: 40px">
                                <div><span><input type="checkbox" id="grantCheckAll" name="checkAll" /> &nbsp;<label class="font-bold">Tất cả các quyền</label></span></div>
                                <div class="line line-dashed line-lg pull-in" style="clear:both ;border-top:0px"></div>
                                <c:forEach var="group" items="${groups}" varStatus="stat">
                                    <div class="col-md-4"  >
                                        <table style="line-height: 2.0; border: 0">
                                            <tbody>

                                            <tr>
                                                <td  style="padding-left: 15px; vertical-align: top;">
                                                    <input type="checkbox"  name="listAuthority" value="${group.parent.id}"   onchange="checkAllInRow(this)" /><label class="font-bold"> ${group.parent.description}</label>
                                                </td>
                                            </tr>
                                            <c:forEach var="children" items="${group.childrens}">
                                                <tr>
                                                    <td  style="padding-left: 40px; vertical-align: top;" >
                                                        <input type="checkbox"  name ="listAuthority" onchange="checkChildren(this)" value="${children.id}" alt="chk"  />
                                                            ${children.description}
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <c:if test="${stat.count%3==0}">
                                        <div class="line line-dashed line-lg pull-in" style="clear:both ;border-top:0px"></div>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="line line-dashed line-lg pull-in" style="clear:both ;margin-bottom: 50px"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-5">
                                <a href="<%=request.getContextPath()%>/admin/system/group/list" class="btn btn-default">Hủy bỏ</a>
                                <button type="submit" data-loading-text="Thêm mới" class="btn btn-primary">Cập nhật</button>
                            </div>
                        </div>
                    </form>

                </div>
            </section>
        </section>
        <footer class="footer bg-white b-t b-light"><small>Cổng dịch vụ công chứng &copy; 2019</small></footer>
    </section>
    <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen" data-target="#nav"></a>
</section>
<script>
    $(document).ready(function () {
        /*Quy uoc cha con cho checkbox*/
        $('#grantCheckAll').checkboxes({
            itemChild: 'list'
        });
        /*load quyen*/
        var systems = "${item.listAuthority}".split(",");
        $("input[name='listAuthority']").each(function() {
            for(var i=0; i<systems.length;i++){
                if(systems[i] == this.value) {
                    $(this).prop('checked', true);
                }
            }
        });

        /*Kiem tra checkbox trong bang dc check toan bo khong*/
        function checkAllCheck(){
            var result=true;
            $("input[name='listAuthority']").each(function() {
                if(!$(this).is(':checked')){
                    result=false;
                    return result;
                }

            });
            return result;
        }
        var checkAllCheck=checkAllCheck();
        if(checkAllCheck){
            $('#grantCheckAll').prop('checked', true);
        }

    });

    function checkAllInRow(e){
        if($(e).is(':checked')) $(e).parent().parent().parent().find("input:checkbox").each(function() {
            $(this).prop('checked', true);
        });
        else $(e).parent().parent().parent().find("input:checkbox").each(function() {
            $(this).prop('checked', false);
        });
    }

    function checkChildren(e) {
        if($(e).is(':checked')){
            var check=checkAllValue();
            if(check){
                $(e).parent().parent().parent().find("input:checkbox").each(function(i) {
                    if(i==0){
                        $(this).prop('checked', true);
                    }
                });
            }
        }else{
            $(e).parent().parent().parent().find("input:checkbox").each(function(i) {
                if(i==0){
                    $(this).prop('checked', false);
                }
            });
        }

        function checkAllValue() {
            var result=true;
            $(e).parent().parent().parent().find("input[type='checkbox']").each(function(i) {
                //ko tinh doi tuong dau tien: item_ALL(leader nhom quyen)
                if(!$(this).is(':checked')){
                    if(i>0){
                        result= false;
                    }
                }
            });
            return result;
        }
    }
</script>