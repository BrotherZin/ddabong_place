<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.maint1 {
	border: 1px solid #FF8C00;
	border-radius: 40px !important;
	width: 500px;
	margin-top: 5%;
}

.cname {
	font-size: 3em;
	margin-bottom: 20px;
	margin-left: 40px;
}

.cdate {
	color: red;
}

.timg {
	width: 260px;
	height: 260px;
	margin-left: 20px;
	overflow: hidden;
}

.timg img {
	max-width: 100%;
	max-height: 100%;
}

.cont {
	width: 350px;
	height: 150px;
	margin-left: 50px;
	padding: 0;
}

.cont th {
	margin: 0;
	padding: 0;
}

.btn2 {
	margin-top: 20px;
}

.buttons {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 10px;
}

.buttons input[type="button"] {
	background-color: gray;
	border: none;
	border-radius: 5px;
	color: white;
	padding: 10px 20px;
	cursor: pointer;
	font-weight: bold;
	width: 100px;
	margin-right: 10px;
}

.buttons input[type="button"]:hover {
	background-color: #FF8C00;
}

#map-container {
	text-align: center;
}

#map {
	width: 500px;
	height: 400px;
	display: none;
	margin: 20px auto;
	margin-top: 20px;
}

h2 {
	margin-top: 20px;
	display: none;
}

h5 {
	margin-top: 20px;
	display: none;
}

.horizontal-line {
	border-top: 1px solid #FF8C00;
	margin: 0 auto;
	margin-top: 37px;
	margin-bottom: 50px;
	width: 40%;
}

.div-container {
	margin-top: 40px;
	display: flex;
	width: 90%;
	justify-content: space-evenly;
}

.category {
	margin-top: 70px;
	width: 30%;
	margin-left: 40px;
	text-align: left;
}

.category a {
	line-height: 40px;
	font-size: 20px;
	color: #FFBE1C;
	text-decoration: none;
}

.category a:hover {
	color: #ff8c00;
}

.qna {
	margin-top: 20px;
	text-align: left;
	font-size: 15px;
	width: 85%;
}

.asd {
	text-align: center;
}

.side-map {
	margin-top: 150px;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="div-container">
		<div class="category">
			<h1>예약 / 웨이팅</h1>
			<a href="myStatus?customer_id=${personal.id}">예약 현황</a><br> <a
				href="mywaiting?customer_id=${personal.id}">웨이팅
				현황</a><br>
		</div>

		<div class="qna">
			<div class="flex-container">
				<div class="flex-item">
					<h1 class="asd">예약 현황</h1>
					<div class="horizontal-line"></div>
					<c:forEach items="${ReservationList}" var="dto">
						<div class="flex-container-inner">
							<table class="maint1" align="center">
								<tr>
									<th>
										<div class="timg">
											<img src="/dda/image/${dto.image}" alt="매장 이미지">
										</div>
									</th>
									<th>
										<h1 class="cname">${dto.storename}</h1>
										<table class="cont">
											<tr>
												<c:set var="date" value="${dto.reservation_date}" />
												<th class="cdate">${fn:substring(date,0,10)}·
													${dto.reservation_time} · ${dto.person_num}명</th>
											</tr>
											<tr>
												<th>예약 번호 : [${dto.reservation_num}]번</th>
											</tr>
											<tr>
												<th>예약자명 : ${dto.reservation_name}</th>
											</tr>
											<tr>
												<th>매장 전화번호 : ${dto.tel}</th>
											</tr>
										</table>
									</th>
									<th>
										<div class="buttons">
											<input type="button" value="매장 보기"
												onclick="location.href='detailview?store_id=${dto.store_id}'">
											<input type="button" value="지도 보기" class="btn2"> <input
												type="button" value="예약 취소" class="btn2"
												onclick="location.href='ReservationDelete?reservation_num=${dto.reservation_num}'">
										</div>
									</th>
								</tr>
							</table>
							<div id="map-container">
								<h2>매장 위치</h2>
								<div id="map"
									style="width: 500px; height: 400px; display: none;"></div>
								<h5>상세 주소 : ${dto.address }</h5>
							</div>
							<script type="text/javascript"
								src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8fc3585ad5a21392e7cb628332db3e4c&libraries=services"></script>

							<script>
								var mapVisible = false;
								var map;
								function toggleMap() {
									var mapContainer = document
											.getElementById('map');
									var h2 = document.querySelector('h2');
									var h5 = document.querySelector('h5');
									if (!mapVisible) {
										mapContainer.style.display = 'block';
										h2.style.display = 'block';
										h5.style.display = 'block';
										mapVisible = true;
										initMap();
									} else {
										mapContainer.style.display = 'none';
										h2.style.display = 'none';
										h5.style.display = 'none';
										mapVisible = false;
									}
								}

								var findStoreButton = document
										.querySelector('input.btn2[value="지도 보기"]');
								findStoreButton.addEventListener('click',
										toggleMap);

								var infowindow = new kakao.maps.InfoWindow({
									zIndex : 1
								});

								var mapContainer = document
										.getElementById('map');
								var mapOption = {
									center : new kakao.maps.LatLng(37.566826,
											126.9786567),
									level : 3
								};

								function initMap() {
									map = new kakao.maps.Map(mapContainer,
											mapOption);
									var ps = new kakao.maps.services.Places();

									ps.keywordSearch('${dto.storename}',
											placesSearchCB);
								}

								function placesSearchCB(data, status,
										pagination) {
									if (status === kakao.maps.services.Status.OK) {
										var bounds = new kakao.maps.LatLngBounds();

										for (var i = 0; i < data.length; i++) {
											displayMarker(data[i]);
											bounds
													.extend(new kakao.maps.LatLng(
															data[i].y,
															data[i].x));
										}

										map.setBounds(bounds);
									}
								}

								function displayMarker(place) {
									var marker = new kakao.maps.Marker({
										map : map,
										position : new kakao.maps.LatLng(
												place.y, place.x)
									});

									kakao.maps.event
											.addListener(
													marker,
													'click',
													function() {
														infowindow
																.setContent('<div style="padding:5px;font-size:12px;">'
																		+ place.place_name
																		+ '</div>');
														infowindow.open(map,
																marker);
													});
								}

								initMap();
							</script>
						</div>
					</c:forEach>

				</div>

			</div>
		</div>
		<c:forEach items="${ReservationList2}" var="dto2">
			<div class="side-map"></div>
		</c:forEach>
	</div>
</body>
</html>
