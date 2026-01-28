<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <title>PIBUPIBU</title>
    <style>
      

.wrapper {
  margin: 0;
  padding: 0;
  width: 100%;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  text-align: center;
  background-color: #fff;
  overflow-x: hidden;
}

.banner {
  width: 100%;
  height: 600px;
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  overflow: hidden;
}

.banner img {
  width: 100%;
  height: 600px;
  object-fit: cover;
  position: absolute;
  top: 0;
  left: 0;
  opacity: 0;
  transition: opacity 1s ease-in-out;
}

.banner img.active {
  opacity: 1;
}

.banner a {
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0;
  left: 0;
  display: block;
  z-index: 10;
}
.banner-btn {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  background: rgba(255, 255, 255, 0.3);
  border: none;
  font-size: 36px;
  color: #1EB980;
  cursor: pointer;
  padding: 10px;
  z-index: 20;
  border-radius: 50%;
  transition: background 0.3s;
}

.banner-btn:hover {
  background: rgba(255, 255, 255, 2.0);
  color: #3CA6F5;
}

.banner-btn.prev {
  left: 20px;
}

.banner-btn.next {
  right: 20px;
}
.banner-btn i {
  font-size: 28px;
}

.skin-test {
  margin: 30px;
}

.skin-test a {
  white-space: nowrap;
  display: inline-block;
  background-color: #1EB980;
  color: white;
  padding: 15px 30px;
  border-radius: 20px;
  font-size: 15px;
  font-weight: bold;
  text-decoration: none;
  transition: background-color 0.3s;
}

.skin-test a:hover {
  background-color: #88D1FF;
}

section {
  padding: 60px 20px;
  font-family: 'Noto Sans KR', sans-serif;
}

.links-info {
  background-color: #fff;
  padding: 46px 20px;
  color: #1EB980;
  text-align: center;
}

.links-info h2 {
  font-size: 28px;
  font-weight: bold;
  margin-bottom: 16px;
}

.links-info p {
  font-size: 17px;
  color: #444;
  line-height: 1.7;
}

.links {
  margin: 20px auto;
  padding: 10px;
  background-color: #ffffff;
  box-shadow: 0px 2px 8px rgba(0,0,0,0.1);
  border-radius: 8px;
  max-width: 800px;
  display: flex;
  justify-content: space-around;
}

.links a {
  text-decoration: none;
  color: #1EB980;
  font-size: 16px;
  font-weight: bold;
  padding: 8px 12px;
  transition: color 0.3s;
}

.links a:hover {
  color: #88D1FF;
}

.best-filter {
  margin-bottom: 50px;
  
}

.best-filter button {
  background-color: white;
  color: #1EB980;
  border: 1px solid #1EB980;
  border-radius: 20px;
  padding: 10px 18px;
  font-size: 16px;
  margin: 0 6px;
  cursor: pointer;
  transition: all 0.3s;
}

.best-filter button.active,
.best-filter button:hover {
  background-color: #1EB980;
  color: white;
}

.product-list .price {
  color: #1EB980;
  font-weight: bold;
  font-size: 30px;
}

.recommend {
  text-align: center;
  background-image: url('images/recommend.png');
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
  padding-bottom: 200px;
}

.recommend h3 {
  font-size: 60px;
  color: #1EB980;
  margin-bottom: 80px;
  letter-spacing: 2px;
}

.product-list {
  width: 100%;
  height: 360px;
  max-width: 100%;
  display: flex;
  justify-content: center;
  gap: 40px;
  flex-wrap: nowrap;
  overflow-x: auto;
  overflow-y: hidden;
  padding-bottom: 40px;
}

.product-list::-webkit-scrollbar {
  height: 10px;
}

.product-list::-webkit-scrollbar-track {
  background: transparent;
  border-radius: 10px;
  margin-left: 100px;
  margin-right: 100px;
  
}

.product-list::-webkit-scrollbar-thumb {
  background: linear-gradient(45deg, #1EB980, #3CA6F5);
  border-radius: 10px;
  box-shadow: inset 0 0 5px rgba(0,0,0,0.2);
}




.product-list a {
  text-decoration: none;
  color: #333;
  min-width: 190px;
  max-width: 210px;
  flex-shrink: 0;
  transition: transform 0.3s;
}

.product-list img {
  width: 100%;
  height: auto;
  border-radius: 14px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.12);
}

.product-list a:hover {
  transform: translateY(-6px);
}

.product-list p {
  margin-top: 12px;
  font-size: 17px;
  font-weight: 500;
  color: #333;
}

/* ------------------ [3] 추천 제품 상세 섹션------------------ */
.feature-title-inside {
  width: 100%;
  text-align: center;
  font-size: 60px;
  color: #1EB980;
  font-weight: bold;
  margin-bottom: 20px;
 }
.feature-section {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 60px;
  background-color: #fff;
  background-image: url('images/recommend.png');
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
  padding: 70px 20px;
  text-align: center;
}
.feature-description-wrapper {
  width: 100%;
  flex-basis: 100%;
}
.choice-description {
  font-size: 20px;
  color: #444;
  line-height: 1.7;
  margin-top:-40px;
}
.best-description{
  font-size: 20px;
  color: #444;
  line-height: 1.7;
  margin-top:-50px;
}
.feature-left {
padding-left: 0px;
margin-right:140px;
  max-width: 400px;
  text-align: center;
  margin-top: 0px;
}
.feature-left img {
  width: 100%;
  border-radius: 14px;
  box-shadow: 0 2px 12px rgba(0,0,0,0.15);
  margin-top: 0px; 
}
.label-ribbon {
  display: inline-block;
  position: relative;
  background: #1AA56F;
  color: #fff;
  font-weight: bold;
  font-size:24px;
  padding: 8px 16px;
  margin-top: 15px;
  border-radius: 4px;
  box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease;
}
.label-ribbon:hover {
  transform: translateY(-4px);
}
.label-ribbon::after {
  content: "";
  position: absolute;
  left: 50%;
  bottom: -10px;
  transform: translateX(-50%);
  width: 0;
  height: 0;
  border-left: 8px solid transparent;
  border-right: 8px solid transparent;
  border-top: 10px solid #1AA56F;
}

.feature-left h2 {
  margin-top: 20px;
  font-size: 20px;
  font-weight: bold;
  color: #1EB980;
  white-space: nowrap;
  text-decoration: none;
  color: inherit;
}

.feature-left p {
  font-size: 18px;
  color: #4A90E2;
  margin-top: -10px;
  text-decoration: none;
}

.feature-left a h2 {
  margin-top:-5px;
  color: #50C878;
}

.feature-right .mini-product:nth-child(1) p {
  margin-top:-10px;
  color: #4A90E2;
}

.feature-right .mini-product:nth-child(2) p {
  margin-top:-10px;
  color: #4A90E2;
}

.feature-right {
  display: flex;
  flex-direction: column;
  gap: 30px;
  max-width: 520px;
}

.mini-product {
  display: flex;
  gap: 20px;
  align-items: flex-start;
  padding-bottom: -10px;
}

.mini-product img {
  width: 250px;
  height: 250px;
  object-fit: cover;
  border-radius: 12px;
  box-shadow: 0 2px 12px rgba(0,0,0,0.15);
}


.mini-product p {
  font-size: 20px;
  font-weight: bold;
  color: #1EB980;
  margin-bottom: 4px;
}

.mini-product small {
  font-size: 18px;
  color: #3CA6F5;
}
.feature-left a, .feature-right a,
.feature-left a *, .feature-right a * {
  text-decoration: none;
  color: inherit;
}

.hash-tag {
  display: block;
  font-size: 18px;
  font-weight: bold;
  color: #444 !important;
  line-height: 1.6;
  margin-bottom: 8px;
  word-break: keep-all;
}

.links-info {
  color: #1EB980;
  text-align: center;
  font-family: 'Noto Sans KR', sans-serif;
}

.links-info h2 {
  font-size: 30px;
  font-weight: bold;
  margin-bottom: 12px;
}

.links-info p {
  font-size: 20px;
  color: #555;
  line-height: 1.6;
}
.links-images {
  display: flex;
  justify-content: center;
  gap: 60px;
  flex-wrap: wrap;
  margin-left:-10px;
  margin-bottom: 20px;
}
.links-images img {
  width: 100px;
  height: auto;
}

.slide-up {
    opacity: 0;
    transform: translateY(40px);
    transition: all 0.6s ease-out;
  }

  .slide-up.visible {
    opacity: 1;
    transform: translateY(0);
  }
  .intro-section {
  background-image: url('images/intro.png'); 
  background-size: cover; 
  background-position: center; 
  background-repeat: no-repeat;
  padding: 60px 40px;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.intro-container {
  max-width: 1000px;
  margin: auto;
  text-align: center;
}

.intro-title {
  font-size: 50px;
  color: #1EB980;
  margin-bottom: 20px;
  font-weight: bold;
}

.intro-description {
  font-size: 20px;
  color: #444;
  line-height: 1.6;
  padding-top : -40px;
  padding-bottom : 20px;
}

.intro-cards {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(230px, 1fr));
  gap: 24px;
  margin-top: 40px;
}

.info-card {
  background: #fff;
  border-radius: 12px;
  padding: 20px;
  box-shadow: 0 5px 15px rgba(0,0,0,0.1);
	  border: 1px solid #cde5d1;
  text-align: left;
}

.card-title {
  color: #3CA6F5;
  font-size: 20px;
  margin-bottom: 10px;
}

.card-text {
  font-size: 17px;
  color: #555;
  line-height: 1.6;
}
.card-image {
  margin-top: 16px;
  width: 100%;
  border-radius: 10px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}
@media screen and (max-width: 768px) {
.wrapper{
margin-top:-50px;
}
  
  .banner {
    height: 280px;
  }
  .banner img {
	margin-top:100px;
    height: 180px;
    object-fit: cover;
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

  .links-info h2 {
    font-size: 24px;
  }

  .links-info p {
    font-size: 16px;
  }
	.links-images img {
  width: 30px;
  height: auto;
}
  .best-filter {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 10px;
  }

  .best-filter button {
    font-size: 14px;
    padding: 8px 16px;
  }

  
  .product-list {
    height: auto;
    padding-bottom: 20px;
    flex-wrap: nowrap;
    justify-content: flex-start;
    overflow-x: auto;
	
  }

  .product-list a {
    min-width: 160px;
    max-width: 180px;
  }

  .product-list p {
    font-size: 14px;
  }

  .product-list .price {
    font-size: 16px;
  }

  
  .recommend h3,
  .feature-title-inside {
    font-size: 32px;
  }

  .feature-section {
    flex-direction: column;
    padding: 40px 16px;
    gap: 40px;
  }

  .feature-left {
    padding: 0;
    max-width: 100%;
  }

  .feature-left img {
    margin: 0 auto;
    width: 80%;
  }

  .feature-left p {
    font-size: 16px;
  }

  .feature-right {
    max-width: 100%;
  }

  .mini-product {
    flex-direction: column;
    align-items: center;
    text-align: center;
  }

  .mini-product img {
    width: 200px;
    height: 200px;
  }

  .mini-product p,
  .mini-product small {
    font-size: 15px;
  }

  /* 인트로 섹션 */
  .intro-title {
    font-size: 26px;
  }

  .intro-description {
    font-size: 16px;
  }

  .info-card {
    padding: 16px;
  }

  .card-title {
    font-size: 18px;
  }

  .card-text {
    font-size: 14px;
  }
}



</style>
   
</head>
<body>
<%@ include file="header.jsp" %></div>

<div class="wrapper">
    <div class="banner">
        <a id="bannerLink" href="skintype.jsp" target="_blank">
            <img src="images/mainbanner1.png" class="active">
            <img src="images/mainbanner2.jpg">
            <img src="images/mainbanner3.png">
        </a>
		<button class="banner-btn prev" onclick="prevBanner()"><i class="fas fa-chevron-left"></i></button>
<button class="banner-btn next" onclick="nextBanner()"><i class="fas fa-chevron-right"></i></button>

    </div>
	<section class="intro-section">
  <div class="intro-container">
    <h1 class="intro-title">20, 30대 남성 스킨케어 어렵지 않아요</h1><br><br>
    <p class="intro-description">
      피부는 첫인상의 핵심이에요. 건성, 지성, 중성, 민감성, 복합성 내 피부의 맞는 타입을 찾는 게 중요하죠.<br>
      PIBUPIBU는 피부 타입 진단부터 추천 제품, 사용법까지 초보자도 쉽게 따라할 수 있도록 도와드립니다.
    </p>

    <div class="intro-cards">
      <div class="info-card slide-up" data-index="0">
        <h3 class="card-title">스킨케어 4단계 요약</h3>
        <p class="card-text">
          ① 클렌징폼으로 깨끗하게 세안<br>
          ② 토너로 피부결 정돈<br>
          ③ 세럼으로 가볍게 영양 공급<br>
          ④ 크림으로 수분과 탄력 잠금
        </p>
		<img src="images/step_guide.png" alt="스킨케어 단계 이미지" class="card-image">
      </div>

      <div class="info-card slide-up" data-index="1">
        <h3 class="card-title">피부타입에 맞는 팁</h3>
        <p class="card-text">
          ● 건성: 보습과 영양 집중<br>
          ● 지성: 유분 조절, 산뜻한 사용감<br>
          ● 중성: 밸런스 유지가 핵심<br>
          ● 민감성: 자극 적은 저자극 제품<br>
          ● 복합성: 부위별 관리 필요
        </p>
        <div class="skin-test">
          <a href="skintype.jsp">내 피부타입 테스트하기</a>
        </div>
      </div>

      <div class="info-card slide-up" data-index="2">
        <h3 class="card-title">왜 PIBUPIBU인가요?</h3>
        <p class="card-text">
          ✔️ 피부타입 진단 기반 추천<br>
          ✔️ 간단한 루틴 안내<br>
          ✔️ 초보자도 알기 쉬운 큐레이션<br>
          ✔️ 20~30대 남성 피부 특화 제품 제공
        </p>
		<img src="images/step_guide2.png" alt="스킨케어 단계 이미지" class="card-image">
      </div>
    </div>
  </div>
</section>

	<div class="links-info">
     <h2>피부 테스트 결과에 맞는 추천 상품을 확인해보세요</h2>
  <p>
    피부 타입을 알고 있다면,<br>
    건성부터 민감성까지, 나에게 맞는 제품을 선택해보세요.
  </p>
  
 <div class="links-images">
  <a href="viewProduct.jsp?ctgType=category1">
    <img src="images/skindry.png" alt="건성" id="img-category1" style="display: inline-block;">
  </a>
  <a href="viewProduct.jsp?ctgType=category2">
    <img src="images/skinoily.png" alt="지성" id="img-category2" style="display: inline-block;">
  </a>
  <a href="viewProduct.jsp?ctgType=category3">
    <img src="images/skinnormal.png" alt="중성" id="img-category3" style="display: inline-block;">
  </a>
  <a href="viewProduct.jsp?ctgType=category4">
    <img src="images/skinsensitive.png" alt="민감성" id="img-category4" style="display: inline-block;">
  </a>
  <a href="viewProduct.jsp?ctgType=category5">
    <img src="images/skincombination.png" alt="복합성" id="img-category5" style="display: inline-block;">
  </a>
</div>


  
  <div class="links">
        <a href="viewProduct.jsp?ctgType=category1">건성</a>
        <a href="viewProduct.jsp?ctgType=category2">지성</a>
		 <a href="viewProduct.jsp?ctgType=category3">중성</a>
        <a href="viewProduct.jsp?ctgType=category4">민감성</a>
        <a href="viewProduct.jsp?ctgType=category5">복합성</a>
    </div>
</div>


<div class="recommend">
  <h3>BEST</h3>
  <p class="best-description">
  많은 분들이 선택한 인기 제품을 한눈에 확인해 보세요.  
  피부 타입별 베스트 아이템만 모았어요.
</p>
  <div class="best-filter">
    <button data-kind="all" class="active">전체</button>
    <button data-kind="크림">크림</button>
    <button data-kind="앰플">앰플</button>
    <button data-kind="토너">토너</button>
    <button data-kind="클렌징폼">클렌징폼</button>
  </div>

 <div class="product-list">
<%@ page import="java.sql.*" %>
<%
String DB_URL = "jdbc:mysql://localhost:3306/project";
String DB_ID = "root";
String DB_PASSWORD = "1234";

String[][] productList = {
  {"A002", "앰플"},
  {"B002", "앰플"},
  {"C002", "앰플"},
  {"B003", "크림"},
  {"C003", "크림"},
  {"D003", "크림"},
  {"C004", "클렌징폼"},
  {"D004", "클렌징폼"},
  {"E004", "클렌징폼"},
  {"E001", "토너"},
  {"A001", "토너"},
  {"D001", "토너"}
};

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    Class.forName("org.gjt.mm.mysql.Driver");
    conn = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

    for (int i = 0; i < productList.length; i++) {
        String prdNo = productList[i][0];
        String ctgType = productList[i][1];

        String sql = "SELECT prdName, prdPrice FROM goods WHERE prdNo = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, prdNo);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            String prdName = rs.getString("prdName");
            int prdPrice = rs.getInt("prdPrice");
%>
    <a href="viewDetailProduct.jsp?prdNo=<%= prdNo %>" data-kind="<%= ctgType %>">
      <img src="images/<%= prdNo %>.jpg">
      <p><%= prdName %></p>
      <p class="price"><%= String.format("%,d원", prdPrice) %></p>
    </a>
<%
        }
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
    }
} catch (Exception e) {
    e.printStackTrace();
} finally {
    if (conn != null) conn.close();
}
%>
</div>
</div>



<div class="feature-section">
  <h3 class="feature-title-inside">PIBUPIBU’s Choice</h3>
   <div class="feature-description-wrapper">
    <p class="choice-description">
      PIBUPIBU가 추천하는 시즌별 제품이에요! 고민하지 말고, choice 해 보세요!
    </p>
  </div>

  <div class="feature-left">
    <a href="viewDetailProduct.jsp?prdNo=A003">
      <img src="images/A003.jpg" alt="대표 이미지">
      <span class="hash-tag">#보습 #속건조케어<br>#당김 없이 촉촉하게</span>
      <h2>건조한 봄에 나에게 딱 맞는 크림</h2>
      <p>세라마이드 보습막 크림</p>
    </a>
	<div class="label-ribbon">
  <a href="viewDetailProduct.jsp?prdNo=A003">보습강추</a>
</div>

  </div>

  <div class="feature-right">
    <div class="mini-product">
      <a href="viewDetailProduct.jsp?prdNo=D001">
        <img src="images/C001.jpg" alt="대표 이미지">
        <div>
          <span class="hash-tag">#수분 #진정 #토너<br>#자극 없이 촉촉하게</span>
          <p>민감한 피부를 위한<br>저자극 진정 토너</p>
          <small>어성초 진정 토너</small>
        </div>
      </a>
    </div>

    <div class="mini-product">
      <a href="viewDetailProduct.jsp?prdNo=E002">
        <img src="images/E002.jpg" alt="대표 이미지">
        <div>
          <span class="hash-tag">#복합성 피부 추천<br>#피지 + 수분 밸런스</span>
          <p>유분과 수분을 동시에 케어</p>
          <small>듀얼컨트롤 수분진정 앰플</small>
        </div>
      </a>
    </div>
  </div>
</div>

    <script>
  let currentIndex = 0;
  const images = document.querySelectorAll(".banner img");
  const linkElement = document.getElementById("bannerLink");

  const productLinks = [
    "skintype.jsp",
    "skintype.jsp",
    "viewDetailProduct.jsp?prdNo=D002"
  ];

  function showBanner(index) {
    images.forEach(img => img.classList.remove("active"));
    currentIndex = (index + images.length) % images.length;
    images[currentIndex].classList.add("active");
    linkElement.href = productLinks[currentIndex];
  }

  function nextBanner() {
    showBanner(currentIndex + 1);
  }

  function prevBanner() {
    showBanner(currentIndex - 1);
  }

  setInterval(nextBanner, 5000); // 자동 전환
</script>

	<script>
  const cards = document.querySelectorAll('.slide-up');

  cards.forEach((card, index) => {
    card.dataset.index = index; 

    const observer = new IntersectionObserver(entries => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          const delay = Number(entry.target.dataset.index) * 0.2;
          entry.target.style.transitionDelay = `${delay}s`;
          entry.target.classList.add('visible');
          observer.unobserve(entry.target);
        }
      });
    }, {
      threshold: 0.2
    });

    observer.observe(card);
  });
</script>

<script>
  const kindButtons = document.querySelectorAll('.best-filter button');
  const bestItems = document.querySelectorAll('.product-list a');

  kindButtons.forEach(button => {
    button.addEventListener('click', () => {
      const selectedKind = button.getAttribute('data-kind');

  
      kindButtons.forEach(btn => btn.classList.remove('active'));
      button.classList.add('active');

      bestItems.forEach(item => {
        const kind = item.getAttribute('data-kind');
        if (selectedKind === 'all' || kind === selectedKind) {
          item.style.display = 'block';
        } else {
          item.style.display = 'none';
        }
      });
    });
  });
</script>

<%@ include file="footer.jsp" %>
</body>
</html>
