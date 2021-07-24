var app = angular.module('sansimso', ["ngSanitize"]);
app.controller('detailPostController', ['$scope', '$http'
    , function ($scope, $http) {
        /*$scope.customer =  customer;*/
        $scope.post = {};
        $scope.comments = [];
        $scope.postsSameTopic = [];
        $scope.postId = id;
        $scope.pageComment = page;
        $scope.sessionUser = $('#sessionUser').val();
        console.log("session user = " + $scope.sessionUser);


        //khu vực init function
        getPageComment(1);
        //and khu vực init funtion

        //call api lấy thông tin bài viết theo id
        $http.get(preUrl + "/noi-dung/bai-viet/get-by-id", {params: {id: $scope.postId}})
            .then(function (response) {
                $scope.post = response.data;
                getPostSameTopic($scope.post.categoryId);
            });

        //call api lấy danh sách bài viết cùng chuyên mục
        function getPostSameTopic(topicId) {
            $http.get(preUrl + "/noi-dung/bai-viet/cung-chuyen-muc", {params: {id: topicId}})
                .then(function (response) {
                    $scope.postsSameTopic = response.data;
                });
        }

        function getPageComment(page) {
            //call api lấy comment của bài viết
            $http.get(preUrl + "/comment/page-by-post", {params: {p: page, postId: $scope.postId}})
                .then(function (response) {
                    if (response != null && response != 'undefined' && response.status == 200) {
                        $scope.pageComment = response.data;
                        $scope.pageComment.pageCount = getPageCount($scope.pageComment);
                        $scope.pageComment.pageList = getPageList($scope.pageComment);

                    }

                    /*var arrEle = document.getElementsByClassName("show_comment");
                    for(var i =0;i<arrEle.length;i++){
                        CKEDITOR.replace(arrEle[i].id,
                            {
                                filebrowserBrowseUrl: '<%=request.getContextPath()%>/assets/ckfinder/ckfinder.html',
                                filebrowserImageBrowseUrl: '<%=request.getContextPath()%>/assets/ckfinder/ckfinder.html?type=Images',
                                filebrowserFlashBrowseUrl: '<%=request.getContextPath()%>/assets/ckfinder/ckfinder.html?type=Flash',
                                filebrowserUploadUrl: '<%=request.getContextPath()%>/assets/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files',
                                filebrowserImageUploadUrl: '<%=request.getContextPath()%>/assets/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
                                filebrowserFlashUploadUrl: '<%=request.getContextPath()%>/assets/ckfinder/core/connector/java/connector.java?command=QuickUpload&amp;type=Flash',
                                'height':'120px'
                            });
                    }*/


                })
        }

        $scope.loadPageComment = function (page) {
            //call api lấy comment của bài viết
            $http.get(preUrl + "/comment/page-by-post", {params: {p: page, postId: $scope.postId}})
                .then(function (response) {
                    if (response != null && response != 'undefined' && response.status == 200) {
                        $scope.pageComment = response.data;
                        $scope.pageComment.pageCount = getPageCount($scope.pageComment);
                        $scope.pageComment.pageList = getPageList($scope.pageComment);
                    }
                })
        };

        //call function lấy danh sách recomment của comment
        $scope.getRecomment = function (pageNumber, commentId) {
            $http.get(preUrl + "/comment/recomment/page-by-comment", {params: {p: pageNumber, commentId: commentId}})
                .then(function (response) {
                    if (response != null && response != 'undefined' && response.status == 200) {
                        $scope.pageReComment = response.data;
                        $scope.pageReComment.pageCount = getPageCount($scope.pageReComment);
                        $scope.pageReComment.pageList = getPageList($scope.pageReComment);
                        return $scope.pageReComment;
                    }
                });
        };

        //get more recomment
        $scope.getMoreRecomment = function (commentId, indexComment) {
            $http.get(preUrl + "/comment/recomment/all-by-comment", {params: {commentId: commentId}})
                .then(function (response) {
                    if (response != null && response != 'undefined' && response.status == 200) {
                        var listRecomment = response.data;
                        $scope.pageComment.items[indexComment].recomments = listRecomment;
                    }
                });
        };

        //call function post comment cuar bai viet
        $scope.postComment = function (postId) {

            var content = CKEDITOR.instances['comment'].getData();
            /*var content = $('#comment').val();*/
            if (content == null || typeof (content) == "undefined" || content == '') {
                toastr.error('Nội dung bình luận không được để trống!');
                return;
            }
            var objComment = {"postId": postId, "content": content};
            $http.post(preUrl + "/comment/add", objComment, {headers: {'Content-Type': 'application/json'}})
                .then(function (response) {
                    if (response.data.success === true) {
                        getPageComment($scope.pageComment.pageNumber);
                        //$('#comment').val("");
                        CKEDITOR.instances['comment'].setData('');
                    } else {
                        toastr.error(response.data.messageError);
                    }
                });

        };

        //call function post recomment cua comment
        $scope.viewRecomment = function (commentId) {
            //$('#div_recomment'+commentId).show();
            var idDivComment = 'div_recomment' + commentId;
            if ($('#' + idDivComment).is(":hidden")) {
                $('#' + idDivComment).show();
                CKEDITOR.replace('editorRecomment'+commentId, {
                    filebrowserBrowseUrl: '<%=request.getContextPath()%>/assets/ckfinder/ckfinder.html',
                    filebrowserImageBrowseUrl: '<%=request.getContextPath()%>/assets/ckfinder/ckfinder.html?type=Images',
                    filebrowserFlashBrowseUrl: '<%=request.getContextPath()%>/assets/ckfinder/ckfinder.html?type=Flash',
                    filebrowserUploadUrl: '<%=request.getContextPath()%>/assets/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files',
                    filebrowserImageUploadUrl: '<%=request.getContextPath()%>/assets/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
                    filebrowserFlashUploadUrl: '<%=request.getContextPath()%>/assets/ckfinder/core/connector/java/connector.java?command=QuickUpload&amp;type=Flash',
                    'height':'120px'
                });
            } else {
                $('#' + idDivComment).hide();
            }

            /*var editorId = 'editorRecomment'+commentId;
            var editor = CKEDITOR.replace(editorId,
                {
                    filebrowserBrowseUrl: '<%=request.getContextPath()%>/assets/ckfinder/ckfinder.html',
                    filebrowserImageBrowseUrl: '<%=request.getContextPath()%>/assets/ckfinder/ckfinder.html?type=Images',
                    filebrowserFlashBrowseUrl: '<%=request.getContextPath()%>/assets/ckfinder/ckfinder.html?type=Flash',
                    filebrowserUploadUrl: '<%=request.getContextPath()%>/assets/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files',
                    filebrowserImageUploadUrl: '<%=request.getContextPath()%>/assets/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
                    filebrowserFlashUploadUrl: '<%=request.getContextPath()%>/assets/ckfinder/core/connector/java/connector.java?command=QuickUpload&amp;type=Flash'
                });
            CKFinder.setupCKEditor(editor, '<%=request.getContextPath()%>/assets/ckfinder/');*/
        };

        //call function post recomment cua recomment
        $scope.viewRecommentOfRecomment = function (commentId, recommentId) {
            var idDivComment = 'div_recommentOfRecomment' + commentId + '_' + recommentId;
            if ($('#' + idDivComment).is(":hidden")) {
                $('#' + idDivComment).show();

                CKEDITOR.replace('editorRecommentOfRecomment'+commentId+'_'+recommentId, {
                    filebrowserBrowseUrl: '<%=request.getContextPath()%>/assets/ckfinder/ckfinder.html',
                    filebrowserImageBrowseUrl: '<%=request.getContextPath()%>/assets/ckfinder/ckfinder.html?type=Images',
                    filebrowserFlashBrowseUrl: '<%=request.getContextPath()%>/assets/ckfinder/ckfinder.html?type=Flash',
                    filebrowserUploadUrl: '<%=request.getContextPath()%>/assets/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files',
                    filebrowserImageUploadUrl: '<%=request.getContextPath()%>/assets/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
                    filebrowserFlashUploadUrl: '<%=request.getContextPath()%>/assets/ckfinder/core/connector/java/connector.java?command=QuickUpload&amp;type=Flash',
                    'height':'120px'
                });
            } else {
                $('#' + idDivComment).hide();
            }
            /*var editorId = 'editorRecommentOfRecomment'+commentId+'_'+recommentId;
            var editor = CKEDITOR.replace(editorId,
                {
                    filebrowserBrowseUrl: '<%=request.getContextPath()%>/assets/ckfinder/ckfinder.html',
                    filebrowserImageBrowseUrl: '<%=request.getContextPath()%>/assets/ckfinder/ckfinder.html?type=Images',
                    filebrowserFlashBrowseUrl: '<%=request.getContextPath()%>/assets/ckfinder/ckfinder.html?type=Flash',
                    filebrowserUploadUrl: '<%=request.getContextPath()%>/assets/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files',
                    filebrowserImageUploadUrl: '<%=request.getContextPath()%>/assets/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
                    filebrowserFlashUploadUrl: '<%=request.getContextPath()%>/assets/ckfinder/core/connector/java/connector.java?command=QuickUpload&amp;type=Flash'
                });
            CKFinder.setupCKEditor(editor, '<%=request.getContextPath()%>/assets/ckfinder/');*/
        };

        //action post recomment
        //param: indexComment: chỉ số comment để duyệt mảng
        $scope.actionPostRecomment = function (commentId, indexComment) {
            var editorId = 'editorRecomment' + commentId;
             var content = CKEDITOR.instances[editorId].getData();
            //var content = $('#' + editorId).val();
            if (content == null || typeof (content) == "undefined" || content == '') {
                toastr.error('Nội dung bình luận không được để trống!');
                return;
            }
            var objReComment = {"commentId": commentId, "content": content};
            $http.post(preUrl + "/comment/recomment/add", objReComment, {headers: {'Content-Type': 'application/json'}})
                .then(function (response) {
                    if (response.data.success === true) {
                        //  getPageComment($scope.pageComment.pageNumber, $scope.postId);
                        $('#div_recomment' + commentId).hide();
                        var objectResult = response.data.obj;
                        //thêm comment vừa post vào array luôn tại vị trí index ở client
                        $scope.pageComment.items[indexComment].recomments.push(objectResult);
                        //xóa nội dung tại editor
                        //$('#' + editorId).val("");
                        CKEDITOR.instances[editorId].setData('');
                    } else {
                        toastr.error(response.data.messageError);
                    }
                });
        };

        //action post recomment of recomment
        //param: indexComment: chỉ số comment để duyệt mảng
        $scope.actionPostRecommentOfRecomment = function (commentId, recommentId, indexComment) {
            var editorId = 'editorRecommentOfRecomment' + commentId + '_' + recommentId;
             var content = CKEDITOR.instances[editorId].getData();
            //var content = $('#' + editorId).val();
            if (content == null || typeof (content) == "undefined" || content == '') {
                toastr.error('Nội dung bình luận không được để trống!');
                return;
            }
            var objReComment = {"commentId": commentId, "content": content};
            $http.post(preUrl + "/comment/recomment/add", objReComment, {headers: {'Content-Type': 'application/json'}})
                .then(function (response) {
                    if (response.data.success === true) {
                        //  getPageComment($scope.pageComment.pageNumber, $scope.postId);
                        $('#div_recommentOfRecomment' + commentId + '_' + recommentId).hide();
                        var objectResult = response.data.obj;
                        //thêm comment vừa post vào array luôn tại vị trí index ở client
                        $scope.pageComment.items[indexComment].recomments.push(objectResult);
                        //xóa nội dung tại editor
                        /*$('#' + editorId).val("");*/
                        CKEDITOR.instances[editorId].setData('');
                    } else {
                        toastr.error(response.data.messageError);
                    }
                });
        };


        /* like and dislike comment*/
        $scope.actionLikeComment = function (objComment, idUser) {
            idUser = idUser.toString();
            var idLikeComment = 'idLikeComment' + objComment.id;
            var idDislikeComment = 'idDislikeComment' + objComment.id;
            //add vào string list id like
            var listIdLikeStr = objComment.idLike;
            if (listIdLikeStr != null && listIdLikeStr != "") {
                var arrIdLike = listIdLikeStr.split(';');
                if (arrIdLike.includes(idUser)) {
                    return;
                } else {
                    listIdLikeStr + ';' + idUser;
                }
            } else listIdLikeStr = idUser;
            objComment.idLike = listIdLikeStr;
            // END add vào string list like

            //remove id trong string list dislike
            var listIdDislikeStr = objComment.idDisLike;
            if (listIdDislikeStr != null && listIdDislikeStr != "") {
                var arrIdDislike = listIdDislikeStr.split(';');
                if (arrIdDislike.includes(idUser)) {
                    removeElementInArray(arrIdDislike, idUser);
                    listIdDislikeStr = splitArrayToString(arrIdDislike);
                    objComment.idDisLike = listIdDislikeStr;
                }
            }
            //END remove id trong string list dislike
            callApiUpdateCommentLike(objComment);
            $('#' + idLikeComment).addClass('likeActive');
            $('#' + idDislikeComment).removeClass('disLikeActive');
        };

        $scope.actionUnlikeComment = function (objComment, idUser) {
            idUser = idUser.toString();
            var idLikeComment = 'idLikeComment' + objComment.id;
            var idDislikeComment = 'idDislikeComment' + objComment.id;
            //add vào string list id like
            var listIdLikeStr = objComment.idLike;
            if (listIdLikeStr != null && listIdLikeStr != "") {
                var arrIdLike = listIdLikeStr.split(';');
                if (arrIdLike.includes(idUser)) {
                    removeElementInArray(arrIdLike, idUser);
                    listIdLikeStr = splitArrayToString(arrIdLike);
                    objComment.idLike = listIdLikeStr;
                    callApiUpdateCommentLike(objComment);
                    $('#' + idLikeComment).removeClass('likeActive');

                }
            }
        };


        $scope.actionDislikeComment = function (objComment, idUser) {
            idUser = idUser.toString();
            var idLikeComment = 'idLikeComment' + objComment.id;
            var idDislikeComment = 'idDislikeComment' + objComment.id;
            //add vào string list id like
            var listIdDislikeStr = objComment.idDisLike;
            if (listIdDislikeStr != null && listIdDislikeStr != "") {
                var arrIdDislike = listIdDislikeStr.split(';');
                if (arrIdDislike.includes(idUser)) {
                    return;
                } else {
                    listIdDislikeStr + ';' + idUser;
                }
            } else listIdDislikeStr = idUser;
            objComment.idDisLike = listIdDislikeStr;
            // END add vào string list like

            //remove id trong string list dislike
            var listIdLikeStr = objComment.idLike;
            if (listIdLikeStr != null && listIdLikeStr != "") {
                var arrIdLike = listIdLikeStr.split(';');
                if (arrIdLike.includes(idUser)) {
                    removeElementInArray(arrIdLike, idUser);
                    listIdLikeStr = splitArrayToString(arrIdLike);
                    objComment.idLike = listIdLikeStr;
                }
            }
            //END remove id trong string list dislike
            callApiUpdateCommentLike(objComment);
            $('#' + idLikeComment).removeClass('likeActive');
            $('#' + idDislikeComment).addClass('disLikeActive');

        };

        $scope.actionUndislikeComment = function (objComment, idUser) {
            idUser = idUser.toString();
            var idLikeComment = 'idLikeComment' + objComment.id;
            var idDislikeComment = 'idDislikeComment' + objComment.id;
            //add vào string list id like
            var listIdDislikeStr = objComment.idDisLike;
            if (listIdDislikeStr != null && listIdDislikeStr != "") {
                var arrIdLike = listIdDislikeStr.split(';');
                if (arrIdLike.includes(idUser)) {
                    removeElementInArray(arrIdLike, idUser);
                    listIdDislikeStr = splitArrayToString(arrIdLike);
                    objComment.idDisLike = listIdDislikeStr;
                    callApiUpdateCommentLike(objComment);
                    $('#' + idDislikeComment).removeClass('idDislikeComment');

                }
            }
        };

        function callApiUpdateCommentLike(comment) {
            $http.post(preUrl + "/comment/updateLike", comment, {headers: {'Content-Type': 'application/json'}})
                .then(function (response) {
                    if (response.data.success === true) {
                        //  getPageComment($scope.pageComment.pageNumber, $scope.postId);
                    } else {
                        toastr.error(response.data.messageError);
                    }
                });
        }

        /* END like and dislike comment*/


        /* like and dislike recomment*/
        $scope.actionLikeRecomment = function (commentId, objRecomment, idUser) {
            idUser = idUser.toString();
            var idLikeRecomment = 'idLikeRecomment' + commentId + '_' + objRecomment.id;
            var idDislikeRecomment = 'idDislikeRecomment' + commentId + '_' + objRecomment.id;
            //add vào string list id like
            var listIdLikeStr = objRecomment.idLike;
            if (listIdLikeStr != null && listIdLikeStr != "") {
                var arrIdLike = listIdLikeStr.split(';');
                if (arrIdLike.includes(idUser)) {
                    return;
                } else {
                    listIdLikeStr + ';' + idUser;
                }
            } else listIdLikeStr = idUser;
            objRecomment.idLike = listIdLikeStr;
            // END add vào string list like

            //remove id trong string list dislike
            var listIdDislikeStr = objRecomment.idDisLike;
            if (listIdDislikeStr != null && listIdDislikeStr != "") {
                var arrIdDislike = listIdDislikeStr.split(';');
                if (arrIdDislike.includes(idUser)) {
                    removeElementInArray(arrIdDislike, idUser);
                    listIdDislikeStr = splitArrayToString(arrIdDislike);
                    objRecomment.idDisLike = listIdDislikeStr;
                }
            }
            //END remove id trong string list dislike
            callApiUpdateRecommentLike(objRecomment);
            $('#' + idLikeRecomment).addClass('likeActive');
            $('#' + idDislikeRecomment).removeClass('disLikeActive');
        };

        $scope.actionUnlikeRecomment = function (commentId, objRecomment, idUser) {
            idUser = idUser.toString();
            var idLikeRecomment = 'idLikeComment' + objRecomment.id;
            var idDislikeRecomment = 'idDislikeRecomment' + commentId + '_' + objRecomment.id;
            //add vào string list id like
            var listIdLikeStr = objRecomment.idLike;
            if (listIdLikeStr != null && listIdLikeStr != "") {
                var arrIdLike = listIdLikeStr.split(';');
                if (arrIdLike.includes(idUser)) {
                    removeElementInArray(arrIdLike, idUser);
                    listIdLikeStr = splitArrayToString(arrIdLike);
                    objRecomment.idLike = listIdLikeStr;
                    callApiUpdateRecommentLike(objRecomment);
                    $('#' + idLikeRecomment).removeClass('likeActive');

                }
            }
        };

        $scope.actionDislikeRecomment = function (commentId, objRecomment, idUser) {
            idUser = idUser.toString();
            var idLikeRecomment = 'idLikeRecomment' + commentId + '_' + objRecomment.id;
            var idDislikeRecomment = 'idDislikeRecomment' + commentId + '_' + objRecomment.id;
            //add vào string list id like
            var listIdDislikeStr = objRecomment.idDisLike;
            if (listIdDislikeStr != null && listIdDislikeStr != "") {
                var arrIdDislike = listIdDislikeStr.split(';');
                if (arrIdDislike.includes(idUser)) {
                    return;
                } else {
                    listIdDislikeStr + ';' + idUser;
                }
            } else listIdDislikeStr = idUser;
            objRecomment.idDisLike = listIdDislikeStr;
            // END add vào string list like

            //remove id trong string list dislike
            var listIdLikeStr = objRecomment.idLike;
            if (listIdLikeStr != null && listIdLikeStr != "") {
                var arrIdLike = listIdLikeStr.split(';');
                if (arrIdLike.includes(idUser)) {
                    removeElementInArray(arrIdLike, idUser);
                    listIdLikeStr = splitArrayToString(arrIdLike);
                    objRecomment.idLike = listIdLikeStr;
                }
            }
            //END remove id trong string list dislike
            callApiUpdateRecommentLike(objRecomment);
            $('#' + idLikeRecomment).removeClass('likeActive');
            $('#' + idDislikeRecomment).addClass('disLikeActive');
        };

        $scope.actionUndislikeRecomment = function (commentId, objRecomment, idUser) {
            var idDislikeRecomment = 'idDislikeRecomment' + commentId + '_' + objRecomment.id;
            idUser = idUser.toString();
            //add vào string list id like
            var listIdDislikeStr = objRecomment.idDisLike;
            if (listIdDislikeStr != null && listIdDislikeStr != "") {
                var arrIdLike = listIdDislikeStr.split(';');
                if (arrIdLike.includes(idUser)) {
                    removeElementInArray(arrIdLike, idUser);
                    listIdDislikeStr = splitArrayToString(arrIdLike);
                    objRecomment.idDisLike = listIdDislikeStr;
                    callApiUpdateRecommentLike(objRecomment);
                    $('#' + idDislikeRecomment).removeClass('disLikeActive');

                }
            }
        };

        function callApiUpdateRecommentLike(recomment) {
            $http.post(preUrl + "/comment/recomment/updateLike", recomment, {headers: {'Content-Type': 'application/json'}})
                .then(function (response) {
                    if (response.data.success === true) {
                        //  getPageComment($scope.pageComment.pageNumber, $scope.postId);
                    } else {
                        toastr.error(response.data.messageError);
                    }
                });
        }

        /* like and dislike recomment*/

        function splitArrayToString(arr) {
            var result = "";
            for (var i = 0; i < arr.length; i++) {
                if (i === (arr.length - 1)) result += arr[i];
                else result += arr[i] + ";";
            }
            return result;
        }

        //format param: str = "1,2,3,4" -> result = [1,2,3,4]
        $scope.splitStringToArray = function (str) {
            var arrResult = [];
            if (str != null && typeof (str) != "undefined" && str != "") arrResult = str.split(',');
            return arrResult;
        };

        $scope.checkExistElementInArray = function (arrStr, el) {
            el = el.toString();
            if (arrStr != null && typeof (arrStr) != "undefined" && arrStr != "") {
                var arr = arrStr.split(';');
                console.log('arr splited = ' + arr);
                return arr.includes(el);
            } else return false;
        };
        /*end like and dislike*/

        $scope.countNumberDayBetweenFromDateToCurrent = function (dateFromStr) {
            var dateFrom = new Date(dateFromStr);
            var now = new Date();
            var numberDay = countNumberDayBetween2Date(dateFrom, now);
            if (numberDay == 0) return "Hôm nay";
            else if (numberDay > 10) return timeNumberToDateDDMMYYYY(dateFromStr);
            else return numberDay + ' ngày trước';

        };

        /*
        //call api lấy thông tin chủ bài viết
        $http.get(preUrl+"/admin/content/article/delete", {params: {id:$scope.post.user_created}})
            .then(function (response) {
                $scope.loadPage(1);
                $scope.page.pageCount=getPageCount($scope.page);
                $("#modalxoa").modal("hide");
                toastr.success("Xóa thành công!");
            });*/

        $scope.showStringCommentAsDOM = function (elementId,html) {
            //var idShowComment = 'show_comment_'+commentId;
            $('#'+elementId).html(html);
           // return d.innerHTML;
        };

        $scope.back = function () {
            window.location.href = preUrl;
        };


    }]);