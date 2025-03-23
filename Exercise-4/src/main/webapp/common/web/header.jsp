<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.javaweb.security.utils.SecurityUtils" %>
<nav class="">
		<div class="row navbar">
			<div class="col-12 col-md-3" style="margin-top: 16px !important;">
				<div class="logo">
					<a href="">
						<img src="https://vinhomes.vn/themes/porto/img/vinhomes/ht/vinhomes_logo.svg"
							 alt="">
					</a>
				</div>
			</div>
			<div class="col-12 col-md-6" style="margin-top: -4px!important;">
				<div class="item-menu">
					<div class="nav nav1">
						<div class="nav-item p-2">
							<a class="nav-item-link" href="/trang-chu">
								<span style="color: var(--primary-color);">Trang chủ</span>
							</a>
						</div>
						<div class="nav-item p-2">
							<a href='<c:url value='/gioi-thieu'/>'>
								<%--<span>Giới thiệu</span>--%>
								<span style="color: var(--primary-color);">Giới thiệu</span>
							</a>
						</div>
						<div class="nav-item p-2">
							<%--<a class="nav-item-link" href="./Duan.html">--%>
							<a href='<c:url value='/san-pham'/>'>
								<%--<span>Sản phẩm</span>--%>
								<span style="color: var(--primary-color);">Sản phẩm</span>
							</a>
						</div>
						<div class="nav-item p-2">
							<a href='<c:url value='/tin-tuc'/>'>
								<%--<span>Tin tức</span>--%>
								<span style="color: var(--primary-color);">Tin tức</span>
							</a>
						</div>
						<div class="nav-item p-2">
							<a href='<c:url value='/lien-he'/>'>
								<%--<span>Liên hệ</span>--%>
									<span style="color: var(--primary-color);">Liên hệ</span>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="nav-login col-12 col-md-3" id="navbarResponsive">

					<%--<li class="nav-item active"><a class="nav-link" href="/trang-chu#">Trang chủ--%>
						<%--<span class="sr-only">(current)</span>--%>
					<%--</a></li>--%>
					<security:authorize access = "isAnonymous()">
						<button style="border-style: solid; border-radius:60px ;background-color: #D9A24A"><a class="nav-link" href="<c:url value='/login'/>" style="color: black">Đăng nhập</a></button>
<%--						<button  style="border-style: solid; border-radius:60px ;"><a class="nav-link" href="#"  style="color: black">Đăng ký</a></button>--%>
					</security:authorize>
					<security:authorize access = "isAuthenticated()">
						<button  style="border-style: solid; border-radius:60px ; background-color: #D9A24A"><a class="nav-link" href="#"  style="color: black">  <%=SecurityUtils.getPrincipal().getUsername()%></a></button>
						<button  style="border-style: solid; border-radius:60px ;"><a class="nav-link" href="<c:url value='/logout'/>"  style="color: black">Thoát</a></button>
					</security:authorize>

			</div>
		</div>
</nav>