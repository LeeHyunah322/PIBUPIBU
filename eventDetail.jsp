<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이벤트 상세 페이지</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            text-align: center;
			background-color :#fff;
        }
        .event-detail-container {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
            border: 1px solid #f5f0e6;
            border-radius: 10px;
        }
		.event-detail-container h2 {
		 color: #1EB980;
		 font-size: 28px;
		 margin-bottom: 20px;
		}
        .event-image {
            width: 100%;
            border-radius: 10px;
        }
        .back-btn {
            margin-top: 20px;
            display: inline-block;
            padding: 10px 20px;
            background: #1EB980;
            color: white;
            border-radius: 5px;
            text-decoration: none;
			transition: background-color 0.3s;
        }
        .back-btn:hover {
            background: #1AA56F;
        }
    </style>
</head>
<body>
<div style="margin-top: 150px;"></div>
<%@ include file="header.jsp" %>

<%
 

    // URL에서 eventId 값 받기
    String eventId = request.getParameter("eventId");
    String eventTitle = "이벤트 상세 정보";
    String eventImage = "images/event" + eventId + "_large.png";
%>

<div class="event-detail-container">
    <h2><%= eventTitle %></h2>
    <img class="event-image" src="<%= eventImage %>" alt="이벤트 상세 이미지">
    <a href="event.jsp" class="back-btn">이벤트 목록으로 돌아가기</a>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
