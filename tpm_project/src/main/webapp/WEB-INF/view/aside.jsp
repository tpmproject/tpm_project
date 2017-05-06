<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- aside -->
<!--  d -->
<!-- d -->
<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar" style="height: auto;">
		<!-- Sidebar user panel -->
		<div class="user-panel" style="height:60px; ">
			<div class="pull-left image">
				<img src="/tpm_project/img/member/profile/${s_member_img}"
					class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info">
				<p>${s_member_name}</p>

				<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>
		<!-- search form -->
		<!-- <form action="#" method="get" class="sidebar-form">
			<div class="input-group">
				<input type="text" name="q" class="form-control"
					placeholder="Search..."> <span class="input-group-btn">
					<button type="submit" name="seach" id="search-btn"
						class="btn btn-flat">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form> -->
		<!-- /.search form -->
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li class="header">TPM</li>
			
			<li class="treeview">
              <a href="projectList.do">
                <i class="fa fa-list-alt" aria-hidden="true"></i><span>프로젝트</span>
              </a>
            </li>
            
			<li class="treeview">
              <a href="#">
                <i class="fa fa-television" aria-hidden="true"></i> <span>나의 업무</span>
                <i class="fa fa-angle-left pull-right" aria-hidden="true"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="myWork.do"><i class="fa fa-calendar-check-o" aria-hidden="true"></i> 업무 보기</a></li>
                <li><a href="calendarList.do"><i class="fa fa-calendar" aria-hidden="true"></i> 달력 보기</a></li>
              </ul>
            </li>  
            
            <li class="treeview">
              <a href="memberInfo.do">
                <i class="fa fa-user-circle-o" aria-hidden="true"></i><span>&nbsp;내 정보</span>
              </a>
            </li>    
            
            <li class="treeview">
              <a href="myFriendList.do">
                <i class="fa fa-handshake-o" aria-hidden="true"></i><span>&nbsp;친구</span>
              </a>
            </li>
            
            <li class="treeview">
              <a href="fileList.do">
                <i class="fa fa-floppy-o" aria-hidden="true"></i><span>&nbsp;파일</span>
              </a>
            </li>    
            
            <li class="treeview">
              <a href="chatListTest.do">
                <i class="fa fa-weixin" aria-hidden="true"></i><span>&nbsp;채팅</span>
              </a>
            </li>
            
            
 
			
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>