<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>근처 피부과 찾기</title>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCrd9KGSiNOkWMj-LR4ABFIeU9ClG3wTGA&libraries=places&language=ko&region=KR"></script>
    <style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    body {
        background-color: #fff;
        color: #333;
        line-height: 1.6;
    }
    
    .container {
        width: 90%;
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px 0;
		font-family: 'Noto Sans KR', sans-serif;
		margin-top:-40px;
    }
    
    .page-header {
        text-align: center;
        margin-bottom: 40px;
    }
    
   .wave-header {
  background-image: url('images/intro2.png');
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center bottom;
  background-size: 1920px auto; 
  padding: 49px 0;
  text-align: center;
  color: #1EB980;
}

.wave-header h1 {
  font-size: 36px;
  margin-bottom: 10px;
  margin-top: 0;
}

    #map {
        height: 500px;
        width: 100%;
        margin: 30px 0;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        border: 1px solid #E8F5E9;
    }
    
    .search-box {
        display: flex;
        justify-content: center;
        gap: 10px;
        margin: 30px 0;
    }
    
    #location-input {
        width: 400px;
        padding: 12px 15px;
        font-size: 16px;
        border: 1px solid #E8F5E9;
        border-radius: 4px;
        outline: none;
        transition: border 0.3s;
    }
    
    #location-input:focus {
        border-color: #1AA56F;
    }
                                                                   
    #search-button {
        padding: 12px 24px;
        font-size: 16px;
        background: #E8F5E9;
        color: #555;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background 0.3s;
    }
    
    #search-button:hover {
        background: #97B89D;
		color: #2E7D32;
    }
    
    #results-container {
        width: 100%;
        margin: 30px 0;
        background: #FFF;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        padding: 20px;
    }
    
    .results-header {
        font-size: 20px;
        color: #1AA56F;
        margin-bottom: 20px;
        padding-bottom: 10px;
        border-bottom: 1px solid #E8F5E9;
    }
    
    .clinic-item {
        padding: 20px;
        margin: 15px 0;
        background: #FFF;
        border-radius: 4px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        border-left: 3px solid #E8F5E9;
        transition: all 0.3s;
    }
    
    .clinic-item:hover {
        border-left-color: #1AA56F;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }
    
    .clinic-name {
        font-size: 18px;
        font-weight: 500;
        color: #333;
        margin-bottom: 5px;
    }
    
    .clinic-address {
        color: #666;
        margin-bottom: 8px;
    }
    
    .clinic-distance {
        color: #1AA56F;
        font-weight: 500;
        margin-bottom: 8px;
    }
    
    .clinic-phone {
        color: #666;
        margin-bottom: 5px;
    }
    
    .clinic-website a {
        color: #1AA56F;
        text-decoration: none;
    }
    
    .clinic-website a:hover {
        text-decoration: underline;
    }
    
    .loading {
        text-align: center;
        padding: 30px;
        color: #1AA56F;
        font-weight: 500;
    }
    
    .error-message {
        text-align: center;
        padding: 30px;
        color: #F44336;
        font-weight: 500;
    }
    
    .info-window {
        font-family: 'Noto Sans KR', sans-serif;
        padding: 10px;
    }
    
    .info-window h4 {
        color: #1AA56F;
        margin-bottom: 5px;
    }
    
    .info-window p {
        margin-bottom: 3px;
        font-size: 14px;
    }
	@media screen and (max-width: 768px) {
	.wave-header{
	margin-top:150px;
	}
	
  .wave-header h1 {
    font-size: 24px;
  }

  .wave-header p {
    font-size: 14px;
    padding: 0 10px;
  }

  .search-box {
    flex-direction: column;
    align-items: center;
    gap: 15px;
  }

  #location-input {
    width: 90%;
    font-size: 15px;
  }

  #search-button {
    width: 90%;
    font-size: 15px;
  }

  .clinic-item {
    padding: 15px;
  }

  .clinic-name {
    font-size: 16px;
  }

  .clinic-address,
  .clinic-distance,
  .clinic-phone {
    font-size: 14px;
  }

  #map {
    height: 300px;
  }
}

    </style>

    <script>
        var map;
        var infowindow;
        var markers = [];
        var userMarker;
        var userLatLng;

        function initMap() {
            var defaultLocation = { lat: 37.5665, lng: 126.9780 };
            map = new google.maps.Map(document.getElementById('map'), {
                center: defaultLocation,
                zoom: 12,
                styles: [
                    {
                        "featureType": "poi.medical",
                        "elementType": "labels.icon",
                        "stylers": [
                            {
                                "color": "#4CAF50"
                            }
                        ]
                    }
                ]
            });
            
            infowindow = new google.maps.InfoWindow();
            
            document.getElementById('search-button').addEventListener('click', function() {
                var locationInput = document.getElementById('location-input').value.trim();
                if (locationInput) {
                    searchNearbyDermatologists(locationInput);
                } else {
                    alert("위치를 입력해주세요.");
                }
            });
        }

        function searchNearbyDermatologists(location) {
            clearMarkers();
            clearResults();
            
            // 로딩 표시
            var container = document.getElementById('results-container');
            container.innerHTML = "<div class='loading'>근처 피부과를 검색 중입니다...</div>";
            
            var geocoder = new google.maps.Geocoder();
            geocoder.geocode({ 
                address: location,
                region: 'kr'
            }, function(results, status) {
                if (status === google.maps.GeocoderStatus.OK && results[0]) {
                    userLatLng = results[0].geometry.location;
                    
                    // 사용자 위치 마커
                    userMarker = new google.maps.Marker({
                        map: map,
                        position: userLatLng,
                        icon: {
                            url: "https://maps.google.com/mapfiles/ms/icons/blue-dot.png",
                            scaledSize: new google.maps.Size(32, 32)
                        },
                        title: "내 위치: " + location
                    });
                    map.setCenter(userLatLng);
                    
                    // 피부과 검색
                    var service = new google.maps.places.PlacesService(map);
                    service.nearbySearch({
                        location: userLatLng,
                        radius: 1500,
                        keyword: '피부과',
                        type: 'doctor'
                    }, function(places, status) {
                        if (status === google.maps.places.PlacesServiceStatus.OK && places.length > 0) {
                            var filteredPlaces = places.filter(function(place) {
                                return place.name && place.name.includes('피부과');
                            });
                            
                            if (filteredPlaces.length === 0) {
                                displayNoResults("검색 지역에 피부과가 없습니다. 더 넓은 범위로 검색해 보세요.");
                                return;
                            }
                            
                            filteredPlaces.forEach(function(place) {
                                if (place.geometry && place.geometry.location) {
                                    place.distance = calculateDistance(
                                        userLatLng.lat(), 
                                        userLatLng.lng(),
                                        place.geometry.location.lat(),
                                        place.geometry.location.lng()
                                    );
                                } else {
                                    place.distance = Infinity;
                                }
                            });
                            
                            filteredPlaces.sort(function(a, b) {
                                return a.distance - b.distance;
                            });
                            
                            displayResults(filteredPlaces);
                            updateMapWithPlaces(filteredPlaces);
                            
                        } else {
                            displayNoResults("근처 피부과를 찾을 수 없습니다. 다른 지역으로 검색해 보세요.");
                        }
                    });
                } else {
                    displayNoResults("입력한 위치를 찾을 수 없습니다. 정확한 주소 또는 지역명을 입력해주세요.");
                }
            });
        }

        function updateMapWithPlaces(places) {
            var bounds = new google.maps.LatLngBounds();
            bounds.extend(userLatLng);
            
            places.forEach(function(place) {
                if (place.geometry && place.geometry.location) {
                    createClinicMarker(place);
                    bounds.extend(place.geometry.location);
                }
            });
            
            if (places.length > 0) {
                map.fitBounds(bounds);
                if (map.getZoom() > 15) {
                    map.setZoom(15);
                }
            }
        }

        function calculateDistance(lat1, lon1, lat2, lon2) {
            if (!lat1 || !lon1 || !lat2 || !lon2) return Infinity;
            
            const R = 6371e3;
            const φ1 = lat1 * Math.PI/180;
            const φ2 = lat2 * Math.PI/180;
            const Δφ = (lat2-lat1) * Math.PI/180;
            const Δλ = (lon2-lon1) * Math.PI/180;

            const a = Math.sin(Δφ/2) * Math.sin(Δφ/2) +
                      Math.cos(φ1) * Math.cos(φ2) *
                      Math.sin(Δλ/2) * Math.sin(Δλ/2);
            const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));

            return Math.round(R * c);
        }

        function createClinicMarker(place) {
            if (!place.geometry || !place.geometry.location) return;
            
            var marker = new google.maps.Marker({
                map: map,
                position: place.geometry.location,
                icon: {
                    url: "https://maps.google.com/mapfiles/ms/icons/red-dot.png",
                    scaledSize: new google.maps.Size(32, 32)
                },
                title: place.name
            });
            
            google.maps.event.addListener(marker, 'click', function() {
                var content = '<div class="info-window">' +
                             '<h4>' + place.name + '</h4>' +
                             '<p>' + (place.vicinity || '주소 정보 없음') + '</p>';
                if (place.distance) {
                    content += '<p>거리: ' + place.distance + 'm</p>';
                }
                content += '</div>';
                infowindow.setContent(content);
                infowindow.open(map, marker);
            });
            
            markers.push(marker);
        }

        function displayResults(places) {
            var container = document.getElementById('results-container');
            container.innerHTML = '<div class="results-header">검색 결과 (' + places.length + '개)</div>';
            
            places.forEach(function(place) {
                var service = new google.maps.places.PlacesService(map);
                service.getDetails({
                    placeId: place.place_id,
                    fields: ['formatted_phone_number', 'website']
                }, function(details, status) {
                    var phoneHtml = details && details.formatted_phone_number ? 
                        '<div class="clinic-phone">전화: ' + details.formatted_phone_number + '</div>' : 
                        '';
                    
                    var websiteHtml = details && details.website ? 
                        '<div class="clinic-website"><a href="' + details.website + '" target="_blank">웹사이트 방문</a></div>' : 
                        '';
                    
                    var item = document.createElement('div');
                    item.className = 'clinic-item';
                    item.innerHTML = '<div class="clinic-name">' + place.name + '</div>' +
                                    '<div class="clinic-address">' + (place.vicinity || '주소 정보 없음') + '</div>' +
                                    (place.distance ? '<div class="clinic-distance">거리: ' + place.distance + 'm</div>' : '') +
                                    phoneHtml +
                                    websiteHtml;
                    container.appendChild(item);
                });
            });
        }

        function displayNoResults(message) {
            var container = document.getElementById('results-container');
            container.innerHTML = '<div class="error-message">' + (message || "검색 결과가 없습니다.") + '</div>';
        }

        function clearMarkers() {
            markers.forEach(function(marker) {
                marker.setMap(null);
            });
            markers = [];
            if (userMarker) userMarker.setMap(null);
        }

        function clearResults() {
            document.getElementById('results-container').innerHTML = "";
        }
    </script>
</head>
<body onload="initMap()">
<div style="margin-top: 100px;"></div>
<%@ include file="header.jsp" %>
<div class="wave-header">
        <h1>근처 피부과 찾기</h1>
        <p style="color: #444;">가까운 피부과 전문의를 찾아보세요.</p>
    </div>
<div class="container">
    <div class="search-box">
        <input type="text" id="location-input" placeholder="예) 서울 강남구, 부산 해운대구">
        <button id="search-button">검색</button>
    </div>
    
    <div id="map"></div>
    <div id="results-container"></div>
</div>

<div style="margin-bottom: 200px;"></div>
<%@ include file="footer.jsp" %>
</body>
</html>