<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div id="sidebar" class="sidebar                  responsive                    ace-save-state" style="background-color: white;border-right-style:solid ;border-left-style:none;border-top-style:none;border-bottom-style:none ;border-width: 15px;border-color:rgba(241,241,241,0.83) "   >


    <script type="text/javascript">
        try{ace.settings.loadState('sidebar')}catch(e){}
    </script>
    <div class="sidebar-shortcuts" style="background-color: white">
        <div class="sidebar-shortcuts-large" >
            <p  style="background-color: white">
                <img src="/img/lovepik-cartoon-avatar-png-image_401205594_wh1200-removebg-preview.png" alt="logo" style="width: 50px; height: 50px ">
                <%=SecurityUtils.getPrincipal().getFullName()%>



                <a href="/trang-chu">
                    <button  class="btn btn-success" style="text-align: center; width: 20px; height: 20px; padding: 0; border-width: 4px; border-radius:100% ;margin-left: 5px" title="Trang chủ">
                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="12" fill="currentColor" class="bi bi-door-open" viewBox="0 0 16 16">
                            <path d="M8.5 10c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1z"/>
                            <path d="M10.828.122A.5.5 0 0 1 11 .5V1h.5A1.5 1.5 0 0 1 13 2.5V15h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V1.5a.5.5 0 0 1 .43-.495l7-1a.5.5 0 0 1 .398.117zM11.5 2H11v13h1V2.5a.5.5 0 0 0-.5-.5zM4 1.934V15h6V1.077l-6 .857z"/>
                        </svg>
                    </button>
                </a>
            </p>


        </div>
        <div class="sidebar-shortcuts-mini">
            <span class="btn btn-success"></span>

            <span class="btn btn-info"></span>

            <span class="btn btn-warning"></span>

            <span class="btn btn-danger"></span>
        </div>
    </div>

    <ul class="nav nav-list"  style="margin-top: 20px" >
        <li class=""  style="border:none ">
            <a href="#" class="dropdown-toggle" style="background-color: white" >
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
                    <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
                </svg>
                <span  class="menu-text">Quản Lý Tài Khoản</span>
            </a>
            <b class="arrow"></b>
            <ul class="submenu">
                <li class="" >
                    <a href='/admin/user-list' >
                        <i class="menu-icon fa fa-caret-right"></i>
                        Danh sách Tài Khoản
                    </a>
                    <b class="arrow"></b>
                </li>
            </ul>
        </li>
    </ul>

    <ul class="nav nav-list"  style="margin-top: 20px ">
        <li class=""  style="border:none ">
            <a href="#" class="dropdown-toggle" style="background-color: white">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"  class="bi bi-buildings-fill" viewBox="0 0 16 16">
                    <path d="M15 .5a.5.5 0 0 0-.724-.447l-8 4A.5.5 0 0 0 6 4.5v3.14L.342 9.526A.5.5 0 0 0 0 10v5.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V14h1v1.5a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5zM2 11h1v1H2zm2 0h1v1H4zm-1 2v1H2v-1zm1 0h1v1H4zm9-10v1h-1V3zM8 5h1v1H8zm1 2v1H8V7zM8 9h1v1H8zm2 0h1v1h-1zm-1 2v1H8v-1zm1 0h1v1h-1zm3-2v1h-1V9zm-1 2h1v1h-1zm-2-4h1v1h-1zm3 0v1h-1V7zm-2-2v1h-1V5zm1 0h1v1h-1z"/>
                </svg>
                <span class="menu-text">Quản Lý Toà Nhà</span>
            </a>
            <b class="arrow"></b>
            <ul class="submenu">
                <li class="">
                    <a href='/admin/building-list'>
                        <i class="menu-icon fa fa-caret-right"></i>
                        Danh sách Toà Nhà
                    </a>
                    <b class="arrow"></b>
                </li>
            </ul>
        </li>
    </ul>

    <ul class="nav nav-list" style="margin-top: 20px">
        <li class=""  style="border:none ">
            <a href="#" class="dropdown-toggle" style="background-color: white">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
                    <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6m-5.784 6A2.24 2.24 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.3 6.3 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5"/>
                </svg>
                <span class="menu-text">Quản Lý Khách Hàng</span>
            </a>
            <b class="arrow"></b>
            <ul class="submenu">
                <li class="">
                    <a href='/admin/customer-list'>
                        <i class="menu-icon fa fa-caret-right"></i>
                        Danh sách khách hàng
                    </a>
                    <b class="arrow"></b>
                </li>
            </ul>
        </li>
    </ul>
    <ul class="nav nav-list" style="margin-top: 20px">
        <li class=""  style="border:none ">
            <a href="#" class="dropdown-toggle" style="background-color: white">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-handbag-fill" viewBox="0 0 16 16">
                    <path d="M8 1a2 2 0 0 0-2 2v2H5V3a3 3 0 1 1 6 0v2h-1V3a2 2 0 0 0-2-2M5 5H3.36a1.5 1.5 0 0 0-1.483 1.277L.85 13.13A2.5 2.5 0 0 0 3.322 16h9.355a2.5 2.5 0 0 0 2.473-2.87l-1.028-6.853A1.5 1.5 0 0 0 12.64 5H11v1.5a.5.5 0 0 1-1 0V5H6v1.5a.5.5 0 0 1-1 0z"/>
                </svg>
                <span class="menu-text">Sản Phẩm</span>
            </a>
            <b class="arrow"></b>
            <ul class="submenu">
                <li class="">
                    <a href='/admin/product-list'>
                        <i class="menu-icon fa fa-caret-right"></i>
                        Danh sách Sản Phẩm
                    </a>
                    <b class="arrow"></b>
                </li>
                <li class="">
                    <a href='/admin/product-edit'>
                        <i class="menu-icon fa fa-caret-right"></i>
                       Thêm sản phẩm
                    </a>
                    <b class="arrow"></b>
                </li>
            </ul>
        </li>
    </ul>


</div>