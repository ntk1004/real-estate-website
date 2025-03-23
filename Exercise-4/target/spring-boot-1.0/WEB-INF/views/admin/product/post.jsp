<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>

<html>
<head>

    <title>Đăng tải</title>


</head>

<body>

<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {
                }
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Home</a>
                </li>
                <li class="active">Sản phẩm</li>
            </ul><!-- /.breadcrumb -->


        </div>

        <div class="page-content">


            <div class="page-header">
                <h1 style="font-family: 'Times New Roman', Times, serif;">


                </h1>
            </div><!-- /.page-header -->
            <div class="row">
                <div class="col-xs-12">

                </div>
            </div>
            <!--Bảng Danh Sách-->

            <div class="row" style="font-family: 'Times New Roman', Times, serif;">

                <form:form method="GET" modelAttribute="realestateunit" id="listForm">
                    <div class="col-xs-12">
                        <form class="form-horizontal" role="form" id="form-edit">
                            <c:if test="${empty realestateunit.idRealEstate}">
                                <div class="form-group">
                                    <label class="col-xs-3">Toà nhà</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="name"/>
                                    </div>
                                </div>
                            </c:if>
                            <div class="form-group">
                                <label class="col-xs-3">Tên căn hộ</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="nameUnit"/>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-xs-3">Loại</label>
                                <div class="col-xs-9"><form:input class="form-control" path="type"/></div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Diện tích</label>
                                <div class="col-xs-9"><form:input class="form-control" path="value"/></div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Giá</label>
                                <div class="col-xs-9"><form:input class="form-control" path="price"/></div>
                            </div>


                                <%--            <div class="form-group">--%>
                                <%--              <label class="col-xs-3">Tình trạng</label>--%>
                                <%--              <div class="col-xs-9"><input class="form-control"  name="" ></div>--%>
                                <%--            </div>--%>
                            <div class="form-group">
                                <label class="col-xs-3">File ảnh</label>
                                <div class="col-xs-3">
                                    <form:input type="file" class="form-control" id="uploadImage" path="avatar"/>
                                </div>
                                <div class="col-xs-6">
                                    <c:if test="${not empty realestateunit.avatar}">
                                        <c:set var="imagePath" value="/uploads/${realestateunit.avatar}"/>
                                        <img src="${imagePath}" id="viewImage" width="300px" height="300px" style="">
                                    </c:if>
                                    <c:if test="${ empty realestateunit.avatar}">
                                        <img src="/admin/image/default.png" id="viewImage" width="300px" height="300px">
                                    </c:if>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-xs-3"></label>
                                <div class="col-xs-9">
                                    <c:if test="${not empty realestateunit.idRealEstate}">
                                        <button style="border-radius: 50px" type="button" class="btn btn-success"
                                                id="btnAddOrUpdateRealEstateUnit">Sửa Thông Tin
                                        </button>
                                        <button style="border-radius: 50px" type="button" class="btn btn-success"
                                                id="btnCancel">Huỷ
                                        </button>
                                    </c:if>
                                    <c:if test="${empty realestateunit.idRealEstate}">
                                        <button style="border-radius: 50px" type="button" class="btn btn-success"
                                                id="btnAddOrUpdateRealEstateUnit">Thêm
                                        </button>
                                        <button style="border-radius: 50px" type="button" class="btn btn-success"
                                                id="btnCancel">Huỷ
                                        </button>
                                    </c:if>
                                </div>
                            </div>
                            <form:hidden path="id" id="id"></form:hidden>
                               <form:hidden path="idRealEstate" id="realid"></form:hidden>
                        </form>
                    </div>

                </form:form>
            </div>


        </div><!-- /.page-content -->
    </div>


</div><!-- /.main-content -->


<script>
  var imageBase64='';
  var imageName='';
    $('#btnAddOrUpdateRealEstateUnit').click(function () {
        var data = {};

        var formData = $('#listForm').serializeArray();
        $.each(formData, function (i, v) {
            data["" + v.name + ""] = v.value;
        });

        var fileInput = document.getElementById("uploadImage");
        if (fileInput.files.length > 0) {
          var file = fileInput.files[0];
          var reader = new FileReader();
          reader.onloadend = function() {
             data["imageBase64"] = reader.result.split(',')[1]; // Lấy phần Base64
            data["avatar"] = file.name;

            // Gửi dữ liệu sau khi ảnh đã được chuyển thành Base64
            addOrUpdateRealEstateUnit(data);
          };
          reader.readAsDataURL(file); // Chuyển file thành Base64
        } else {
        addOrUpdateRealEstateUnit(data); // Nếu không có ảnh, gửi dữ liệu ngay
        }
    });

    function addOrUpdateRealEstateUnit(data) {
        $.ajax({
            type: "POST",
            url: "/api/product/",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function (respond) {
                console.log("Success");
            },
            error: function (respond) {
                console.log("failed"),
                    console.log(respond);
            }
        });
    }

    $('#btnCancel').click(function () {
        window.location.href = "/admin/product-list";
    });
    $('#uploadImage').change(function (event){
      openImage(this,'viewImage');
    });
    function openImage(input,imageView){
      if (input.files && input.files[0]){
        var reader = new FileReader();
        reader.onload=function (e){
          $('#'+imageView).attr('src',reader.result);
        }
        reader.readAsDataURL(input.files[0])
      }
    }
</script>
<!-- <![endif]-->

<!--[if IE]>
<script src="assets/js/jquery.1.11.1.min.js"></script>
<![endif]-->

<!--[if !IE]> -->
<script type="text/javascript">
    window.jQuery || document.write("<script src='assets/js/jquery.min.js'>" + "<" + "/script>");
</script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
    window.jQuery || document.write("<script src='assets/js/jquery1x.min.js'>" + "<" + "/script>");
</script>
<![endif]-->
<script>
</script>
</body>
</html>
