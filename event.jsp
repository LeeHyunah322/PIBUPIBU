<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>이벤트 페이지</title>
  <style>
    html {
		overflow-y: scroll;
		overflow-x: hidden;
		width: 100vw;
		background-color: #fff;
    }

    body {
		margin: 0;
		font-family: 'Segoe UI', Tahoma, Geneva, Verdana,	sans-serif;
		background-color: #fff;
    }

    .wrapper {
		text-align: center;
    
    }
	.wave-header {
		background-image: url('images/intro2.png');
		background-repeat: no-repeat;
		background-size: cover;
		background-position: 53% 16px ;
		background-size: 1920px auto; 
		padding: 60px;
		text-align: center;
		color: #1EB980;
	}

    h2 {
		font-size: 32px;
		font-weight: bold;
		color: #1EB980;
		margin-bottom: 40px;
		margin-top: 10px;
    }

    .event-container {
		display: grid;
		grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
		gap: 30px;
		max-width: 1215px;
		margin: auto;
    }

    .event-box {
		position: relative;
		border-radius: 20px;
		overflow: hidden;
		cursor: pointer;
		transition: transform 0.3s ease, box-shadow 0.3s ease;
		box-shadow: 0 8px 16px rgba(0, 0, 0, 0.08);
    }

    .event-box:hover {
		transform: translateY(-5px);
		box-shadow: 0 12px 24px rgba(0, 0, 0, 0.12);
    }

    .event-box::after {
		content: "이벤트 확인하기";
		position: absolute;
		bottom: 0;
		left: 0;
		right: 0;
		background: rgba(0,0,0,0.5);
		color: #fff;
		font-size: 16px;
		padding: 10px;
		text-align: center;
		opacity: 0;
		transition: opacity 0.3s;
    }

    .event-box:hover::after {
		opacity: 1;
    }

    .event-box img {
		width: 100%;
		height: 100%;
		object-fit: cover;
		display: block;
		border-radius: 20px;
    }
	.go-to-skinmatch {
		text-align: center;
		margin-top: 60px;
		border-top: 2px dashed #E0E0E0;
		padding-top: 40px;
	}

	.go-to-skinmatch a {
		display: inline-block;
		background-color: #FFB74D;
		color: #fff;
		padding: 14px 32px;
		border-radius: 30px;
		font-size: 18px;
		font-weight: bold;
		text-decoration: none;
		transition: background-color 0.3s ease, transform 0.2s ease;
		box-shadow: 0 4px 14px rgba(0, 0, 0, 0.12);
	}

	.go-to-skinmatch a:hover {
		background-color: #FB8C00;
		transform: translateY(-2px);
	}
	.go-to-skinmatch p {
		margin-top: 12px;
		font-size: 30px;
		color: #555;
	}
	.go-to-skinmatch strong {
		color: #E65100;
	}


   @media screen and (max-width: 768px) {
  h2 {
    font-size: 22px;
  }

  .wrapper {
    padding: 40px 10px;
  }

  .event-container {
    grid-template-columns: 1fr;
    gap: 20px;
    padding: 0 10px;
  }

  .go-to-skinmatch {
    padding-top: 30px;
    margin-top: 40px;
  }

  .go-to-skinmatch p {
    font-size: 20px;
    padding: 0 15px;
    word-break: keep-all;
  }

  .go-to-skinmatch a {
    padding: 12px 20px;
    font-size: 16px;
    width: 90%;
    max-width: 300px;
    margin: 0 auto;
  }
}

  </style>
</head>
<body>
<div style="margin-top:-15px;"></div>
<%@ include file="header.jsp" %>
<div class="wrapper">
<div class="wave-header">
  <h2>현재 진행중인 이벤트</h2>
  <p style="margin-top: -10px; color: #444; font-size: 16px;">
  지금 참여할 수 있는 이벤트들을 확인해보세요!
</p>
  </div>

  <div class="event-container">
    <a href="eventDetail.jsp?eventId=1" class="event-box">
      <img src="images/event1.png" alt="Event 1">
    </a>
    <a href="eventDetail.jsp?eventId=2" class="event-box">
      <img src="images/event2.png" alt="Event 2">
    </a>
    <a href="eventDetail.jsp?eventId=3" class="event-box">
      <img src="images/event3.png" alt="Event 3">
    </a>
  </div>
<div class="go-to-skinmatch">
  <h2 style="margin-bottom: 20px;">🃏 카드 게임 이벤트</h2>
 <p>카드의 짝을 모두 맞추면 <strong>5% 할인 쿠폰</strong>을 드려요!</p>
  <a href="skinmatch.jsp">🧩 스킨케어제품 짝 맞추기 게임 하러가기</a>
  
</div>


</div>
<div style="margin-bottom: 120px;"></div><%@ include file="footer.jsp" %>
</body>
</html>