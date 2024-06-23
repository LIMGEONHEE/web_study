<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Spring Legacy 2</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
        crossorigin="anonymous" />
        
        <style>
        .topbar {
            width: 100%;
            background-color: white;
            color: white;
            padding: 10px;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000; /* Ensure it's above other content */
        }
        .sidebar {
            position: fixed;
            top: 180px; /* height of topbar */
            bottom: 0;
            left: 0;
            width: 200px;
            padding: 20px;
            background-color: #f8f9fa;
            overflow-y: auto;
        }
        .content {
            margin-top: 70px; /* height of topbar + some margin */
            margin-left: 220px; /* sidebar width + some margin */
            padding: 20px;
        }
        #map {
            width: 80%;
            height: 500px;
            margin-top: 20px; /* Adjust as needed */
            margin-left: 220px; /* Same as content margin-left */
        }
    </style>
    
</head>
<body>
    <body>
    <!-- Topbar -->
    <div class="topbar">
        <c:set var="pageTitle" value="Home" scope="page" />
        <%@ include file="./fragments/header.jspf" %>
    </div>

    <!-- Sidebar -->
    <aside class="sidebar">
        <h2>Sidebar</h2>
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link active" href="#">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Another Link</a>
            </li>
        </ul>
    </aside>

    <!-- Content -->
    <div class="content">
        <div class="container-fluid">
            <div class="card-header">
                <div id="map"></div>
                <div class="card-body">
                    <div class="way-info">
                        <div class="inner_box">
                            <p class="txt01">주소</p>
                            <p class="txt02">입력해주세요</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    
    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c5f576fbc4bf2a712d8f138a0b208af6"></script>
    <script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center : new kakao.maps.LatLng(37.4986813, 127.0318998), // 지도의 중심좌표
						level : 3
					// 지도의 확대 레벨
					};

					// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
					var map = new kakao.maps.Map(mapContainer, mapOption);

					// 지도에 마커를 생성하고 표시한다
					var marker = new kakao.maps.Marker({
						position : new kakao.maps.LatLng(37.4986813, 127.0318998), // 마커의 좌표
						map : map
					// 마커를 표시할 지도 객체
					});

					// 마커 위에 표시할 인포윈도우를 생성한다
					// var infowindow = new kakao.maps.InfoWindow({
					//	content : '<div style="padding:5px;">아이티윌</div>' // 인포윈도우에 표시할 내용
					// });

					// 인포윈도우를 지도에 표시한다
					infowindow.open(map, marker);

					// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					map.setCenter(cooder);
				</script>
        

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous"></script>
</body>
</html>