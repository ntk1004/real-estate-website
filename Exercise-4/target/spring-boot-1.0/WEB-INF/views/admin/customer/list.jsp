<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="CustomerListURL" value="/admin/customer-list"/>
<html>
<head>

    <title>Danh Sách Khách Hàng</title>

</head>

<body class="no-skin">


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
                <li class="active">Quản Lý Khách Hàng</li>
            </ul><!-- /.breadcrumb -->


        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>
                    Danh Sách Khách Hàng
                    <small>
                        <i class="ace-icon fa fa-angle-double-right"></i>
                        Tìm Kiếm
                    </small>
                </h1>
            </div><!-- /.page-header -->


            <div class="row">
                <div class="col-xs-12">
                    <div class="widget-box ui-sortable-handle" style="border: none !important;">
                        <div class="widget-header" style="border:none !important;">
                            <div class="widget-toolbar">
                                <a data-action="collapse"><i class="ace-icon fa fa-chevron-up">
                                </i>
                                </a>
                            </div>
                        </div>
                        <div class="widget-body" style="font-family: 'Times New Roman', Times, serif;">
                            <form:form id="listCustomer" action="${CustomerListURL}" method="GET"
                                       modelAttribute="customerDTO">
                                <div class="widget-main">
                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-4">
                                                    <label class="name">Tên Khách Hàng</label>
                                                    <form:input type="text" class="form-control" path="fullname"/>
                                                </div>
                                                <div class="col-xs-4">
                                                    <label class="name">Di Động</label>
                                                    <form:input type="number" class="form-control" path="phone"/>
                                                </div>
                                                <div class="col-xs-4">
                                                    <label class="name">Email</label>
                                                    <form:input type="number" class="form-control" path="email"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-4">
                                                    <label class="name">Chọn Nhân Viên</label>
                                                    <form:select type="text" class="form-control" path="staffid">
                                                        <form:option value="">---Chọn Nhân Viên---</form:option>
                                                        <form:options items="${listStaff}"></form:options>

                                                    </form:select>
                                                </div>
                                            </div>
                                        </div>


                                    </div>


                                </div>
                            </form:form>
                        </div>
                        <div class="pull-left">
                            <button type="button" class="" id="btnSearchCustomer"
                                    style=" border-radius: 20px;  background-color: rgba(255,48,21,0.83) !important; width: 40px ;font-size: 10px;margin: 5px 0 0 10px" >
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-search" viewBox="0 0 16 16" style="padding-top:5px">
                                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"></path>
                                </svg>

                            </button>
                        </div>
                        <div class="pull-right" style="margin-top: 5px">
                            <a href="/admin/customer-edit">
                                <button class="btn btn-info" title="Thêm Khách Hàng" style=" border-radius: 7px">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-person-add" viewBox="0 0 16 16">
                                        <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0m-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0M8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4"/>
                                        <path d="M8.256 14a4.5 4.5 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10q.39 0 .74.025c.226-.341.496-.65.804-.918Q8.844 9.002 8 9c-5 0-6 3-6 4s1 1 1 1z"/>
                                    </svg>


                                </button>
                            </a>
                            <button id="btnDeleteCustomer" class="btn btn-danger" title="Xoá Khách Hàng"
                                    style=" border-radius: 7px">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-person-dash" viewBox="0 0 16 16">
                                    <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1m0-7a3 3 0 1 1-6 0 3 3 0 0 1 6 0M8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4"/>
                                    <path d="M8.256 14a4.5 4.5 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10q.39 0 .74.025c.226-.341.496-.65.804-.918Q8.844 9.002 8 9c-5 0-6 3-6 4s1 1 1 1z"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!--Bảng Danh Sách-->
            <div class="row">
                <div class="col-xs-12">
                    <table id="simple-table" class="table table-striped table-bordered table-hover"
                           style="margin: 3em 0 1.5em;">

                        <tbody>
                        <form:form modelAttribute="CustomerList">
                            <display:table name="CustomerList.listResult" cellpadding="0" cellspacing="0"
                                           requestURI="${CustomerListURL}" partialList="true" sort="external"
                                           size="${CustomerList.totalItems}"
                                           defaultorder="ascending"
                                           id="tableList" pagesize="${CustomerList.maxPageItems}"
                                           export="false"
                                           class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                           style="margin: 3em 0 1.5em;">
                                <display:column title="<fieldset class='form-group'>
                                      <input type='checkbox' id = 'checkAll' class ='check-box-element'>
                                      </fieldset>" class="center select-cell"
                                                headerClass="center select-cell">
                                    <fieldset>
                                        <input type="checkbox" name="checkList" value="${tableList.id}"
                                               id="checkbox_${tableList.id}" class="check-box-element"/>
                                    </fieldset>
                                </display:column>
                                <display:column headerClass="text-left" property="fullName" title="Tên khách hàng"/>
                                <display:column headerClass="text-left" property="email" title="Email"/>
                                <display:column headerClass="text-left" property="phone" title="Số điện thoại"/>
                                <display:column headerClass="text-left" property="demand" title="Nhu cầu"/>
                                <display:column headerClass="text-left" property="createdBy" title="Người thêm"/>
                                <display:column headerClass="text-left" property="createdDate" title="Ngày thêm"/>
                                <display:column headerClass="col-actions" title="Thao tác">
                                    <div class="hidden-sm hidden-xs btn-group">

                                        <a class="btn btn-xs btn-success" title="Giao Toàn Nhà"
                                           onclick="assimentCustomer(${tableList.id})">
                                            <i class="ace-icon glyphicon glyphicon-list"></i>
                                        </a>

                                        <a class="btn btn-xs btn-info" title="sua toa nha"
                                           href="/admin/customer-edit-${tableList.id}">
                                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                                        </a>

                                        <a class="btn btn-xs btn-danger">
                                            <i class="ace-icon fa fa-trash-o bigger-120" title="Xoá Toà Nhà"
                                               onclick="deleteCustomer(${tableList.id})"></i>
                                        </a>
                                    </div>

                                </display:column>
                            </display:table>
                        </form:form>
                        </tbody>
                    </table>
                </div><!-- /.span -->
            </div>
        </div>
    </div>
</div><!-- /.page-content -->
<!-- /.main-content -->


<!-- basic scripts -->

<!--[if !IE]> -->
<!-- Modal -->
<div class="modal fade" id="assimentCustomerModal" role="dialog"
     style="font-family: 'Times New Roman', Times, serif;">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Danh Sách Nhân Viên</h4>
            </div>
            <div class="modal-body">
                <table class="table table-striped table-bordered table-hover" id="staffList">
                    <thead>
                    <tr>
                        <th>Chọn</th>
                        <th>Tên Nhân Viên</th>
                    </tr>
                    </thead>

                    <tbody>


                    </tbody>
                </table>
                <input type="hidden" id="customerid" name="customerId" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnassigmentCustomer">Giao Toà Nhà</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>

    </div>
</div>

<script src="assets/js/jquery.2.1.1.min.js"></script>
<script>
    function assimentCustomer(customerid) {
        $('#assimentCustomerModal').modal();
        loadStaff(customerid)
        $('#customerid').val(customerid);
    }

    $('#btnassigmentCustomer').click(function (e) {
        e.preventDefault();
        var data = {};
        data['customerId'] = $('#customerid').val();
        var staffs = $('#staffList').find('tbody input[type = checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        data['staffs'] = staffs;
        if (data['staffs'] != '') {
            assingmentCustomer(data);
        }
    })

    function assingmentCustomer(data) {
        $.ajax({
            type: "POST",
            url: "/api/customer/" + "assigment",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "json",
            success: function (respond) {
                console.log("Success");

            },
            error: function (respond) {
                console.log("failed")
                window.location.href = "<c:url value="/admin/customer-list"/>";
            }
        });
    }

    $('#btnSearchCustomer').click(function (e) {
        e.preventDefault();
        $('#listCustomer').submit();
    })


    function loadStaff(customerid) {
        $.ajax({
            type: "GET",
            url: "/api/customer/" + customerid + '/staffs',
            // data:JSON.stringify(data),
            // contentType:"application/json",
            dataType: "json",
            success: function (response) {
                var row = '';
                $.each(response.data, function (index, item) {
                    row += '<tr>';
                    row += '<td class = "text-center"><input type="checkbox"  value=' + item.staffId + ' id="checkboox_' + +item.staffId + '" class="check-box-elenemnt "' + item.checked + '/></td>';
                    row += '<td class = "text-center">' + item.fullName + '</td>';
                    row += '</tr>';
                });
                $('#staffList tbody').html(row);
                console.info("success");
            },
            error: function (respond) {
                console.log("failed")
                console.log(respond);
            }
        });
    }

    function deleteCustomer(data) {
        var customerid = [data];
        deleteCustomers(customerid);
    }

    $('#btnDeleteCustomer').click(function (e) {
        e.preventDefault();
        var customerids = $('#tableList').find('tbody input[type = checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        deleteCustomers(customerids);
        console.log("ok");
    });

    function deleteCustomers(data) {
        $.ajax({
            type: "DElETE",
            url: "/api/customer/" + data,
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
</script>


</body>
</html>
