<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>복합성 피부 결과</title>
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
      border-top: 10px solid #d1a722;
      animation: fadeIn 0.6s ease;
    }
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }
    .card h2 {
      font-size: 35px;
      color: #d1a722;
      margin-bottom: 25px;
    }
    .card p {
      font-size: 22px;
      line-height: 1.8;
      margin-bottom: 24px;
    }
    .highlight { color: #b99a1e; font-weight: bold; }
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
      background-color: #d1a722;
      color: #fff;
      padding: 14px 30px;
      font-size: 20px;
      border-radius: 8px;
      text-decoration: none;
      transition: background 0.3s;
      margin-top: 30px;
    }
    .btn-primary:hover { background-color: #b7901d; }
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
    <h2>밸런스 관리가 중요한 <span class="highlight">복합성 피부</span></h2>
    <p>
  해당 타입은 <span class="highlight">T존은 지성, U존은 건성</span>의 복합적인 특성을 가진 타입이에요.<br>
  부위별로 <span class="highlight">적절한 관리</span>가 필요하고, <span class="highlight">균형 잡힌 루틴</span>이 핵심이에요.<br>
  계절이나 날씨에 따라 유분기와 건조함이 달라질 수 있으니, 계절마다 <span class="highlight">피부 상태를 체크</span>하는 습관도 중요해요.
</p>

    <p><strong>💡 스킨케어 팁:</strong></p>
    <ul class="tip-list">
      <li><span class="highlight">수분 중심 젤 토너</span>로 T존 진정</li>
      <li><span class="highlight">U존은 크림, T존은 가벼운 수분제</span>로 케어하기</li>
      <li><span class="highlight">부분별 마스크팩</span> 활용</li>
      <li><span class="highlight">유수분 밸런스가 좋은 에센스</span> 추천</li>
      <li><span class="highlight">주 1회 각질 제거 & 모공 관리</span> 병행하기</li>
    </ul>
    <div class="btn-group">
      <a class="btn-primary" href="viewProduct.jsp?ctgType=category5">복합성 추천 제품 보기</a>
      <a class="back-link" href="skintype.jsp">← 다시 테스트하기</a>
    </div>
  </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
