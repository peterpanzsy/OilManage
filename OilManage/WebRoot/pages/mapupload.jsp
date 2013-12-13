<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<!-- Bootstrap -->
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/justified-nav.css">
<!-- 自定义 -->
<link rel="stylesheet" type="text/css" href="css/styles.css" />

<script src="js/jquery/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- 自定义 -->
<script src="js/global.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=4bfe7b8632739c89a1b8e95529da1d97"></script>


<style type="text/css">
body,html,#allmap {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin: 0;
}
</style>

</head>
<body>
	<div id="allmap"></div>
</body>
</html>
<script type="text/javascript">


  $.post("map.action",
  {
    name:"ice",
    
  },
  function(data,status){
    //alert("Data: " + data + "\nStatus: " + status);    
    list=data.points    
    alert(list.length)
	}
  });
	var map = new BMap.Map("allmap");            // 创建Map实例
	var point = new BMap.Point(116.404, 39.915);    // 创建点坐标
	map.centerAndZoom(point,8);                     // 初始化地图,设置中心点坐标和地图级别。
	map.enableScrollWheelZoom();                            //启用滚轮放大缩小


map.addControl(new BMap.MapTypeControl({anchor: BMAP_ANCHOR_TOP_RIGHT}));    //左上角，默认地图控件
map.setCurrentCity("北京");   //由于有3D图，需要设置城市哦
map.addControl(new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_LEFT}));  //添加默认缩放平移控件

map.addControl(new BMap.ScaleControl()); 
var marker1 = new BMap.Marker(new BMap.Point(116.384, 39.925));  // 创建标注
map.addOverlay(marker1);
var point = new BMap.Point(116.404, 39.915);
var pointArray=new Array(list.length);
for (i=0;i<list.length;i++){
	pointArray[i]=new BMap.Point(list[i]['longitude'], list[i]['latitude']),
}
map.centerAndZoom(point, 15);
var polyline = new BMap.Polyline(pointArray, {strokeColor:"blue", strokeWeight:6, strokeOpacity:0.5});
map.addOverlay(polyline);
	
    
</script>