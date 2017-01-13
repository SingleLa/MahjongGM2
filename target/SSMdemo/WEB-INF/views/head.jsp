<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'head.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <!-- Title and other stuffs -->
  <title>Rafotech后台管理</title> 
  <meta name="keywords" content="Bootstrap模版,Bootstrap模版下载,Bootstrap教程,Bootstrap中文,后台管理系统模版,后台模版下载,后台管理系统,后台管理模版" />
  <meta name="description" content="代码家园-www.daimajiayuan.com提供Bootstrap模版,后台管理系统模版,后台管理界面,Bootstrap教程,Bootstrap中文翻译等相关Bootstrap插件下载" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="author" content="">
  <!-- Stylesheets -->
  <link href="<%=basePath %>css/bootstrap.min.css" rel="stylesheet">
  <link href="style/bootstrap.css" rel="stylesheet">
  <!-- Font awesome icon -->
  <link rel="stylesheet" href="<%=basePath %>style/font-awesome.css"> 
  <!-- jQuery UI -->
  <link rel="stylesheet" href="<%=basePath %>style/jquery-ui.css"> 
  <!-- Calendar -->
  <link rel="stylesheet" href="<%=basePath %>style/fullcalendar.css">
  <!-- prettyPhoto -->
  <link rel="stylesheet" href="<%=basePath %>style/prettyPhoto.css">  
  <!-- Star rating -->
  <link rel="stylesheet" href="<%=basePath %>style/rateit.css">
  <!-- Date picker -->
  <link rel="stylesheet" href="<%=basePath %>style/bootstrap-datetimepicker.min.css">
  <!-- CLEditor -->
  <link rel="stylesheet" href="<%=basePath %>style/jquery.cleditor.css"> 

  <!-- Bootstrap toggle -->
  <link rel="stylesheet" href="<%=basePath %>style/bootstrap-switch.css">
  <!-- Main stylesheet -->
  <link href="<%=basePath %>style/style.css" rel="stylesheet">
  <!-- Widgets stylesheet -->
  <link href="<%=basePath %>style/widgets.css" rel="stylesheet">   
  
  <!-- HTML5 Support for IE -->
  <!--[if lt IE 9]>
  <script src="js/html5shim.js"></script>
  <![endif]-->

  <!-- Favicon -->
  <link rel="shortcut icon" href="img/favicon/favicon.png">
</head>

<body>

<div class="navbar navbar-fixed-top bs-docs-nav" role="banner">
  
    <div class="conjtainer">
      <!-- Menu button for smallar screens -->
      <div class="navbar-header">
		  <button class="navbar-toggle btn-navbar" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
			<span>菜单</span>
		  </button>
		  <!-- Site name for smallar screens -->
		  <a href="index.html" class="navbar-brand hidden-lg">首页</a>
		</div>
      
      

      <!-- Navigation starts -->
      <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">         

        <ul class="nav navbar-nav">  

          <!-- Upload to server link. Class "dropdown-big" creates big dropdown -->
         

          <!-- Sync to server link -->
          

        </ul>

       
        <!-- Links -->
        <ul class="nav navbar-nav pull-right">
          <li class="dropdown pull-right">            
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
              <i class="icon-user"></i> ${sessionScope.user.userName } <b class="caret"></b>              
            </a>
            
            <!-- Dropdown menu -->
            <ul class="dropdown-menu">
              <li><a href="#"><i class="icon-user"></i> 资料</a></li>
              <li><a href="#"><i class="icon-cogs"></i> 设置</a></li>
              <li><a href="login.html"><i class="icon-off"></i> 退出</a></li>
            </ul>
          </li>
          
        </ul>
      </nav>

    </div>
  </div>


<!-- Header starts -->
  <header>
  <div class="col-md-4">
          <!-- Logo. -->
          <div class="logo">
            <h1><a href="#">MahjongGM<span class="bold"></span></a></h1>
            <p class="meta">后台管理系统</p>
          </div>
          <!-- Logo ends -->
        </div>
    <div class="container">
      <div class="row">

        <!-- Logo section -->
        

      </div>
    </div>
  </header>





</body>
</html>
