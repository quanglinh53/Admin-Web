<%@ page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--<%@ taglib uri="http://ckeditor.com" prefix="ckeditor"%>--%>
<%--<%@ taglib uri="http://cksource.com/ckfinder" prefix="ckfinder" %>--%>
<script src="<%=request.getContextPath()%>/assets/ckeditor/ckeditor.js"></script>
<script src="<%=request.getContextPath()%>/assets/ckfinder/ckfinder.js"></script>
<section id="content">
    <section class="vbox">
        <section class="scrollable padder">
            <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
                <li><a href="<%=request.getContextPath()%>/admin"><i class="fa fa-home"></i>&nbsp;Trang chủ</a></li>
                <li><a href="#">Quản lý nội dung</a></li>
                <li><a href="#">Bài viết</a></li>
                <li><a href="javascript:void(0)">Sửa</a></li>
            </ul>
            <div class="m-b-md">
                <%--<h3 class="m-b-none">Sửa bài viết</h3><br/>--%>
                <span style="color:red">${messageError}</span>
            </div>

            <section class="panel panel-default">
                <header class="panel-heading"><i class="fa fa-caret-square-o-right"></i> Chỉnh sửa bài viết</header>
                <div class="panel-body" style="min-height: 600px;">
                    <form method="post" action="<%=request.getContextPath()%>/admin/content/article/edit" theme="simple"
                          enctype="multipart/form-data" class="form-horizontal" cssStyle="" validate="true">
                        <input name="id" maxlength="100" style="width:100%;" value="${item.id}" placeholder=""
                               id="articleId" class="form-control" type="hidden"/>

                        <input type="hidden" id="status" name="status" value="${item.status}">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Kích hoạt bài viết</label>
                            <div class="col-sm-10">
                                <label class="switch">
                                    <input id="checkboxActive" type="checkbox" ${item.status==1?"checked":""} onclick="changeStatusActiveArticle()">
                                    <span></span>
                                </label>
                            </div>
                        </div>

                        <input type="hidden" id="isPin" name="isPin" value="${item.isPin}">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Gim bài viết</label>
                            <div class="col-sm-10">
                                <label class="switch">
                                    <input id="checkboxIsPin" type="checkbox" ${item.isPin==1?"checked":""} onclick="changeStatusPinArticle()">
                                    <span></span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="line-height: 30px">Nhóm chủ đề
                                <code>*</code></label>
                            <div class="col-sm-10">
                                <select id="groupTopic" <%--name="groupTopicId"--%> class="select2-option" style="min-width:200px"
                                        onchange="getListCategoryByGroupTopicSelected()">
                                    <c:forEach items="${groupTopics}" var="groupTopic">
                                        <option value="${groupTopic.id}">${groupTopic.groupName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">

                            <label class="col-sm-2 control-label" style="line-height: 30px">Danh mục
                                <code>*</code></label>
                            <div class="col-sm-10">
                                <select id="category" name="category.id" class="select2-option" style="min-width:200px">
                                    <c:forEach items="${categories}" var="category">
                                        <option value="${category.id}" ${item.category.id==category.id?"selected":""}>${category.name}</option>
                                    </c:forEach>
                                </select>
                                <form:errors cssStyle="color: red" path="article.category.id"/>
                            </div>
                        </div>
                        <div class="line line-dashed line-lg pull-in"></div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="line-height: 30px">Tiêu đề
                                <code>*</code></label>
                            <div class="col-sm-10">
                                <input id="title" name="title" placeholder="" maxlength="100" value="${item.title}"
                                       style="width:100%;" class="form-control"/>
                                <form:errors cssStyle="color: red" path="article.title"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="line-height: 30px">Nội dung ngắn
                                <code>*</code></label>
                            <div class="col-sm-10">
                                <input id="shortContent" name="shortContent" placeholder="" maxlength="100" value="${item.shortContent}"
                                       style="width:100%;" class="form-control"/>
                                <form:errors cssStyle="color: red" path="article.shortContent"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" style="line-height: 30px">Nội dung
                                <code>*</code></label>
                            <div class="col-sm-10">
                                 <textarea id="contentnews" name="content" class="form-control" cols="80"
                                           rows="10">${item.content}
                                 </textarea>
                                <%--<textarea name="content" rows="3" class="form-control ckeditor" style="width:100%;" id="content" ></textarea>--%>
                                <%--<ckfinder:setupCKEditor basePath="../../assets/ckfinder/" editor="contentnews" />--%>
                                <%--<ckeditor:replace replace="content" basePath="../../assets/ckeditor/" />--%>
                                <%--<ckeditor:editor basePath="../../assets/ckfinder/" editor="content" />--%>
                                <form:errors cssStyle="color: red" path="article.content"/>
                            </div>

                        </div>
                        <div class="line line-dashed line-lg pull-in" style="clear:both ;margin-bottom: 50px"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-5">
                                <a href="<%=request.getContextPath()%>/admin/content/article/list"
                                   class="btn btn-default">Hủy bỏ</a>
                                <button type="submit" data-loading-text="Cập nhật" class="btn btn-primary">Cập nhật
                                </button>
                            </div>
                        </div>
                    </form>

                </div>
            </section>
        </section>
        <footer class="footer bg-white b-t b-light">
            <small>Game FULL &copy; 2018</small>
        </footer>
    </section>
    <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen" data-target="#nav"></a>
</section>

<script type="text/javascript">
    /*

        function readURL(input) {

            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $(input).next('#idImagePlaceHolder').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
    */


    var editor = CKEDITOR.replace('contentnews',
        {
            filebrowserBrowseUrl: '<%=request.getContextPath()%>/assets/ckfinder/ckfinder.html',
            filebrowserImageBrowseUrl: '<%=request.getContextPath()%>/assets/ckfinder/ckfinder.html?type=Images',
            filebrowserUploadUrl:
                '<%=request.getContextPath()%>/assets/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files',
            filebrowserImageUploadUrl:
                '<%=request.getContextPath()%>/assets/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
        });

    //    CKEDITOR.replace('contentnews');
    //    var editor=CKEDITOR.replace('contentnews');
    CKFinder.setupCKEditor(editor, '<%=request.getContextPath()%>/assets/ckfinder/');


</script>

<script>

    function BrowseServer(startupPath, functionData) {
        // You can use the "CKFinder" class to render CKFinder in a page:
        var finder = new CKFinder();

        // The path for the installation of CKFinder (default = "/ckfinder/").
        finder.basePath = '../';

        //Startup path in a form: "Type:/path/to/directory/"
        finder.startupPath = startupPath;

        // Name of a function which is called when a file is selected in CKFinder.
        finder.selectActionFunction = SetFileField;

        // Additional data to be passed to the selectActionFunction in a second argument.
        // We'll use this feature to pass the Id of a field that will be updated.
        finder.selectActionData = functionData;

        // Name of a function which is called when a thumbnail is selected in CKFinder. Preview img
        // finder.selectThumbnailActionFunction = ShowThumbnails;

        // Launch CKFinder
        finder.popup();
    }

    // This is a sample function which is called when a file is selected in CKFinder.


</script>
<script>
    $('#shortContent').keypress(function () {
        var shortContent = $(this).val();
        var arr_content = shortContent.split(" ");
        var keywords = "";
        var length = 9;
        if (arr_content.length <= length) length = arr_content.length;
        var i;
        for (i = 0; i < length; i++) {//only gen keywords for 9 words of title
            var thisWord = arr_content[i].trim();
            if (thisWord != '') keywords += thisWord + ", ";
        }
        keywords = keywords.trim().substring(0, keywords.length - 2);
        $('#metaKeyword').val(keywords);
        $('#metaKeyword').text(keywords);
        $('#metaDescription').val(shortContent);
        $('#metaDescription').text(shortContent);
    });

    $('#title').keypress(function () {
        var title = $(this).val();
        $('#metaTitle').val(title);
        $('#metaTitle').text(title);
    })
</script>
<script>
    function changeStatusPinArticle() {
        /* var check = $('#checkboxIsPin').val();*/
        if ($('#checkboxIsPin').is(":checked")) {
            $('#isPin').val(1);
        } else $('#isPin').val(0);
    }

    function changeStatusActiveArticle() {
        if ($('#checkboxActive').is(":checked")) {
            $('#status').val(1);
        } else $('#status').val(0);
    }

    $( document ).ready(function() {
        // Handler for .ready() called.
        getListCategoryByGroupTopicSelected();
    });

    function getListCategoryByGroupTopicSelected(){
        var groupTopic = $("#groupTopic").val();
        $.ajax({
            type: "GET",
            url: "<%=request.getContextPath()%>/admin/content/category/list-by-group-topic",
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            data: {
                groupTopicId: groupTopic
            },
            success: function (response) {
                var listCategory = response;
                var htmlContent = '<select id="category" name="category.id" class="select2-option" style="min-width:200px">';
                for (var i = 0; i < listCategory.length; i++) {
                    var category = listCategory[i];
                    if (category.id == null || category.id == "") continue;
                    if (category.id == '${item.category.id}') {
                        htmlContent += '<option value ="' + category.id + '" selected>' + category.name + '</option>';
                    } else {
                        htmlContent += '<option value ="' + category.id + '">' + category.name + '</option>';
                    }
                }
                htmlContent += '</select>';
                $('#category').html(htmlContent);


            },
            error: function (e) {
                console.log("ERROR: ", e);
            },
            done: function (e) {
                console.log("DONE");
            }
        })

    }
</script>