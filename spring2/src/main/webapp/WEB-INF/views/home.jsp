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
    top: 200px;
    left: 10px;
    width: 210px;
    height: 800px;
    background: #FAFAFBFF; /* neutral-100 */
    border-radius: 0px;
    border-width: 1px;
    border-color: #FFFFFFFF; /* white */
    border-style: solid;
}

.main {
    padding: 10px;
    /*
    margin-left: 210px;
    margin-right: 210px;
    */
    margin: 200px 200px; /* top & bottom: 0px, right & left: 210px */
    /* top -> right -> bottom -> left */
}

#map {
    width: 80%;
    height: 500px;
    margin-top: 300px; /* Adjust as needed */
    margin-left: 300px;
    padding: 20px;
}

.wrapper {
    position: relative; /* 요소들을 배치하는 위치 */
    overflow: auto;
}

.card-head {
    padding: 10px;
    /*
    margin-left: 210px;
    margin-right: 210px;
    */
    margin: 100px 300px; /* top & bottom: 0px, right & left: 210px */
    /* top -> right -> bottom -> left */
}

.card-body {
    padding: 10px;
    /*
    margin-left: 210px;
    margin-right: 210px;
    */
    margin: 100px 300px; /* top & bottom: 0px, right & left: 210px */
    /* top -> right -> bottom -> left */
}

body {
    /* font: font-로 시작하는 속성들을 설정할 수 있는 속성
      font-size, font-family 등등을 한꺼번에 설정할 수 있음 */
    font: 100% Sans-serif;
    margin: 20px;
    line-height: 26px; /* 줄간격 */
}
</style>
    
</head>
<body>
   
    <!-- Topbar -->
    <div class="topbar">
        <c:set var="pageTitle" value="Home" scope="page" />
        <%@ include file="./fragments/header.jspf" %>
    </div>

    <div class="wrapper">
        <!-- Sidebar -->
        <div class="sidebar">
            <h2>소개</h2>
            <ul class="nav flex-column">
                <li class="nav-item"><a class="nav-link active"
                    href="#">갬핑장 소개</a></li>
                <li class="nav-item"><a class="nav-link" href="#">시설
                        배치도</a></li>
                <li class="nav-item"><a class="nav-link" href="#">편의
                        시설</a></li>
                <li class="nav-item"><a class="nav-link" href="#">주변
                        볼거리</a></li>
                <li class="nav-item"><a class="nav-link" href="#5">캠핑장
                        위치</a></li>
            </ul>
        </div>

        <div class="container-fluid">
            <div class="card-head">
                <h1>캠핑장 위치</h1>
            </div>
        </div>

        <div class="container-fluid">
            <div id="map"></div>
        </div>

        <div class="container-fluid">
            <div class="card-body">
                <h2>
                    <span>주소</span>
                </h2>
                <h4>서울특별시 강남구 테헤란로 124( 역삼동,삼원타워 ) 4층</h4>
                <br />
                <h2>오시는 방법</h2>
                <h5>차로 오세요</h5>
                <br />
                <h2>주차 방법</h2>
            </div>
        </div>
    </div>


    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c5f576fbc4bf2a712d8f138a0b208af6"></script>
    <script>
                    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                    mapOption = {
                        center : new kakao.maps.LatLng(37.698868, 127.957925), // 지도의 중심좌표
                        level : 3
                    // 지도의 확대 레벨
                    };

                    // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
                    var map = new kakao.maps.Map(mapContainer, mapOption);

                    // 지도에 마커를 생성하고 표시한다
                    var marker = new kakao.maps.Marker({
                        position : new kakao.maps.LatLng(37.698868, 127.957925), // 마커의 좌표
                        map : map
                    // 마커를 표시할 지도 객체
                    });

                    // 마커 위에 표시할 인포윈도우를 생성한다
                    // var infowindow = new kakao.maps.InfoWindow({
                    //  content : '<div style="padding:5px;">아이티윌</div>' // 인포윈도우에 표시할 내용
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