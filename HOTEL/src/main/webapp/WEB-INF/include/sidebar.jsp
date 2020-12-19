<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script> 
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

  <!-- Main Sidebar Container -->
 <aside class="main-sidebar sidebar-dark-primary elevation-4">

<a href="/hotel/admin/main" class="brand-link">
      <img src="<c:url value='/resources/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8'/>">
      <span class="brand-text font-weight-light">Admin Dashboard</span>
    </a>
    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
         <li class="nav-header">MENUS</li>
          
          <!-- 객실관리 -->
          <li class="nav-item has-treeview">
            <a href="#" id="item_m" class="nav-link">
             <i class="nav-icon far fa-image"></i>
              <p>객실관리
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
            <li class="nav-item">
                <a href="<c:url value='/admin/roomsList'/>" id="item_list" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>객실 리스트</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<c:url value='/admin/newRoomForm'/>" id="item_write" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>객실 등록</p>
                </a>
              </li>
            </ul>
          </li>
          
          <!-- 부대시설 관리 -->
          <li class="nav-item has-treeview">
            <a href="#" id="item_m" class="nav-link">
             <i class="nav-icon far fa-image"></i>
              <p>부대시설 관리
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
            <li class="nav-item">
                <a href="<c:url value='/admin/facilitiesList'/>" id="item_list" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>부대시설 리스트</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<c:url value='/admin/newFacilitiesForm'/>" id="item_write" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>부대시설 등록</p>
                </a>
              </li>
            </ul>
          </li>
          
           <!-- 회원 관리 -->
          <li class="nav-item has-treeview">
            <a href="#" id="item_m" class="nav-link">
             <i class="nav-icon fas fa-table"></i>
              <p>회원 관리
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
            <li class="nav-item">
                <a href="<c:url value='/admin/memberList'/>" id="item_list" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>회원 목록</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<c:url value='/admin/reservationList'/>" id="item_list" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>예약자 목록</p>
                </a>
              </li>
            </ul>
          </li>
          
      
          
          <li class="nav-item">
            <a href="#" id="sale_m" class="nav-link">
              <i class="nav-icon fas fa-chart-pie"></i>
              <p>
               	매출 관리
                <!-- <span class="right badge badge-danger">New</span> -->
              </p>
            </a>
          </li>
          
          <li class="nav-item has-treeview">
            <a href="#" id="list_m" class="nav-link">
              <i class="nav-icon fas fa-edit"></i>
              <p>게시판 관리
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              
             
              <li class="nav-item has-treeview">
                <a href="#" id="notice_m" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>
                    공지사항 관리
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                <li class="nav-item">
                    <a href="noticeList" id="notice_list" class="nav-link">
                      <i class="far fa-dot-circle nav-icon"></i>
                      <p>공지사항 리스트</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="<c:url value='/admin/newNoticeForm'/>" id="notice_write" class="nav-link">
                      <i class="far fa-dot-circle nav-icon"></i>
                      <p>공지사항 등록</p>
                    </a>
                  </li>
                  
                </ul>

              <li class="nav-item">
                <a href="adminQnAList" id="qna_m" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>QnA 관리</p>
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>