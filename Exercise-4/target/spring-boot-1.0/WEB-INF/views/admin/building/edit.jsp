<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<%--
  Created by IntelliJ IDEA.
  User: ditch
  Date: 26/08/2024
  Time: 21:38
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>Thêm Toà Nhà</title>
</head>
<body>
<div class="main-content" >
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Home</a>
                </li>
                <li class="active">Sửa Hoặc Thêm Toà Nhà</li>
            </ul><!-- /.breadcrumb -->


        </div>

        <div class="page-content">


            <div class="page-header">
                <h1 style="font-family: 'Times New Roman', Times, serif;">
                    Sửa Hoặc Thêm Toà Nhà
                    <small>
                        <i class="ace-icon fa fa-angle-double-right"></i>

                    </small>
                </h1>
            </div><!-- /.page-header -->
            <div class="row">
                <div class="col-xs-12">

                </div>
            </div>
            <!--Bảng Danh Sách-->
            <div class="row" style="font-family: 'Times New Roman', Times, serif;">

           <form:form  method="GET" modelAttribute="buildingEdit" id="listForm" >
               <div class="col-xs-12">
                   <form class="form-horizontal" role="form">
                       <div class="form-group">
                           <label class="col-xs-3">Tên Toà Nhà</label>
                           <div class="col-xs-9">
                                 <form:input class="form-control"  path="name" />
                           </div>
                       </div>

                       <div class="form-group">

                            <label class="col-xs-3">Quận</label>
                            <div class="col-xs-2">
                               <form:select  class="form-control"  path="district">
                                   <form:option value="">---Chọn Quận----</form:option>
                                   <form:options items="${districts}"></form:options>

                               </form:select>


                           </div>
                        </div>
                       <div class="form-group">
                           <label class="col-xs-3">Phường</label>
                           <div class="col-xs-9">
                               <form:input class="form-control"  id="ward" path="ward" />
                           </div>
                       </div>

                       <div class="form-group">
                           <label class="col-xs-3">Đường</label>
                           <div class="col-xs-9"><form:input class="form-control" id="street" path="street" /></div>
                       </div>

<%--                       <div class="form-group">--%>
<%--                           <label class="col-xs-3">Kết Cấu</label>--%>
<%--                           <div class="col-xs-9">--%>
<%--                               <input class="form-control" type="text" >--%>
<%--                           </div>--%>
<%--                       </div>--%>

                       <div class="form-group">
                           <label class="col-xs-3">Số Tầng Hầm</label>
                           <div class="col-xs-9"><form:input class="form-control" path="numberOfBasement" /></div>
                       </div>


                       <div class="form-group">
                           <label class="col-xs-3">Diện Tích Sàn</label>
                           <div class="col-xs-9">
                               <form:input class="form-control" id="floorArea" path="floorArea" />
                           </div>
                       </div>


                       <div class="form-group">
                           <label class="col-xs-3">Hướng</label>
                           <div class="col-xs-9"><form:input class="form-control" path="direction" /></div>
                       </div>


                       <div class="form-group">
                           <label class="col-xs-3">Hạng</label>
                           <div class="col-xs-9"><form:input class="form-control" path="level" /></div>
                       </div>


                       <div class="form-group">
                           <label class="col-xs-3">Diện Tích Thuê</label>
                           <div class="col-xs-9"><form:input class="form-control" path="rentArea" /></div>
                       </div>


                       <div class="form-group">
                           <label class="col-xs-3">Giá Thuê</label>
                           <div class="col-xs-9"><form:input class="form-control" path="rentPrice" /></div>
                       </div>

<%--                       <div class="form-group">--%>
<%--                           <label class="col-xs-3">Mô Tả Giá</label>--%>
<%--                           <div class="col-xs-9"><input class="form-control" type="text" id="rentpricedescription" name="rentpricedescription" ></div>--%>
<%--                       </div>--%>

<%--                       <div class="form-group">--%>
<%--                           <label class="col-xs-3">Phí Dịch Vụ</label>--%>
<%--                           <div class="col-xs-9"><input class="form-control" type="number"  ></div>--%>
<%--                       </div>--%>

<%--                       <div class="form-group">--%>
<%--                           <label class="col-xs-3">Phí Ô Tô</label>--%>
<%--                           <div class="col-xs-9"><input class="form-control" type="number"  ></div>--%>
<%--                       </div>--%>

<%--                       <div class="form-group">--%>
<%--                           <label class="col-xs-3">Phí Mô Tô</label>--%>
<%--                           <div class="col-xs-9"><input class="form-control" type="number"></div>--%>
<%--                       </div>--%>

<%--                       <div class="form-group">--%>
<%--                           <label class="col-xs-3">Phí Ngoài Giờ</label>--%>
<%--                           <div class="col-xs-9"><input class="form-control" type="number" ></div>--%>
<%--                       </div>--%>
<%--                       <div class="form-group">--%>
<%--                           <label class="col-xs-3">Tiền Điện</label>--%>
<%--                           <div class="col-xs-9"><input class="form-control" type="number" ></div>--%>
<%--                       </div>--%>
<%--                       <div class="form-group">--%>
<%--                           <label class="col-xs-3">Đặt Cọc</label>--%>
<%--                           <div class="col-xs-9"><input class="form-control" type="number"  ></div>--%>
<%--                       </div>--%>

<%--                       <div class="form-group">--%>
<%--                           <label class="col-xs-3">Thanh Toán</label>--%>
<%--                           <div class="col-xs-9"><input class="form-control" type="number"  ></div>--%>
<%--                       </div>--%>

<%--                       <div class="form-group">--%>
<%--                           <label class="col-xs-3">Thời Gian Thuê</label>--%>
<%--                           <div class="col-xs-9"><input class="form-control" type="text"  ></div>--%>
<%--                       </div>--%>

<%--                       <div class="form-group">--%>
<%--                           <label class="col-xs-3">Thời Gian Trang Trí</label>--%>
<%--                           <div class="col-xs-9"><input class="form-control" type="text"  ></div>--%>
<%--                       </div>--%>

                       <div class="form-group">
                           <label class="col-xs-3">Tên Quản Lý</label>
                           <div class="col-xs-9"><form:input class="form-control" path="managerName" /></div>
                       </div>

                       <div class="form-group">
                           <label class="col-xs-3">SĐT Quản Lý</label>
                           <div class="col-xs-9"><form:input class="form-control"  path="managerPhone"/></div>
                       </div>

<%--                       <div class="form-group">--%>
<%--                           <label class="col-xs-3">Phí Môi Giới</label>--%>
<%--                           <div class="col-xs-9"><input class="form-control" type="number"  ></div>--%>
<%--                       </div>--%>

                       <div class="form-group">
                           <label class="col-xs-3">Loại Toàn Nhà</label>
                           <div class="col-xs-9">
                               <form:checkboxes items="${typeCodes}" path="typeCode" ></form:checkboxes>
                           </div>
                       </div>

                       <div class="form-group">
                           <label class="col-xs-3">Ghí Chú</label>
                           <div class="col-xs-9"><input class="form-control" type="text"  ></div>
                       </div>
                       <div class="form-group">
                           <label class="col-xs-3">File ảnh</label>
                            <div class="col-xs-3">
                        <form:input  type="file" class="form-control" id="uploadImage"  path="avatar"/>
                        </div>
                           <div class="col-xs-6">
                           <c:if test="${not empty buildingEdit.avatar}">
                           <c:set var="imagePath" value="/uploads/${buildingEdit.avatar}"/>
                           <img src="${imagePath}" id="viewImage" width="300px" height="300px" style="">
</c:if>
                       <c:if test="${ empty buildingEdit.avatar}">
                       <img src="/admin/image/default.png" id="viewImage"  width="300px" height="300px">
</c:if>
</div>

                       </div>
                           <div class="form-group">
                               <label class="col-xs-3"></label>
                                <div class="col-xs-9">
                                    <c:if test="${not empty buildingEdit.id}" >
                                    <security:authorize access="hasRole('MANAGER')">
                                       <button type="button" class="btn btn-success" id="btnAddOrUpdateBuilding">Cập Nhật Toà Nhà</button>
                                       <button type="button" class="btn btn-success" id="btnCancel">Huỷ Thao Tác</button>
                                       </security:authorize>
                                     </c:if>
                                   <c:if test="${empty buildingEdit.id}" >
                                       <button style="border-radius: 50px" type="button" class="btn btn-success" id="btnAddOrUpdateBuilding">Thêm Toà Nhà</button>
                                       <button style="border-radius: 50px" type="button" class="btn btn-success" id="btnCancel">Huỷ Thao Tác</button>
                                   </c:if>
                               </div>
                           </div>
                       <form:hidden path="id" id="buildingId"></form:hidden>
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


    $('#btnAddOrUpdateBuilding').click(function(){
        var data ={};
        var typeCode=[];
        var formData=$('#listForm').serializeArray();
        $.each(formData,function(i,v){
            if(v.name != 'typeCode'){
                data[""+ v.name+""] = v.value;
            }
            else {
                typeCode.push(v.value);
            }
        });
        data["typeCode"] = typeCode;
        var fileInput = document.getElementById("uploadImage");
        if (fileInput.files.length > 0) {
            var file = fileInput.files[0];
            var reader = new FileReader();
            reader.onloadend = function() {
                data["imageBase64"] = reader.result.split(',')[1]; // Lấy phần Base64
                data["avatar"] = file.name;

                // Gửi dữ liệu sau khi ảnh đã được chuyển thành Base64
                addOrUpdateBuilding(data);
            };
            reader.readAsDataURL(file); // Chuyển file thành Base64
        } else {
            addOrUpdateBuilding(data); // Nếu không có ảnh, gửi dữ liệu ngay
        }
    });

    function addOrUpdateBuilding(data){
        $.ajax({
            type : "POST",
            url: "/api/building/",
            data:JSON.stringify(data),
            contentType:"application/json",
            dataType :"JSON",
            success: function(respond){
                console.log("Success");
            },
            error :function(respond){
                console.log("failed"),
                    console.log(respond);
            }
        });
    }
$('#btnCancel').click(function (){
    window.location.href="/admin/building-list";
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
</body>
</html>
