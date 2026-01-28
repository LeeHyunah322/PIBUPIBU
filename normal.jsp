<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>중성 피부 결과</title>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #fff;
      color: #333;
    }
    .container {
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 120px 20px 60px;
    }
    .card {
      background: white;
      border-radius: 20px;
      max-width: 1200px;
      width: 100%;
      padding: 50px 40px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
      border-top: 10px solid #b17d41;
      animation: fadeIn 0.6s ease;
    }
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }
    .card h2 {
      font-size: 35px;
      color: #b17d41;
      margin-bottom: 25px;
    }
    .card p {
      font-size: 22px;
      line-height: 1.8;
      margin-bottom: 24px;
    }
    .highlight { color: #a66a2c; font-weight: bold; }
    .tip-list {
      text-align: left;
      padding-left: 0;
      margin-top: 20px;
    }
    .tip-list li {
      font-size: 20px;
      list-style: none;
      margin-bottom: 12px;
      padding-left: 34px;
      position: relative;
    }
    .tip-list li::before {
      content: '✔️';
      position: absolute;
      left: 0;
      top: 0;
    }
    .btn-primary {
      background-color: #b17d41;
      color: #fff;
      padding: 14px 30px;
      font-size: 20px;
      border-radius: 8px;
      text-decoration: none;
      transition: background 0.3s;
      margin-top: 30px;
    }
    .btn-primary:hover { background-color: #935f2d; }
    .back-link {
      display: block;
      margin-top: 15px;
      font-size: 20px;
      color: #777;
      text-decoration: none;
    }
    .back-link:hover { text-decoration: underline; }
    .btn-group {
      display: flex;
      flex-direction: column;
      align-items: center;
      margin-top: 30px;
    }
		
@media screen and (max-width: 1024px) {
  .banner {
    height: 400px;
  }
  .banner img {
    height: 400px;
  }
  .intro-title {
    font-size: 36px;
  }
  .feature-title-inside {
    font-size: 40px;
  }
  .product-list {
    gap: 24px;
  }
  .product-list a {
    min-width: 160px;
    max-width: 180px;
  }
}

@media screen and (max-width: 768px) {
  .banner {
    height: 280px;
  }
  .banner img {
    height: 280px;
  }
  .skin-test a {
    padding: 12px 20px;
    font-size: 14px;
  }
  .links {
    flex-wrap: wrap;
    justify-content: center;
    gap: 10px;
  }
  .recommend h3,
  .feature-title-inside {
    font-size: 32px;
  }
  .product-list {
    height: auto;
    flex-wrap: nowrap;
    justify-content: flex-start;
    overflow-x: auto;
    padding-bottom: 20px;
  }
  .product-list a {
    min-width: 180px;
    max-width: 200px;
  }
  .feature-section {
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: center;
    padding: 40px 16px;
  }
  .feature-left {
    padding: 20px;
  }
  .feature-right {
    max-width: 520px;
  }
  .mini-product {
    flex-direction: row;
    align-items: flex-start;
    text-align: left;
  }
  .mini-product img {
    width: 160px;
    height: 160px;
  }
  .intro-title {
    font-size: 26px;
  }
  .intro-description,
  .card-text,
  .mini-product p,
  .mini-product small {
    font-size: 15px;
  }
  .container {
    padding: 80px 16px 40px;
  }
  .card {
    padding: 40px 24px;
  }
  .card h2 {
    font-size: 28px;
  }
  .card p,
  .tip-list li,
  .btn-primary,
  .back-link {
    font-size: 16px;
  }
  .btn-group {
    flex-direction: row;
    gap: 16px;
  }
}

@media screen and (max-width: 480px) {
  .wrapper {
    padding: 0 10px;
  }
  .product-list a {
    min-width: 180px;
    max-width: 200px;
  }
  .feature-title-inside {
    font-size: 28px;
  }
  .intro-cards {
    grid-template-columns: repeat(auto-fit, minmax(230px, 1fr));
  }
  .info-card {
    padding: 16px;
  }
  .container {
    padding: 60px 10px 30px;
  }
  .btn-group {
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: center;
    gap: 10px;
  }
}
</style>

  </style>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container">
  <div class="card">
    <h2>균형 잡힌 이상적인 <span class="highlight">중성 피부</span></h2>
    <p>
      해당 타입은 <span class="highlight">유분과 수분의 균형</span>이 잘 맞는 타입이에요.<br>
      특별한 트러블 없이 <span class="highlight">촉촉하고 매끄러운 피부결</span>을 가지고 있을 가능성이 높아요.<br>
      단, <span class="highlight">스트레스, 계절 변화</span> 등 외부 요인에 따라 컨디션이 달라질 수 있어요.
    </p>
    <p><strong>💡 스킨케어 팁:</strong></p>
    <ul class="tip-list">
      <li><span class="highlight">저자극 클렌저</span>로 유수분 밸런스 유지하기</li>
      <li><span class="highlight">토너 → 세럼 → 수분크림</span> 기본 루틴 유지하기</li>
      <li><span class="highlight">계절에 따라 보습제 농도 조절</span></li>
      <li><span class="highlight">주 1회 수분 or 진정 팩</span>으로 피부 컨디션 관리하기</li>
      <li><span class="highlight">자외선 차단제</span>는 SPF30 이상 추천</li>
	  <li><span class="highlight">기본에 충실한 심플한 루틴</span>이 가장 중요해요</li>
    </ul>
    <div class="btn-group">
      <a class="btn-primary" href="viewProduct.jsp?ctgType=category3">중성 추천 제품 보기</a>
      <a class="back-link" href="skintype.jsp">← 다시 테스트하기</a>
    </div>
  </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
