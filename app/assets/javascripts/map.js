// var map = new BMap.Map("container");
// var point = new BMap.Point(126.638718,45.749316);
// var schoolcenter = new BMap.Point(126.638718,45.749316);
// map.centerAndZoom(point,17);

// //map.enableScrollWheelZoom();    //鼠标滚轮缩放
// map.enableContinuousZoom();      //让地图启动滑动效果

// var b = new BMap.Bounds(new BMap.Point(126.627938, 45.74145),
// 						new BMap.Point(126.647629, 45.756771));
// try {	
// 	BMapLib.AreaRestriction.setBounds(map, b);
// } catch (e) {
// 	alert(e);
// }



// map.addControl(new BMap.NavigationControl());  
// // map.addControl(new BMap.OverviewMapControl());
// // map.addControl(new BMap.OverviewMapControl({ isOpen: true, anchor: BMAP_ANCHOR_BOTTOM_RIGHT }));   //ÓÒÏÂ½Ç£¬´ò¿ª

// var localSearch = new BMap.LocalSearch(map);
// localSearch.enableAutoViewport(); //ÔÊÐí×Ô¶¯µ÷½Ú´°Ìå´óÐ¡

// map.addEventListener("click", function(e){//µØÍ¼µ¥»÷ÊÂ¼þ
// 	//map.clearOverlays();
// 	document.getElementById("place_locationx").value = e.point.lng;
//     document.getElementById("place_locationy").value = e.point.lat;
//     alert("click!");
// 	var point = new BMap.Point(e.point.lng, e.point.lat);
// 	var marker = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat));  // ´´½¨±ê×¢£¬ÎªÒª²éÑ¯µÄµØ·½¶ÔÓ¦µÄ¾­Î³¶È
//     map.addOverlay(marker);
// });

// function findPath(){
// 	alert("findPath");
	

	
// }

// function addMaker(){
//     var x = document.getElementById("place_locationx").value;
//     var y = document.getElementById("place_locationy").value;
//     // alert(x);
    
//     // document.getElementById("place_locationy").value = "1234"
//     var marker = new BMap.Marker(new BMap.Point(x, y));  // ´´½¨±ê×¢£¬ÎªÒª²éÑ¯µÄµØ·½¶ÔÓ¦µÄ¾­Î³¶È
//     map.addOverlay(marker);

// }
