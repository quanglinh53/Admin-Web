<%@ page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="<%=request.getContextPath()%>/assets/ckeditor/ckeditor.js"></script>
<script src="<%=request.getContextPath()%>/assets/ckfinder/ckfinder.js"></script>
<script src="<%=request.getContextPath()%>/assets/project/admin/content/article/list.js"></script>
<script type="text/javascript">
    $("#sansim-status").show();
    setTimeout(function () {
        $("#sansim-status").hide();
    }, 5000);
</script>
<style>
    img{
        width: 100%;
    }
</style>
<section id="content" ng-app="sansimso" ng-controller="newsListCtrl">
    <section class="vbox">
        <section class="scrollable padder">
            <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
                <li><a href="<%=request.getContextPath()%>/admin"><i class="fa fa-home"></i>&nbsp;Trang chủ</a></li>
                <li><a href="#">Quản lý nội dung</a></li>
                <li><a href="#">Quản lý bài viết</a></li>
                <li><a href="javascript:void(0)">Danh sách</a></li>
            </ul>
            <div class="m-b-md" id="sansim-status">
                <h3 class="m-b-none" style="color: #009900">
                    <c:if test="${success.length()>0}">${success}</c:if>
                </h3>
                <h3 class="m-b-none" style="color:red">
                    <c:if test="${messageError.length()>0}">${messageError}</c:if>
                </h3>
            </div>
            <section class="panel panel-default">
                <header class="panel-heading"><i class="fa fa-caret-square-o-right"></i> Quản lý danh sách bài viết

                </header>
                <div class="text-sm wrapper bg-light lt">
                    <form cssClass="form-inline padder" action="list" role="form" theme="simple">

                        <div class="line line-dashed line-lg pull-in" style="clear:both ;border-top:0px"></div>
                        <div class="form-group">

                            <div class="col-md-6">
                                <label class="col-sm-2 control-label" style="text-align: end;">Tiêu đề</label>
                                <div class="col-sm-10">
                                    <input ng-model="search.name" name="name" placeholder="" maxlength="50" my-enter="search()"
                                           class="input-sm form-control"/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label class="col-sm-2 control-label" style="text-align: end;">Trạng thái</label>
                                <div class="col-sm-10">
                                   <select ng-model="search.status" class="form-control">
                                       <option value="">Tất cả</option>
                                       <option value="0">Mới tạo</option>
                                       <option value="1">Chờ duyệt</option>
                                       <option value="2">Đã duyệt</option>
                                       <option value="3">Từ chối</option>
                                   </select>
                                </div>
                            </div>


                        </div>
                        <div class="line line-dashed line-lg pull-in" style="clear:both ;border-top:0px"></div>
                        <div class="form-group text-center">
                            <a ng-click="search()" class="btn btn-info btn-sm ">Tìm kiếm</a>
                            <sec:authorize access="hasRole('ROLE_CONTENT_ARTICLE_VIEW')">
                            <a class="btn btn-sm btn-primary <%--pull-right--%>" ng-click="modalADD()"><i
                                    class="fa fa-plus"></i> Thêm mới</a>
                            </sec:authorize>

                    </form>
                </div>

                <div class="table-responsive table-overflow-x-fix">
                    <table id="tbl" class="table table-striped table-bordered m-b-none text-sm">
                        <thead>
                        <tr>
                            <th class="box-shadow-inner small_col text-center">#</th>
                            <th class="box-shadow-inner small_col text-center">Tiêu đề</th>
                            <th class="box-shadow-inner small_col text-center">Trạng thái</th>
                            <th class="box-shadow-inner small_col text-center">Thời gian</th>
                            <th class="box-shadow-inner small_col text-center">Người tạo</th>
                            <th class="box-shadow-inner small_col text-center">Người duyệt</th>
                            <th class="box-shadow-inner small_col text-center">Ngày duyệt</th>
                            <th class="box-shadow-inner small_col text-center">Số lượt truy cập</th>
                            <sec:authorize
                                    access="hasAnyRole('ROLE_CONTENT_ARTICLE_EDIT','ROLE_CONTENT_ARTICLE_DELETE')">
                                <th class="box-shadow-inner small_col text-center action-thead-3-items">Hoạt động</th>
                            </sec:authorize>
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="item in page.items track by $index">
                            <td class="align-center truong-text-verticel">{{(page.pageNumber-1)*page.numberPerPage +
                                $index+1}}
                            </td>
                            <td class="align-center truong-text-verticel"><a
                                    href="#" ng-click="openDetail(item)">{{item.title}}</a>
                            </td>
                            <td class="align-center truong-text-verticel">
                                {{item.status==0?"Mới tạo":item.status==1?"Chờ duyệt":item.status==2?"Đã duyệt":"Từ chối"}}
                            </td>
                            <td class="align-center">{{item.dateCreated | date:'dd/MM/yyyy HH:mm:ss'}}</td>
                            <td>{{item.userCreated}}</td>
                            <td>{{item.userUpdated}}</td>
                            <td class="align-center">{{item.dateUpdated | date:'dd/MM/yyyy HH:mm:ss'}}</td>
                            <td>{{item.view}}</td>
                            <sec:authorize
                                    access="hasAnyRole('ROLE_CONTENT_ARTICLE_EDIT','ROLE_CONTENT_ARTICLE_DELETE')">
                                <td class="align-center">


                                        <a ng-click="edit(item)" ng-if="item.status!=2 && userLogin.username==item.userCreated">
                                           Sửa
                                        </a>
                                        <a ng-if="userLogin.username==item.userCreated && item.status==0" ng-click="capNhat(1,item)">
                                           Gửi
                                        </a>
                                        <a ng-if="userLogin.role==1 && item.status!=2" ng-click="capNhat(2,item)">
                                            Duyệt
                                        </a>
                                        <a ng-if="userLogin.role==1" ng-click="capNhat(3,item)">
                                            Từ chối
                                        </a>
                                        <a ng-click="xoa(item.id)" ng-if="userLogin.username==item.userCreated && item.status!=2">
                                            Xóa
                                        </a>


                                </td>
                            </sec:authorize>
                        </tr>

                        </tbody>
                    </table>
                </div>
                <footer class="panel-footer">
                    <div class="row">
                        <div class="col-sm-12 text-right text-center-xs">
                            <div class="col-sm-6 text-left">
                                <span>Tổng số <code>{{page.rowCount}}</code> dữ liệu</span>
                            </div>
                            <div class="col-sm-6">
                                <ul class="pagination pagination-sm m-t-none m-b-none">
                                    <li ng-if="page.pageNumber>1"><a href="javascript:void(0)"
                                                                     ng-click="loadPage(1)">«</a></li>
                                    <li ng-repeat="item in page.pageList">
                                        <a href="javascript:void(0)" ng-if="item==page.pageNumber"
                                           style="color:mediumvioletred;"> {{item}}</a>
                                        <a href="javascript:void(0)" ng-if="item!=page.pageNumber"
                                           ng-click="loadPage(item)"> {{item}}</a>
                                    </li>
                                    <li ng-if="page.pageNumber<page.pageCount"><a href="javascript:void(0)"
                                                                                  ng-click="loadPage(page.pageCount)">»</a>
                                    </li>
                                </ul>
                            </div>

                        </div>
                    </div>
                </footer>
            </section>
        </section>
    </section>
    <div class="modal fade" id="AddNew" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true"
         data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content" style="width:800px;">
                <div class="modal-header"
                     style="padding: 7px;background-color: #027DB4;;border-radius: 4px 4px 0 0;">
                    <button type="button" style="color: red;" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>

                    <h6 class="modal-title font-weight-bold" id="myModalLable1" style="
                    background-color: #027DB4;
                    border-radius: 4px 4px 0 0;
                    color: white;" ng-if="labelAdd=='ADD'">Thêm mới</h6>
                    <h6 class="modal-title font-weight-bold" style="
                    background-color: #027DB4;
                    border-radius: 4px 4px 0 0;
                    color: white;" ng-if="labelAdd=='EDIT'">Sửa</h6>

                </div>


                <div style="text-align: center;    text-align: center;
                 padding-top: 10px;
                 padding-bottom: 10px;
                 font-size: 19px;
                 color: #027DB4;"></div>
                <form id="form-save">
                    <div class="modal-body" style="padding: 10px;">
                        <section class="panel panel-default">

                            <div class="row" style="padding-top: 1%; padding-bottom: 1%">
                                <div class="col-md-12">
                                    <div class="col-sm-2">
                                        <label>Tiêu đề <font
                                                color="red"> *</font></label>
                                    </div>
                                    <div class="col-sm-10">
                                        <input ng-model="article.title" class="form-control" type="text"
                                               placeholder="" required data-parsley-trigger="change"/>

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-sm-2">
                                        <label>Nội dung ngắn <font
                                                color="red"> *</font></label>
                                    </div>
                                    <div class="col-sm-10">
                                        <input ng-model="article.shortContent" class="form-control" type="text"
                                               placeholder="" required data-parsley-trigger="change"/>

                                    </div>



                                </div>
                            </div>
                            <div class="row" style="padding-top: 1%; padding-bottom: 1%">
                                <div class="col-md-12">
                                    <div class="col-sm-2">
                                        <label>Thuộc phụ lục<font
                                                color="red"> *</font></label>
                                    </div>

                                    <div class="col-sm-4">
                                        <select ng-model="article.categoryId" class="form-control" style="width: 100%;"
                                                required="required">
                                            <option value="">Lựa chọn</option>
                                            <option ng-repeat="item in listCategory track by $index"
                                                    ng-value="{{item.id}}">{{item.name}}
                                            </option>

                                        </select>
                                    </div>


                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-sm-2">
                                        <label>Ảnh banner :</label>
                                        <label ng-if="pending=='ON'">Đang tải lên...</label>
                                    </div>
                                    <div class="col-sm-2">
                                        <div id="PreviewPicture"
                                             style="background-repeat: no-repeat;background-size: contain;height: 200px;background-image: url('<%=request.getContextPath()%>{{article.thumbail}}');">

                                        </div>
                                    </div>
                                    <div class="col-md-2 form-group">
                                        <label class="btn btn-default" for="FileUpload">Chọn ảnh</label>

                                    </div>
                                    <div class="col-sm-8">

                                        <input id="FileUpload" type="file" file-model="filebackground"
                                               name="ImageUpload" class="hidden col-md-8 input-sm p-l-0"
                                               custom-on-change="uploadImage"/>


                                    </div>

                                </div>
                            </div>


                            <div class="row" style="padding-top: 1%; padding-bottom: 1%">
                                <div class="col-md-12">
                                    <div class="col-sm-2">
                                        <label>Nội dung bài viết<font
                                                color="red"> *</font></label></label>
                                    </div>
                                    <div class="col-sm-10">
                                <textarea id="contentnews" name="content" ng-model="article.content" class="form-control valid_form content_news"
                                          placeholder="" required data-parsley-trigger="change">

                                </textarea>

                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-sm-5">

                                </div>
                                <div class="col-sm-6" >
                                    <button ng-if="pending!='ON'" data-toggle="modal" ng-click="modalLuu()"
                                            class="btn btn-primary"><i
                                            class="fa fa-save"></i>Lưu
                                    </button>

                                    <button type="button" class="btn btn-danger" data-dismiss="modal"><i
                                            class="fa fa-times"></i>Hủy
                                    </button>


                                </div>
                            </div>


                        </section>

                    </div>
                </form>

            </div>
        </div>

    </div>
    <div class="modal fade" id="modalDuyet" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
        <div class="modal-dialog" style="max-width: 500px;">
            <div class="modal-content" style="max-width: 500px;">
                <div class="modal-header" style="padding: 7px;">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h5 class="modal-title" >Lưu thay đổi</h5>
                </div>

                <div class="modal-body" style="padding: 10px;">
                    <div class="form-group">
                        <label class="control-label">Bạn chắc chắn lưu thay đổi này hay không?</label>
                    </div>

                </div>
                <div class="modal-footer" style="padding: 10px;">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Hủy bỏ</button>
                    <button ng-click="comfimDuyet()" class="btn btn-danger">Đồng ý</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="detail" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true"
         data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content" style="width:800px;">
                <div class="modal-header"
                     style="padding: 7px;background-color: #027DB4;;border-radius: 4px 4px 0 0;">
                    <button type="button" style="color: red;" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>


                    <h6 class="modal-title font-weight-bold">Xem chi tiết</h6>

                </div>


                <div style="text-align: center;    text-align: center;
                 padding-top: 10px;
                 padding-bottom: 10px;
                 font-size: 19px;
                 color: #027DB4;"></div>
                    <div class="modal-body" style="padding: 10px;">
                        <section class="panel panel-default">

                            <div class="row" style="padding-top: 1%; padding-bottom: 1%">
                                <div class="col-md-12">
                                    <div class="col-sm-2">
                                        <label>Tiêu đề <font
                                                color="red"> *</font></label>
                                    </div>
                                    <div class="col-sm-4">
                                        {{baiviet.title}}

                                    </div>
                                    <div class="col-sm-2">
                                        <label>Nội dung ngắn<font
                                                color="red"> *</font></label></label>
                                    </div>
                                    <div class="col-sm-4">
                                       {{baiviet.shortContent}}
                                    </div>


                                </div>
                            </div>
                            <div class="row" style="padding-top: 1%; padding-bottom: 1%">
                                <div class="col-md-12">
                                    <div class="col-sm-2">
                                        <label>Thuộc phụ lục<font
                                                color="red"> *</font></label>
                                    </div>

                                    <div class="col-sm-4">
                                        <select ng-model="baiviet.categoryId" class="form-control" style="width: 100%;"
                                                required="required">
                                            <option value="">Lựa chọn</option>
                                            <option ng-repeat="item in listCategory track by $index"
                                                    ng-value="{{item.id}}">{{item.name}}
                                            </option>

                                        </select>
                                    </div>


                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-sm-2">
                                        <label>Ảnh banner :</label>
                                    </div>
                                    <div class="col-sm-8">
                                    <img src="<%=request.getContextPath()%>/{{baiviet.thumbail}}"/>
                                    </div>

                                </div>
                            </div>


                            <div class="row" style="padding-top: 1%; padding-bottom: 1%">
                                <div class="col-md-12">
                                    <div class="col-sm-2">
                                        <label>Nội dung bài viết</label>
                                    </div>
                                    <div class="col-sm-10" ng-bind-html="baiviet.content">


                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-sm-5">

                                </div>
                                <div class="col-sm-6">

                                    <button type="button" class="btn btn-danger" data-dismiss="modal"><i
                                            class="fa fa-times"></i>Hủy
                                    </button>


                                </div>
                            </div>


                        </section>

                    </div>
                </form>

            </div>
        </div>

    </div>
    <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen" data-target="#nav"></a>
    <sec:authorize access="hasAnyRole('ROLE_CONTENT_ARTICLE_DELETE')">
        <div class="modal fade" id="modalxoa" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
            <div class="modal-dialog" style="max-width: 500px;">
                <div class="modal-content" style="max-width: 500px;">
                    <div class="modal-header" style="padding: 7px;">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h5 class="modal-title" id="myModalLable">Xóa bài viết</h5>
                    </div>

                    <div class="modal-body" style="padding: 10px;">
                        <div class="form-group">
                            <label class="control-label">Bạn xác nhận xóa bài viết này?</label>
                        </div>

                    </div>
                    <div class="modal-footer" style="padding: 10px;">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Hủy bỏ</button>
                        <button ng-click="comfimXoa()" class="btn btn-danger">Xóa</button>
                    </div>
                </div>
            </div>
        </div>
    </sec:authorize>

</section>
<script type="text/javascript">    $("#deleteAd").click(function () {
    var id = $(this).data('item.id');
});


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
$(function() {
    $("#FileUpload").on("change", function(){
        var files = !!this.files ? this.files : [];
        if (!files.length || !window.FileReader) return; // Check if File is selected, or no FileReader support
        if (/^image/.test( files[0].type)){ //  Allow only image upload
            var ReaderObj = new FileReader(); // Create instance of the FileReader
            ReaderObj.readAsDataURL(files[0]); // read the file uploaded
            ReaderObj.onloadend = function(){ // set uploaded image data as background of div
                $("#PreviewPicture").css("background-image", "url("+this.result+")");
            }
        }else{
            alert("Upload an image");
        }
    });
});

</script>
