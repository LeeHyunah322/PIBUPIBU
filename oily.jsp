<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>지성 피부 결과</title>
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
      border-top: 10px solid #3cc6d6;
      animation: fadeIn 0.6s ease;
      margin: 0 auto;
    }
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }
    .card h2 {
      font-size: 35px;
      color: #3cc6d6;
      margin-bottom: 25px;
    }
    .card p {
      font-size: 22px;
      line-height: 1.8;
      margin-bottom: 24px;
    }
    .highlight {
      color: #2da1b0;
      font-weight: bold;
    }
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
      background-color: #3cc6d6;
      color: #fff;
      padding: 14px 30px;
      font-size: 20px;
      border-radius: 8px;
      text-decoration: none;
      transition: background 0.3s;
      margin-top: 30px;
    }
    .btn-primary:hover { background-color: #2da1b0; }
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
    <h2>유분 분비가 활발한 <span class="highlight">지성 피부</span></h2>
    <p>
      해당 타입은 <span class="highlight">피지 분비량이 많고</span>, 얼굴이 자주 <span class="highlight">번들거리거나 모공이 넓어지는</span> 경향이 있어요.<br>
      특히 이마, 코, 턱(T존) 부위에 <span class="highlight">유분감이 집중되고</span>, <span class="highlight">블랙헤드나 트러블</span>이 생기기 쉬운 타입이에요.<br>
      적절한 세안과 보습, 유분 관리만 잘해줘도 <span class="highlight">맑고 건강한 피부</span>를 유지할 수 있어요.
    </p>
    <p><strong>💡 스킨케어 팁:</strong></p>
    <ul class="tip-list">
      <li><span class="highlight">하루 2회 세안</span> – 과도한 세안은 유분을 더 자극할 수 있어요</li>
      <li><span class="highlight">살리실산, 나이아신아마이드</span> 성분이 함유된 토너 사용하기</li>
      <li><span class="highlight">가벼운 수분 젤 크림</span>으로 유수분 밸런스 유지하기</li>
      <li><span class="highlight">각질 제거</span>는 주 1~2회, 과도한 스크럽은 피하기</li>
      <li><span class="highlight">자외선 차단제</span>는 필수! 유분감 적은 무기자차 추천</li>
    </ul>
    <div class="btn-group">
      <a class="btn-primary" href="viewProduct.jsp?ctgType=category2">지성 추천 제품 보기</a>
      <a class="back-link" href="skintype.jsp">← 다시 테스트하기</a>
    </div>
  </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
