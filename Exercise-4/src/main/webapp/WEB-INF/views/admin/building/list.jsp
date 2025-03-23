<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingListURL" value="/admin/building-list"/>
<c:url var="BuildingAPI" value="/api/building"/>
<html>
<head>
    <link rel="stylesheet" href="/login/admin.css" type="text/css" media="all">

    <title>Danh Sách Toà Nhà</title>
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
                <li class="active">Quản Lý Toà Nhà</li>
            </ul><!-- /.breadcrumb -->


        </div>

        <div class="page-content">


            <div class="page-header">
                <h1>
                    Danh Sách Toà Nhà
                    <small>
                        <i class="ace-icon fa fa-angle-double-right"></i>
                        Tìm Kiếm
                    </small>
                </h1>
            </div><!-- /.page-header -->
            <div class="row">
                <div class="col-xs-12" style="border-radius: 10px">
                    <div class="widget-box ui-sortable-handle" style="border: none !important;">
                        <div class="widget-header" style="border:none !important;">
                            <div class="widget-toolbar">
                                <a data-action="collapse"><i class="ace-icon fa fa-chevron-up">
                                </i>
                                </a>
                            </div>
                        </div>
                        <div class="widget-body" style="font-family: 'Times New Roman', Times, serif;">
                            <div class="widget-main">
                                <form:form id="listForm" action="${buildingListURL}" method="GET"
                                           modelAttribute="modelSearch">
                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-6">
                                                    <label class="name">Tên Toà Nhà</label>
                                                    <form:input type="text" class="form-control" path="name"/>
                                                </div>
                                                <div class="col-xs-6">
                                                    <label class="name">Diện Tích Sàn</label>
                                                    <form:input class="form-control" path="floorArea"/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div>
                                                    <div class="col-xs-2">
                                                        <label class="name">Quận</label>
                                                        <form:select class="form-control" path="district">
                                                            <form:option value="">
                                                                ---Chọn Quận----
                                                            </form:option>
                                                            <form:options items="${districts}"></form:options>
                                                        </form:select>
                                                    </div>
                                                </div>
                                                <div class="col-xs-5">
                                                    <label class="name">Phường</label>
                                                    <form:input type="text" class="form-control" path="ward"/>
                                                </div>
                                                <div class="col-xs-5">
                                                    <label class="name">Đường</label>
                                                    <form:input type="text" class="form-control" path="street"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-4">
                                                    <label class="name">Số Tầng Hầm</label>
                                                    <form:input type="number" class="form-control"
                                                                path="numberOfBasement"/>
                                                </div>
                                                <div class="col-xs-4">
                                                    <label class="name">Hướng</label>
                                                    <form:input type="text" class="form-control" path="direction"/>
                                                </div>
                                                <div class="col-xs-4">
                                                    <label class="name">Hạng</label>
                                                    <form:input type="number" class="form-control" path="level"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-3">
                                                    <label class="name">Diện Tích Từ</label>
                                                    <form:input type="number" class="form-control" path="areaFrom"/>
                                                </div>
                                                <div class="col-xs-3">
                                                    <label class="name">Diện Tích Đến</label>
                                                    <form:input type="number" class="form-control" path="areaTo"/>
                                                </div>
                                                <div class="col-xs-3">
                                                    <label class="name">Giá Thuê Từ</label>
                                                    <form:input type="number" class="form-control"
                                                                path="rentPriceFrom"/>
                                                </div>
                                                <div class="col-xs-3">
                                                    <label class="name">Giá Thuê Đến</label>
                                                    <form:input type="number" class="form-control" path="rentPriceTo"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-5">
                                                    <label class="name">Tên Quản Lý</label>
                                                    <form:input type="text" class="form-control" path="managerName"/>

                                                </div>
                                                <div class="col-xs-5">
                                                    <label class="name">Số Điện Thoại</label>
                                                    <form:input class="form-control" path="managerPhone"/>
                                                </div>
                                                <div class="col-xs-2">
                                                    <security:authorize access="hasRole('MANAGER')">
                                                        <label class="name">Nhân Viên</label>
                                                        <form:select type="text" class="form-control" path="staffId">
                                                            <form:option value="">---Chọn Nhân Viên---</form:option>
                                                            <form:options items="${listStaffs}"></form:options>

                                                        </form:select>
                                                    </security:authorize>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-6">
                                                    <form:checkboxes items="${typeCodes}"
                                                                     path="typeCode"></form:checkboxes>
                                                </div>
                                                <div class="col-xs-12">
                                                    <div class="class-xs-6">
                                                            <%--                            <button type="button" class="" id="btnSearchBuilding" style=" border-radius: 20px;  background-color: rgba(255,48,21,0.83) !important; width: 40px ;font-size: 10px" >--%>
                                                            <%--                              <svg xmlns="http://www.w3.org/2000/svg"  width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16" style="padding-top:5px">--%>
                                                            <%--                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"></path>--%>
                                                            <%--                              </svg>--%>

                                                            <%--                            </button>--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </form:form>
                            </div>
                        </div>
                        <div class="pull-left">
                            <button type="button" class="" id="btnSearchBuilding"
                                      style=" border-radius: 20px;  background-color: rgba(255,48,21,0.83) !important; width: 40px ;font-size: 10px;margin: 5px 0 0 10px" >
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-search" viewBox="0 0 16 16" style="padding-top:5px">
                                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"></path>
                                </svg>

                            </button>
                        </div>
                        <div class="pull-right" style="margin: 5px 0 0 40px">
                            <a href="/admin/building-edit">
                                <button class="btn btn-info" title="Thêm Toà Nhà" style=" border-radius: 7px">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-building-add" viewBox="0 0 16 16">
                                        <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                        <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                        <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                    </svg>
                                </button>
                            </a>

                            <button class="btn btn-danger" title="Xoá Toà Nhà" id="btnDeleteBuilding"
                                    style=" border-radius: 7px">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-building-dash" viewBox="0 0 16 16">
                                    <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                    <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                    <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!--Bảng Danh Sách-->
            <div class="row">
                <div class="col-xs-12">
                    <table id="tableList" class="table table-striped table-bordered table-hover">
                        <%--            <thead>--%>
                        <%--            <tr>--%>
                        <%--              <th class="center">--%>
                        <%--                <label class="pos-rel">--%>
                        <%--                  <input type="checkbox" class="ace"  name="checkList" value="">--%>
                        <%--                  <span class="lbl"></span>--%>
                        <%--                </label>--%>
                        <%--              </th>--%>
                        <%--              <th>Tên Toà Nhà</th>--%>
                        <%--              <th>Địa Chỉ</th>--%>
                        <%--              <th>Số Tầng Hầm</th>--%>
                        <%--              <th>Tên Quản Lý</th>--%>
                        <%--              <th>Số điện thoại quản lý</th>--%>
                        <%--              <th>D.Tích sàn</th>--%>
                        <%--              <th>D.Tích Trống</th>--%>
                        <%--              <th>Giá Thuê</th>--%>
                        <%--              <th>Phí Dịch Vụ</th>--%>
                        <%--              <th>Phí MG</th>--%>
                        <%--              <th>Thao Tác</th>--%>


                        <%--            </tr>--%>
                        <%--            </thead>--%>

                        <tbody>
                        <%--<c:forEach var="item" items="${buildingList}">--%>
                        <%--  <tr>--%>
                        <%--    <td class="center">--%>
                        <%--      <label class="pos-rel">--%>
                        <%--        <input type="checkbox" class="ace" name="checkList" value="${item.id}">--%>
                        <%--        <span class="lbl"></span>--%>
                        <%--      </label>--%>
                        <%--    </td>--%>

                        <%--    <td>${item.name}</td>--%>
                        <%--    <td>${item.address}</td>--%>
                        <%--    <td>${item.numberOfBasement}</td>--%>
                        <%--    <td>${item.managerName}</td>--%>
                        <%--    <td>${item.managerPhone}</td>--%>
                        <%--    <td>${item.floorArea}</td>--%>
                        <%--    <td>${item.rentArea}</td>--%>
                        <%--    <td></td>--%>
                        <%--    <td></td>--%>
                        <%--    <td class="hidden-480">--%>
                        <%--      <span class="label label-sm label-warning">Expiring</span>--%>
                        <%--    </td>--%>

                        <%--    <td>--%>
                        <%--      <div class="hidden-sm hidden-xs btn-group">--%>
                        <%--        <button class="btn btn-xs btn-success" title="Giao Toàn Nhà" onclick="assimentBuilding(${item.id})">--%>
                        <%--          <i class="ace-icon glyphicon glyphicon-list"></i>--%>
                        <%--        </button>--%>

                        <%--        <a class="btn btn-xs btn-info" title="sua toa nha" href="/admin/building-edit-${item.id}">--%>
                        <%--          <i class="ace-icon fa fa-pencil bigger-120"></i>--%>
                        <%--        </a>--%>

                        <%--        <button class="btn btn-xs btn-danger" >--%>
                        <%--          <i class="ace-icon fa fa-trash-o bigger-120" title="Xoá Toà Nhà" onclick="deleteBuilding(${item.id})"></i>--%>
                        <%--        </button>--%>
                        <%--      </div>--%>
                        <%--    </td>--%>
                        <%--  </tr>--%>
                        <%--</c:forEach>--%>

                        <form:form modelAttribute="buildingList">
                            <display:table name="buildingList.listResult" cellpadding="0" cellspacing="0"
                                           requestURI="${buildingListURL}" partialList="true" sort="external"
                                           size="${buildingList.totalItems}"
                                           defaultorder="ascending"
                                           id="tableList" pagesize="${buildingList.maxPageItems}"
                                           export="false"
                                           class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                           style="margin: 3em 0 1.5em">
                                <display:column title="<fieldset class='form-group'>
                                      <input type='checkbox' id = 'checkAll' class ='check-box-element'>
                                      </fieldset>" class="center select-cell"
                                                headerClass="center select-cell">
                                    <fieldset>
                                        <input type="checkbox" name="checkList" value="${tableList.id}"
                                               id="checkbox_${tableList.id}" class="check-box-element"/>
                                    </fieldset>
                                </display:column>
                                <display:column headerClass="text-left" property="name" title="Tên Toà Nhà"/>
                                <display:column headerClass="text-left" property="address" title="Địa chỉ"/>
                                <display:column headerClass="text-left" property="numberOfBasement"
                                                title="Số tầng hầm"/>
                                <display:column headerClass="text-left" property="managerName" title="Tên quản lí"/>
                                <display:column headerClass="text-left" property="managerPhone"
                                                title="SĐT quản lí"/>
                                <display:column headerClass="text-left" property="floorArea" title="D.tích sàn"/>
                                <display:column headerClass="text-left" property="emptyArea" title="D.tích trống"/>
                                <display:column headerClass="text-left" property="rentArea" title="D.tích thuê"/>
                                <display:column headerClass="text-left" property="serviceFee" title="Phí môi giới"/>
                                <display:column headerClass="col-actions" title="Thao tác">
                                    <div class="hidden-sm hidden-xs btn-group">
                                        <security:authorize access="hasRole('MANAGER')">
                                            <a class="btn btn-xs btn-success" title="Giao Toàn Nhà"
                                               onclick="assimentBuilding(${tableList.id})">
                                                <i class="ace-icon glyphicon glyphicon-list"></i>
                                            </a>
                                        </security:authorize>

                                        <a class="btn btn-xs btn-info" title="sua toa nha"
                                           href="/admin/building-edit-${tableList.id}">
                                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                                        </a>
                                        <security:authorize access="hasRole('MANAGER')">
                                            <a class="btn btn-xs btn-danger">
                                                <i class="ace-icon fa fa-trash-o bigger-120" title="Xoá Toà Nhà"
                                                   onclick="deleteBuilding(${tableList.id})"></i>
                                            </a>
                                        </security:authorize>
                                    </div>

                                </display:column>
                            </display:table>
                        </form:form>

                        </tbody>
                    </table>
                </div><!-- /.span -->
            </div>


        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->

<div class="modal fade" id="assimentBuildingModal" role="dialog"
     style="font-family: 'Times New Roman', Times, serif;">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"></button>
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
                <input type="hidden" id="buildingid" name="buildingId" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnassimentBuilding">Giao Toà Nhà</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>

    </div>
</div>
<script>
    function assimentBuilding(buildingid) {
        $('#assimentBuildingModal').modal();
        loadStaff(buildingid);
        $('#buildingid').val(buildingid);
    }

    function loadStaff(buildingid) {
        $.ajax({
            type: "GET",
            url: "${BuildingAPI}/" + buildingid + '/staffs',
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
            error: function (response) {
                console.log("failed"),
                    console.log(respond);
            }
        });
    }

    $('#btnassimentBuilding').click(function (e) {
        e.preventDefault();
        var data = {};
        data['buildingId'] = $('#buildingid').val();
        var staffs = $('#staffList').find('tbody input[type = checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        data['staffs'] = staffs;
        if (data['staffs'] != '') {
            assingmentBuilding(data);
        }

    });

    function assingmentBuilding(data) {
        $.ajax({
            type: "POST",
            url: "${BuildingAPI}/" + "assigment",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "json",
            success: function (respond) {
                console.log("Success");

            },
            error: function (respond) {
                console.log("failed")
                window.location.href = "<c:url value="/admin/building-list"/>";
            }
        });
    }

    $('#btnSearchBuilding').click(function (e) {
        e.preventDefault();
        $('#listForm').submit();
    });

    function deleteBuilding(data) {
        var buildingid = [data];
        deleteBuildings(buildingid);
    }

    $('#btnDeleteBuilding').click(function (e) {
        e.preventDefault();
        var buildingids = $('#tableList').find('tbody input[type = checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        deleteBuildings(buildingids);
        console.log("ok");
    });

    function deleteBuildings(data) {
        $.ajax({
            type: "DElETE",
            url: "${BuildingAPI}/" + data,
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
