<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="ProductListURL" value="/admin/product-list"/>
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
                <li class="active">Quản Lý Sản Phẩm</li>
            </ul><!-- /.breadcrumb -->


        </div>
        <div class="page-content">
            <div class="page-header">
                <h1>
                    Danh Sách Sản Phẩm
                    <small>


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
                            <form:form id="listProduct" action="${ProductListURL}" method="GET"
                                       modelAttribute="realEstateUnitDTO">
                                <div class="widget-main">
                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-6">
                                                    <label class="name">Tên Toà Nhà</label>
                                                    <form:input type="text" class="form-control" path="name"/>
                                                </div>
                                                <div class="col-xs-6">
                                                    <label class="name">Căn hộ</label>
                                                    <form:input type="text" class="form-control" path="nameUnit"/>
                                                </div>

                                            </div>
                                        </div>


                                    </div>


                                </div>
                            </form:form>
                        </div>
                        <div class="pull-left">
                            <button type="button" class="" id="btnSearchProduct"
                                    style=" border-radius: 20px;  background-color: rgba(255,48,21,0.83) !important; width: 40px ;font-size: 10px;margin: 5px 0 0 10px">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-search" viewBox="0 0 16 16" style="padding-top:5px">
                                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"></path>
                                </svg>

                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="margin:10px 0 0 -2px">
            <div class="col-xs-12">
                <table id="tableList" class="table table-striped table-bordered table-hover">
                    <tbody>
                    <%--                    <c:forEach var="item" items="${ListBuilding}">--%>
                    <%--                    <tr>--%>


                    <%--                        <td>${item.name} : ${item.nameUnit}</td>--%>
                    <%--                        <td>${item.address}</td>--%>
                    <%--                        <td>${item.type}</td>--%>
                    <%--                        <td>${item.value} m2</td>--%>
                    <%--                        <td>${item.price} Tỷ</td>--%>

                    <%--                        <td>--%>
                    <%--                            <div class="hidden-sm hidden-xs btn-group">--%>

                    <%--                                <a class="btn btn-xs btn-info" title="sua toa nha"--%>
                    <%--                                   href="/admin/product-edit-${item.idRealEstate}">--%>
                    <%--                                    <i class="ace-icon fa fa-pencil bigger-120"></i>--%>
                    <%--                                </a>--%>

                    <%--                                <button class="btn btn-xs btn-danger">--%>
                    <%--                                    <i class="ace-icon fa fa-trash-o bigger-120" title="Xoá Toà Nhà"--%>
                    <%--                                       onclick="deleteBuilding(${item.id})"></i>--%>
                    <%--                                </button>--%>
                    <%--                            </div>--%>
                    <%--                        </td>--%>
                    <%--                    </tr>--%>
                    <%--                    </c:forEach>--%>
                    <form:form modelAttribute="ListBuilding">
                    <display:table name="ListBuilding.listResult" cellpadding="0" cellspacing="0"
                                   requestURI="${ProductListURL}" partialList="true" sort="external"
                                   size="${ListBuilding.totalItems}"
                                   defaultorder="ascending"
                                   id="tableList" pagesize="${ListBuilding.maxPageItems}"
                                   export="false"
                                   class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                   style="margin: 3em 0 1.5em;">


                    <display:column headerClass="text-left" title="Thông tin căn hộ">
                        ${tableList.name} : ${tableList.nameUnit}
                    </display:column>
                        <display:column headerClass="text-left" property="address" title="Địa Chỉ"/>
                        <display:column headerClass="text-left" property="type" title="Loại"/>
                        <display:column headerClass="text-left" property="value" title="Diện tích"/>
                        <display:column headerClass="text-left" property="price" title="Giá"/>
                    <display:column headerClass="col-actions" title="Thao tác">
                    <div class="hidden-sm hidden-xs btn-group">

                        <a class="btn btn-xs btn-info" title="sua toa nha"
                           href="/admin/product-edit-${tableList.idRealEstate}">
                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                        </a>

                        <button class="btn btn-xs btn-danger">
                            <i class="ace-icon fa fa-trash-o bigger-120" title="Xoá Toà Nhà"
                               onclick="deleteProduct(${tableList.idRealEstate})"></i>
                        </button>
                    </div>

                    </display:column>
                    </display:table>
                    </form:form>
            </div>
        </div>


        <!-- basic scripts -->

        <!--[if !IE]> -->
        <!-- Modal -->


        <script src="assets/js/jquery.2.1.1.min.js"></script>
        <script>


            $('#btnSearchProduct').click(function (e) {
                e.preventDefault();
                $('#listProduct').submit();
            })


            function deleteProduct(data) {

                deleteProducts(data);
            }
            function deleteProducts(data) {
                $.ajax({
                    type: "DELETE",
                    url: "/api/product/" + data,
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

