<%@ page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="<%=request.getContextPath()%>/assets/ckeditor/ckeditor.js"></script>
<script src="<%=request.getContextPath()%>/assets/ckfinder/ckfinder.js"></script>
<section id="content">
    <section class="vbox">
        <section class="scrollable padder">
            <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
                <li><a href="<%=request.getContextPath()%>/admin"><i class="fa fa-home"></i>&nbsp;Trang chủ</a></li>
                <li><a href="#">Quản lý nội dung</a></li>
                <li><a href="#">Bài viết</a></li>
                <li><a href="javascript:void(0)">Chi tiết</a></li>
            </ul>
            <div class="m-b-md">
                <%--<h3 class="m-b-none">Xem chi tiết bài viết</h3><br/>--%>
                <span style="color:red">${messageError}</span>
            </div>

            <section class="panel panel-default">
                <%--<header class="panel-heading">--%>
                    <%--<i class="fa fa-caret-square-o-right"></i> Xem chi tiết bài viết--%>
                        <%--<label class="control-label pull-right" style="line-height: 30px;"><a href="<%=request.getContextPath()%>/demo/${item.formaturl}.html" style=" color: blue" target="_blank"&lt;%&ndash;class="btn btn-default"&ndash;%&gt;>Xem trước bài viết</a></label>--%>
                <%--</header>--%>
                <div class="panel-body" style="min-height: 600px;">
                    <form method="post" action="<%=request.getContextPath()%>/admin/content/article/edit" theme="simple"  enctype="multipart/form-data" class="form-horizontal" cssStyle="" validate="true">
                        <input name="id" maxlength="100" style="width:100%;" value="${item.id}" placeholder="" class="form-control" type="hidden"/>
                        <input name="imageUrl" maxlength="100" style="width:100%;" value="${item.imageUrl}" placeholder="" class="form-control" type="hidden"/>
                        <div class="form-group">

                            <label class="col-sm-2 control-label" style="line-height: 30px">Danh mục <code>*</code></label>
                            <div class="col-sm-8">
                                <div class="input-group m-b">
                                    <span class="input-group-addon">
                                            <i class="fa fa-rotate-right" style="font-size: 11px" aria-hidden="true"></i>
                                        </span>
                                    <select id="category" name="category.id"  class="select2-option" disabled style="min-width:200px">
                                        <c:forEach items="${categories}" var="category">
                                            <option value="${category.id}" ${item.category.id==category.id?"selected":""}>${category.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <form:errors cssStyle="color: red" path="article.category.id" />
                            </div>
                        </div>
                        <div class="line line-dashed line-lg pull-in"></div>

                        <div id="type_Proc" class="type_Proc" hidden>
                            <div class="line line-dashed line-lg pull-in"></div>

                        </div>
                        <div class="line line-dashed line-lg pull-in"></div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="line-height: 30px">Tiêu đề <code>*</code></label>
                            <div class="col-sm-10">
                                <div class="input-group m-b">
                                        <span class="input-group-addon">
                                            <i class="fa fa-rotate-right" style="font-size: 11px" aria-hidden="true"></i>
                                        </span>
                                    <input name="title" placeholder="" maxlength="200" value="${item.title}" disabled style="width:100%;" class="form-control"/>
                                </div>
                                <form:errors cssStyle="color: red" path="article.title" />
                            </div>
                        </div>

                        <div class="line line-dashed line-lg pull-in"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="line-height: 30px">Nội dung tóm tắt <code>*</code></label>
                            <div class="col-sm-10">
                                <div class="input-group m-b">
                                        <span class="input-group-addon">
                                            <i class="fa fa-rotate-right" style="font-size: 11px" aria-hidden="true"></i>
                                        </span>
                                    <textarea disabled name="shortContent" placeholder="" maxlength="200" value="${item.shortContent}" style="width:100%;" class="form-control">${item.shortContent}</textarea>
                                </div>
                                <form:errors cssStyle="color: red" path="article.shortContent" />
                            </div>
                        </div>
                        <div class="line line-dashed line-lg pull-in"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="line-height: 30px">Nội dung </label>
                            <div class="col-sm-10">
                                 <textarea id="contentnews" name="content" class="form-control" cols="80" rows="10">${item.content}
                                 </textarea>
                                <%--<textarea name="content" rows="3" class="form-control ckeditor" style="width:100%;" id="content" ></textarea>--%>
                                <%--<ckfinder:setupCKEditor basePath="../../assets/ckfinder/" editor="contentnews" />--%>
                                <%--<ckeditor:replace replace="content" basePath="../../assets/ckeditor/" />--%>
                                <%--<ckeditor:editor basePath="../../assets/ckfinder/" editor="content" />--%>
                            </div>
                        </div>
                        <div class="line line-dashed line-lg pull-in"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="line-height: 30px">Ảnh </label>
                            <div class="col-sm-10">
                                <div class="input-group m-b">
                                    <input disabled type="file" name="file" id="file" accept="image/*"/>

                                    <c:if test="${item.imageUrl != '' && item.imageUrl != null}">
                                        <img  style="max-width: 500px"  id="idImagePlaceHolder" src="<%=request.getContextPath()%>${urlImage}${item.imageUrl}"/>
                                    </c:if>

                                    <%--<img  style="max-width: 500px"  id="idImagePlaceHolder" src="${urlImage}${item.imageUrl}"/>--%>
                                </div>
                            </div>
                        </div>

                        <div class="line line-dashed line-lg pull-in"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="line-height: 30px">Trạng thái</label>
                            <div class="col-sm-10">
                                <div class="radio">
                                    <label class="radio-custom">
                                        <input disabled type="radio" value="true" name="active" ${item.active==true?'checked="checked"':''}  checked>
                                        <i class="fa fa-circle-o"></i>
                                        Hiển thị
                                    </label>
                                </div>
                                <div class="radio">
                                    <label class="radio-custom">
                                        <input disabled type="radio" value="false" name="active" ${item.active==false?'checked="checked"':''} >
                                        <i class="fa fa-circle-o"></i>
                                        Không hiển thị
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="line line-dashed line-lg pull-in"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="line-height: 30px">Thẻ title</label>
                            <div class="col-sm-10">
                                <div class="input-group m-b">
                                        <span class="input-group-addon">
                                            <i class="fa fa-rotate-right" style="font-size: 11px" aria-hidden="true"></i>
                                        </span>
                                    <textarea disabled name="metaTitle" placeholder="" maxlength="2000" value="${item.metaTitle}" style="width:100%;" class="form-control"  path="metaTitle">${item.metaTitle}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="line line-dashed line-lg pull-in"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="line-height: 30px">Thẻ meta-description </label>
                            <div class="col-sm-10">
                                <div class="input-group m-b">
                                        <span class="input-group-addon">
                                            <i class="fa fa-rotate-right" style="font-size: 11px" aria-hidden="true"></i>
                                        </span>
                                    <textarea disabled name="metaDescription" placeholder="" maxlength="2000" value="${item.metaDescription}" style="width:100%;" class="form-control">${item.metaDescription}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="line line-dashed line-lg pull-in"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="line-height: 30px">Thẻ meta-keyword </label>
                            <div class="col-sm-10">
                                <div class="input-group m-b">
                                        <span class="input-group-addon">
                                            <i class="fa fa-rotate-right" style="font-size: 11px" aria-hidden="true"></i>
                                        </span>
                                    <textarea disabled name="metaKeyword" placeholder="" maxlength="2000" value="${item.metaKeyword}" style="width:100%;" class="form-control">${item.metaKeyword}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="line line-dashed line-lg pull-in"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="line-height: 30px">Thẻ alt ảnh </label>
                            <div class="col-sm-10">
                                <div class="input-group m-b">
                                        <span class="input-group-addon">
                                            <i class="fa fa-rotate-right" style="font-size: 11px" aria-hidden="true"></i>
                                        </span>
                                    <textarea disabled name="altImage" placeholder="" maxlength="2000" value="${item.altImage}" style="width:100%;" class="form-control">${item.altImage}</textarea>
                                </div>
                            </div>
                        </div>


                        <div class="line line-dashed line-lg pull-in" style="clear:both ;/*margin-bottom: 50px*/"></div>
                        <div class="form-group" style="margin-bottom: 5%">
                            <div class="col-sm-8 col-sm-offset-5">
                                <sec:authorize access="hasAnyRole('ROLE_CONTENT_ARTICLE_BROWSE')">
                                    <c:if test="${item.status_browse != 2}">
                                        <a data-toggle="modal" data-target="#browseItem" class="btn btn-s-md btn-success">Duyệt bài viết</a>
                                        <a data-toggle="modal" data-target="#returnedItem" class="btn btn-s-md btn-warning">Trả về</a>
                                    </c:if>
                                </sec:authorize>

                                <%--<a href="<%=request.getContextPath()%>/admin/content/article/detail/${item.id}" class="btn btn-s-md btn-success">Duyệt bài</a>--%>
                                <a href="<%=request.getContextPath()%>/admin/content/article/edit/${item.id}" class="btn btn-s-md btn-primary">Chỉnh sửa</a>
                                <a href="<%=request.getContextPath()%>/admin/content/article/list" class="btn btn-s-md btn-dark">Quay lại danh sách</a>
                            </div>
                        </div>
                    </form>

                </div>
            </section>
        </section>
        <footer class="footer bg-white b-t b-light"><small>Cổng dịch vụ công chứng &copy; 2019</small></footer>
    </section>
    <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen" data-target="#nav"></a>

    <sec:authorize access="hasAnyRole('ROLE_CONTENT_ARTICLE_BROWSE')">
        <div class="modal fade"  id="browseItem"  role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
            <div class="modal-dialog" style="max-width: 500px;">
                <div class="modal-content"style="max-width: 500px;">
                    <div class="modal-header" style="padding: 7px;">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h5 class="modal-title" id="myModalLable">Duyệt bài viết</h5>
                    </div>
                    <form id="filter" method="POST"  action="<%=request.getContextPath()%>/admin/content/article/browse" theme="simple" enctype="multipart/form-data" cssClass="form-horizontal" cssStyle="" validate="false">
                        <div class="modal-body"  style="padding: 10px;">
                            <div class="form-group">
                                <label class="control-label">Bạn xác nhận duyệt viết này?</label>
                                <input name="id"  type="hidden" class="form-control" value="${item.id}"/>
                                <input name="status"  type="hidden" class="form-control" value="true"/>
                            </div>

                        </div>
                        <div class="modal-footer" style="padding: 10px;" >
                            <button type="button" class="btn btn-default" data-dismiss="modal">Hủy bỏ</button>
                            <button type="submit" class="btn btn-danger">Xác nhận</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </sec:authorize>


    <sec:authorize access="hasAnyRole('ROLE_CONTENT_ARTICLE_BROWSE')">
        <div class="modal fade"  id="returnedItem"  role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
            <div class="modal-dialog" style="max-width: 500px;">
                <div class="modal-content"style="max-width: 500px;">
                    <div class="modal-header" style="padding: 7px;">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h5 class="modal-title" <%--id="myModalLable"--%>>Trả về bài viết</h5>
                    </div>
                    <form <%--id="filter"--%> method="POST"  action="<%=request.getContextPath()%>/admin/content/article/browse" theme="simple" enctype="multipart/form-data" cssClass="form-horizontal" cssStyle="" validate="false">
                        <div class="modal-body"  style="padding: 10px;">
                            <div class="form-group">
                                <label class="control-label">Bạn xác nhận trả về viết này?</label>
                                <input name="id"  type="hidden" class="form-control" value="${item.id}"/>
                                <input name="status"  type="hidden" class="form-control" value="false"/>
                            </div>

                        </div>
                        <div class="modal-footer" style="padding: 10px;" >
                            <button type="button" class="btn btn-default" data-dismiss="modal">Hủy bỏ</button>
                            <button type="submit" class="btn btn-danger">Xác nhận</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </sec:authorize>

</section>

<script type="text/javascript">

    function readURL(input) {

        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $(input).next('#idImagePlaceHolder').attr('src', e.target.result);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }

    $(function(){
        <%--$("#idImagePlaceHolder").ready(function () {--%>
        <%--$('#idImagePlaceHolder').attr('src','${request.getContextPath()+"/upload/"}${item.imageUrl}');--%>
        <%--});--%>
        $("#file").change(function () { //set up a common class
            readURL(this);
        });
    });

    $(document).ready(function(){
        if($("#category").val()==2){
            $("#type_Proc").show();
        }
    });


    var editor=CKEDITOR.replace( 'contentnews',
        {
            filebrowserBrowseUrl : '<%=request.getContextPath()%>/assets/ckfinder/ckfinder.html',
            filebrowserImageBrowseUrl : '<%=request.getContextPath()%>/assets/ckfinder/ckfinder.html?type=Images',
            filebrowserUploadUrl :
                '<%=request.getContextPath()%>/assets/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files',
            filebrowserImageUploadUrl :
                '<%=request.getContextPath()%>/assets/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
        });

    //    CKEDITOR.replace('contentnews');
    //    var editor=CKEDITOR.replace('contentnews');
    CKFinder.setupCKEditor(editor,'<%=request.getContextPath()%>/assets/ckfinder/');


</script>