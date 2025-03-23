<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>

<html>
<head>

  <title>Sửa Hoặc Thêm Toà Nhà</title>


</head>

<body >

<div class="main-content">
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
          Thông tin khách hàng
          <small>
            <i class="ace-icon fa fa-angle-double-right"></i>
        Tìm Kiếm
          </small>
        </h1>
      </div><!-- /.page-header -->
      <div class="row">
        <div class="col-xs-12">

        </div>
      </div>
      <!--Bảng Danh Sách-->

      <div class="row" style="font-family: 'Times New Roman', Times, serif;">
      <form:form  method="GET" modelAttribute="customerEdit" id="listForm" >
        <div class="col-xs-12">
          <form class="form-horizontal" role="form" id="form-edit">
            <div class="form-group">
              <label class="col-xs-3">Tên khách hàng</label>
              <div class="col-xs-9">
                <form:input class="form-control"  path="name" />
              </div>
            </div>



            <div class="form-group">
              <label class="col-xs-3">Số điện thoại</label>
              <div class="col-xs-9"><form:input class="form-control" path="customerPhone"  /></div>
            </div>

            <div class="form-group">
              <label class="col-xs-3">Email</label>
              <div class="col-xs-9"><form:input class="form-control" path="email"  /></div>
            </div>

            <div class="form-group">
              <label class="col-xs-3">Tên công ty</label>
              <div class="col-xs-9"><form:input class="form-control" path="companyName" /></div>
            </div>

            <div class="form-group">
              <label class="col-xs-3">Nhu cầu</label>
              <div class="col-xs-9"><input class="form-control" type="text"  ></div>
            </div>


            <div class="form-group">
              <label class="col-xs-3">Tình trạng</label>
              <div class="col-xs-9"><input class="form-control"  name="" ></div>
            </div>

            <div class="form-group">
              <label class="col-xs-3"></label>
              <div class="col-xs-9">
                 <c:if test="${not empty customerEdit.id}" >
                <button style="border-radius: 50px" type="button" class="btn btn-success" id="btnAddOrUpdateCustomer">Sửa Thông Tin</button>
                <button style="border-radius: 50px" type="button" class="btn btn-success" id="btnCancel">Huỷ</button>
                </c:if>
                   <c:if test="${empty customerEdit.id}" >
                <button style="border-radius: 50px" type="button" class="btn btn-success" id="btnAddOrUpdateCustomer">Thêm Khách Hàng</button>
                <button style="border-radius: 50px" type="button" class="btn btn-success" id="btnCancel" >Huỷ</button>
                </c:if>
              </div>
            </div>
             <form:hidden path="id" id="customerid"></form:hidden>
          </form>
        </div>

         </form:form>
      </div>


    </div><!-- /.page-content -->
  </div>

<c:forEach var="item" items="${transactionType}">
<div class="col-xs-12">
<div class="col-sm-12">

<h3 class="header smaller lighter blue">${item.value}
</h3>
<buttom  class="btn btn-lg btn-primary" onclick="transactionType('${item.key}',${customerEdit.id},'${NameUser}')" >
<i class="orange ace-icon fa fa-location-arrow"></i>Add
</buttom>
  </div>

  <c:if test="${item.key=='CSKH'}">
<div class="col-xs-12">
<table id="simple-table" class="table table-striped table-bordered table-hover">
<thead>
<tr>
<th>Ngày tạo</th>
<th>Người tạo</th>
<th>Chi tiết giao dịch</th>
<th>Thao tác</th>
</tr>
</thead>
<tbody>
<c:forEach var="item" items="${Transaction}">
 <c:if test="${item.code=='CSKH'}">
 <tr>
<td>${item.createddate}</td>
<td>${item.createdby}</td>
<td>${item.note}</td>
<td>
<div class="hidden-sm hidden-xs btn-group">
<a  class="btn btn-xs btn-success" data-toggle="tooltip" title="sửa thông tin" onclick="UpdateTransaction(${item.id})">  <i class="ace-icon fa fa-pencil bigger-120"></i>
</a>
</div>
</td>
</tr>
</c:if>
<tr>
</c:forEach>
</tbody>
</table>
  </div>

</c:if>
<c:if test="${item.key=='DDX'}">
<div class="col-xs-12">
<table id="simple-table" class="table table-striped table-bordered table-hover">
<thead>
<tr>
<th>Ngày tạo</th>
<th>Người tạo</th>
<th>Chi tiết giao dịch</th>
<th>Thao tác</th>
</tr>
</thead>
<tbody>
<c:forEach var="item" items="${Transaction}">
 <c:if test="${item.code=='DDX'}">
 <tr>
<td>${item.createddate}</td>
<td>${item.createdby}</td>
<td>${item.note}</td>
<td>
<div class="hidden-sm hidden-xs btn-group">
<a  class="btn btn-xs btn-success" data-toggle="tooltip" title="sửa thông tin" onclick="UpdateTransaction(${item.id})">  <i class="ace-icon fa fa-pencil bigger-120"></i>
</a>
</div>
</td>
</tr>
</c:if>
<tr>
</c:forEach>
</tbody>
</table>
  </div>

</c:if>
</div>
</c:forEach>

</div><!-- /.main-content -->

<div class="modal fade" id="TranModal" role="dialog" style="font-family: 'Times New Roman', Times, serif;">
<div class="modal-dialog">

  <!-- Modal content-->
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal"></button>
      <h4 class="modal-title">Nhập giao dịch</h4>
    </div>
    <div class="modal-body">
     <div class="form-group has-success">
       <label class="col-xs-12 col-sm-3 control-label no-padding-right">Chi tiết giao dịch</label>
       <div class="col-xs-12 col-sm-9">
         <span class="block input-icon input-icon-right">
           <input type="text" id="TransactionD" class="w-100" name="TransactionD" value="">
         </span>
       </div>
     </div>
      <input type="hidden" id ="customerId" name="customerId" value="">
      <input type="hidden" id ="code" name="code" value="">
      <input type="hidden" id ="Id" name="Id" value="">
      <input type="hidden" id ="user" name="user" value="">
    </div>
    <div class="modal-footer">
      <button type="button" class="btn btn-default" id="AddorUpdateTranstaction">Thêm giao dịch</button>
      <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
    </div>
  </div>

</div>
</div>
<script>

 function transactionType (key,id,user){
   $('#TranModal').modal()
   $('#customerId').val(id);
   $('#code').val(key);
   $('#user').val(user);
 }
function UpdateTransaction(id){
  $('#TranModal').modal()
  $('#id').val(id);

}
 $('#AddorUpdateTranstaction').click(function(){
   var data ={};
  data['customerId']=$('#customerId').val();
   data['id']=$('#Id').val();
   data['transactionD']=$('#TransactionD').val();
   data['code']=$('#code').val();
   data['user']=$('#user').val();
     addOrUpdateTransaction(data);
 });

 function addOrUpdateTransaction(data){
   $.ajax({
     type : "POST",
     url: "/api/customer/transaction",
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
   window.location.href="/admin/customer-list";
 });


 $('#btnAddOrUpdateCustomer').click(function(){
   var data ={};

   var formData=$('#listForm').serializeArray();
   $.each(formData,function(i,v){
     data[""+ v.name+""] = v.value;
   });
   AddOrUpdateCustomer(data);

 });

 function AddOrUpdateCustomer(data){
   $.ajax({
     type : "POST",
     url: "/api/customer/",
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
</script>
<!-- <![endif]-->

<!--[if IE]>
<script src="assets/js/jquery.1.11.1.min.js"></script>
<![endif]-->

<!--[if !IE]> -->
<script type="text/javascript">
  window.jQuery || document.write("<script src='assets/js/jquery.min.js'>"+"<"+"/script>");
</script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
  window.jQuery || document.write("<script src='assets/js/jquery1x.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
<script>
</script>
</body>
</html>
