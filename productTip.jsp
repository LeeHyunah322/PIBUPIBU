<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>스킨케어 가이드</title>
  <style>
    .wrapper {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      line-height: 1.6;
      margin: 0;
	  padding: 0;
      background-image: url('images/recommend.png'); 
	  background-size: cover; 
	  background-position: center; 
	  background-repeat: no-repeat;
      color: #333;
    }
	
    header {
      background-image: url('images/top.png'); 
	  background-size: cover; 
	  background-position: center; 
	  background-repeat: no-repeat;
      color: #1EB980;
      padding: 40px 20px;
      text-align: center;
    }
    header h1 {
      margin: 0;
      font-size: 2.5em;
    }
    header p {
      font-size: 1.2em;
	  color: #333;
    }
    .container {
      max-width: 1200px;
      margin: auto;
      padding: 20px;
    }
	.highlight {
	  background-color: #cde5d1;
	  padding: 2px 4px;
	  border-radius: 4px;
	}

    section {
      margin-bottom: 60px;
      background: #fff;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.1);
	  border: 1px solid #cde5d1;
	  opacity: 0;
      transform: translateY(40px);
      transition: all 0.6s ease-out;
	  font-size: 20px;
    }
    section h2 {
      color: #333;
      margin-bottom: 30px;
      border-left: 6px solid #cde5d1;
      padding-left: 10px;
    }
	section.show {
      opacity: 1;
      transform: translateY(0);
    }
    .grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
      gap: 20px;
    }
    .card {
      background: #fff;
      padding: 15px;
      border-radius: 8px;
      box-shadow: 0 2px 6px rgba(0,0,0,0.03);
    }
    .card h3 {
      margin-top: 0;
      color: #1EB980;
    }
	
  @media screen and (max-width: 768px) {
    header {
      padding: 30px 10px;
	  margin-top:150px;
    }

    header h1 {
      font-size: 1.8em;
    }

    header p {
      font-size: 1em;
    }

    .container {
      padding: 15px;
    }

    section {
      padding: 20px;
      margin-bottom: 40px;
      font-size: 16px;
    }

    section h2 {
      font-size: 20px;
      margin-bottom: 20px;
    }

    .grid {
      grid-template-columns: 1fr;
      gap: 16px;
    }

    .card {
      padding: 12px;
    }

    .card h3 {
      font-size: 18px;
    }

    .product-description,
    .product-info p,
    .card p {
      font-size: 15px;
    }

    img {
      max-width: 100%;
      height: auto;
    }
	 img[alt="피부관리 전후 비교"] {
    margin-left: 0 !important;
  }
  }


	
  </style>
</head>

<body>
<div style="margin-top: 120px;"></div>
<%@ include file="header.jsp" %>
<div class="wrapper">
  <header>
    <h1>초보자들을 위한 스킨케어 가이드</h1>
    <p>첫인상 3초, 성공의 열쇠는 피부. 남성을 위한 스마트 스킨케어.</p>
  </header>
  
  <div class="container">
    <section>
      <h2>왜 남자도 피부관리를 해야 할까?</h2>
      <p style="text-align: center;">
		첫인상은 3초 만에 결정되고, 그 중에서도 <span class="highlight">피부는 첫인상에서 가장 먼저 눈에 띄는 부분</span>이에요.<br> 특히 <span class="highlight">20~30대 남성</span>은 사회생활, 데이트, 비즈니스 미팅 등에서 깔끔하고 단정한 인상을 남기는 것이 중요하죠.<br> 피부는 단순히 미용의 문제가 아닌, <span class="highlight">당신의 라이프스타일과 자기관리를 보여주는 지표</span>예요.
	  </p>

	  <img src="images/before_after.png" alt="피부관리 전후 비교"
       style="max-width: 100%; margin-top: 20px; border-radius: 12px;margin-left:60px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);" />
    </section>

<section>
<h2>남성 스킨케어 단계 한눈에 보기</h2>
  <p style="text-align: center;">
	피부에 꼭 맞는 <span class="highlight">스킨케어 루틴은 생각보다 복잡하지 않아요.</span><br>
	자신의 피부 타입만 잘 알고 있다면, 몇 가지 기본 제품만으로도 건강하고 깔끔한 피부를 유지할 수 있어요.<br> 과도한 단계나 비싼 제품 없이도, <span class="highlight">꾸준하고 알맞은 루틴이면 충분하죠.</span>
	</p>
  <img src="images/step_guide.png" alt="스킨케어 순서 이미지" style="max-width:100%; margin-top:20px; border-radius:12px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);" />
  <br><br>
      <h2>제품별 사용법 가이드</h2>
      <div class="grid">
	  <div class="card">
	   <h3>클렌징폼</h3>
  <p>
    피부 표면에 쌓인 노폐물과 피지, 미세먼지를 부드럽게 제거해주는  
    첫 번째 세안 단계예요.<br><br>
    <strong>왜 필요할까?</strong>  <br>
    메이크업 잔여물이나 미세먼지까지 깨끗하게 씻어내야  
    다음 스킨케어 제품 흡수가 더 잘 되며, 트러블이 나지 않아요.
  </p>
</div>
        <div class="card">
  <h3>토너</h3>
  <p>
    세안 후 피부결을 정돈해주는 단계.  
    화장솜에 적셔 가볍게 닦아내거나 두드려서 흡수시키세요.<br><br>
    <strong>왜 필요할까?</strong>  <br>
    세안 후 무너진 피부 pH 밸런스를 빠르게 잡아줘야 다음 단계 흡수력이 높아져요.
  </p>
</div>


<div class="card">
  <h3>세럼</h3>
  <p>
    앰플보다 묽고 흡수가 빠른 텍스처.  
    장기적인 피부 개선 효과를 기대할 수 있어요.<br><br>
    <strong>왜 필요할까?</strong> <br> 
    데일리 관리용으로 자극 없이 매일 사용할 수 있어 꾸준한 피부변화에 좋아요.
  </p>
</div>

<div class="card">
  <h3>크림</h3>
  <p>
    마무리 단계로 수분을 꽉 잡아주는 역할.  
    특히 밤에 듬뿍 바르면 효과적이에요.<br><br><br>
    <strong>왜 필요할까?</strong>  <br>
    하루 종일 공급한 수분과 영양을 날아가지 않게 잠궈주는 뚜껑 같은 존재예요.
  </p>
</div>

      </div>
    </section>

    <section>
      <h2>피부 타입별 분류</h2>
      <div class="grid">
        <div class="card">
          <h3>건성</h3>
          <p>당김, 각질, 푸석한 느낌이 있다면 건성 피부. 보습력 높은 크림과 앰플이 중요해요.</p>
        </div>
        <div class="card">
          <h3>지성</h3>
          <p>기름기, 번들거림, 트러블이 있다면 지성 피부. 유분 조절이 핵심이에요. 가벼운 토너와 세럼 추천해요.</p>
        </div>
        <div class="card">
          <h3>복합성</h3>
          <p>T존은 번들, U존은 건조한 복합성 피부. 부분별로 제품을 달리 써야 하지만, 피부피부로 한 번에 케어할 수 있어요.</p>
        </div>
        <div class="card">
          <h3>민감성</h3>
          <p>조금만 해도 붉어지고 따가운 민감성 피부. 자극이 적은 성분 위주 제품을 써야 해요.</p>
        </div>
        <div class="card">
          <h3>중성</h3>
          <p>특별히 건조하거나 기름지지 않은 피부. 유지가 관건이므로 균형 잡힌 루틴을 유지해야 해요.</p>
        </div>
      </div>
    </section>

  
    <section>
		<h2>PIBUPIBU의 장점</h2>
        <p>✔️ 20~30대 남성을 위한 맞춤형 큐레이션</p>
		<p>✔️ 피부타입 진단으로 개인화된 제품 추천</p>
        <p>✔️ 간단하고 효과적인 루틴 구성 제안</p>
        <p>✔️ 과하지 않게, 그러나 확실하게 관리하는 법</p>
    </section>
  </div>
  </div>
  <script>
    const sections = document.querySelectorAll("section");

    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add("show");
        }
      });
    }, { threshold: 0.2 });

    sections.forEach(section => {
      observer.observe(section);
    });
  </script>

<%@ include file="footer.jsp" %>
</body>
</html>
