<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String loginId = (String) session.getAttribute("sid");
    if (loginId == null) {
        response.sendRedirect("login.jsp?redirect=skinmatch.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>피부 타입 짝 맞추기</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #fff;
      margin: 0;
      padding: 0;
    }
	.wave-header {
	  background-image: url('images/intro2.png');
	  background-repeat: no-repeat;
	  background-size: cover;
	  background-position: center 62px;
	  background-size: 1920px auto; 
	  padding: 140px 0;
	  text-align: center;
	  color: #1EB980;
	}

	.wave-header h2 {
      font-size: 32px;
      margin-bottom: 20px;
      color: #1EB980;
	  margin-top:-20px;
    }
	.wave-header p {
	  font-size: 18px;
      color: #666;
      margin-top: 10px;
    }

    .game-section {
	  margin-right: 80px;
      margin-top:-80px;
      text-align: center;
      background-color: #fff;
    }

    .game-board {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(140px, 1fr));
      gap: 20px 100px;
      justify-content: center;
      max-width: 1200px;
      margin: auto;
    }

    .card {
      width: 240px;
      height: 280px;
      background-color: #E8F5E9;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 18px;
      font-weight: bold;
      color: #1EB980;
      cursor: pointer;
      border-radius: 8px;
      position: relative;
      perspective: 1000px;
	  border: 3px solid transparent;
	  transition: border 0.3s ease;

    }

    .card-inner {
      width: 100%;
      height: 100%;
      position: absolute;
      transition: transform 0.6s;
      transform-style: preserve-3d;
    }

    .card.flipped .card-inner {
      transform: rotateY(180deg);
    }

    .card-front, .card-back {
      width: 100%;
      height: 100%;
      position: absolute;
      backface-visibility: hidden;
      border-radius: 8px;
      display: flex;
      align-items: center;
      justify-content: center;
      overflow: hidden;
    }

    .card-front {
      background-color: #E8F5E9;
      color: #1EB980;
    }

    .card-back {
      background-color: #fff;
      transform: rotateY(180deg);
    }

    .card-back img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    #result {
      margin-top: 30px;
      font-size: 18px;
      color: #333;
    }

    #goToMypage,
	#resetGame {
	
      margin-top: 20px;
      padding: 10px 20px;
      background-color: #1EB980;
      color: white;
      border: none;
      border-radius: 6px;
      font-size: 16px;
      cursor: pointer;
      display: none;
    }

    #goToMypage:hover,
	#resetGame:hover {
      background-color: #159c6d;
    }
	.card.correct {
	  border: 3px solid #1EB980; 
	}
	.card.wrong {
      border: 3px solid #ff6b6b;
	}
	#couponPopup {
	  position: fixed;
	  top: 0; left: 0;
	  width: 100%; height: 100%;
	  background: rgba(0, 0, 0, 0.4);
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  z-index: 999;
	}

	.popup-inner {
	  background: #fff;
	  border-radius: 12px;
	  padding: 30px;
	  text-align: center;
	  box-shadow: 0 5px 20px rgba(0,0,0,0.3);
	  animation: popupFade 0.3s ease;
	  max-width: 300px;
	}

	.popup-inner img {
	  width: 150px;
	  margin-bottom: 20px;
	}

	.popup-inner p {
	 font-size: 21px;
	 color: #1EB980;
	 font-weight: bold;
	 margin-bottom: 10px;
	}

	.popup-inner button {
	 padding: 10px 20px;
	 border: none;
	 background: #1EB980;
	 color: white;
	 border-radius: 6px;
	 font-size: 16px;
	 cursor: pointer;
	 transition: background-color 0.3s;
	}
	.popup-inner button:hover {
	background-color: #1AA56F;
	}
	
    @keyframes popupFade {
    from { transform: scale(0.8); opacity: 0; }
    to { transform: scale(1); opacity: 1; }
	}
	
	
	@media screen and (max-width: 768px) {
  .wave-header {
    padding: 100px 20px;
    background-position: center top;
	margin-top:150px;
  }

  .wave-header h2 {
    font-size: 22px;
    margin-top: 0;
  }

  .wave-header p {
    font-size: 14px;
    margin-top: 5px;
  }

  .game-section {
    margin-right: 0;
    padding: 0 10px;
  }

  .game-board {
    display: grid;
    grid-template-columns: repeat(5, 1fr); 
    gap: 10px 14px;
    padding: 0 10px;
  }

  .card {
    width: 100%;
    height: 200px;
    font-size: 14px;
  }

  .card-back img {
    height: 70%;
  }

  .popup-inner {
    width: 80%;
    max-width: 260px;
    padding: 20px;
  }

  .popup-inner p {
    font-size: 16px;
  }

  #resetGame,
  #goToMypage {
    font-size: 15px;
    display: inline-block;
  }

}

  </style>
</head>
<body>
<div style="margin-top:-65px;"></div>
<%@ include file="header.jsp" %>
<div class="wave-header">
  <h2>PIBUPIBU 스킨케어 짝맞추기</h2>
   <p>제품 짝 맞추기에 도전하고 5% 쿠폰을 받으세요!</p>
  </div>
<div class="game-section">
  <div class="game-board" id="gameBoard"></div>
  <div id="result"></div>
<button id="resetGame" style="display:none; margin-left: 100px;" onclick="location.reload()">다시 시작</button>

<button id="goToMypage" style="display:none; margin-left: 20px;" onclick="location.href='mypage.jsp'">쿠폰 확인하러 가기</button>
</div>
</div>
<div id="couponPopup" style="display:none;">
  <div class="popup-inner">
   <img src="images/coupon.png" alt="쿠폰 이미지" style="width: 200px; height: auto; margin-bottom: 20px;">
    <p id="popupMsg">🎁 쿠폰이 발급되었습니다!</p>
    <button onclick="closePopup()">확인</button>
  </div>
</div>
<div style="margin-bottom:100px;"></div>
<%@ include file="footer.jsp" %>

<script>
const pairs = [
  { label: "촉촉결 토너 패드", image: "images/A005.jpg" },
  { label: "산뜻 컨트롤 토너", image: "images/B001.jpg" },
  { label: "밸런스업 앰플", image: "images/C002.jpg" },
  { label: "트러블 밸런싱 클렌징폼", image: "images/E004.jpg" },
  { label: "그린포레스트 미스트", image: "images/D006.jpg" },
];

function showCouponPopup(message) {
  document.getElementById("popupMsg").innerText = message;
  document.getElementById("couponPopup").style.display = "flex";
}

function closePopup() {
  document.getElementById("couponPopup").style.display = "none";
}

let cards = [];
let flipped = [];
let matchedCount = 0;

 const isImageCard = (label) =>
  label.endsWith("크림") || label.endsWith("토너") || label.endsWith("앰플");

function shuffle(array) {
  for (let i = array.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [array[i], array[j]] = [array[j], array[i]];
  }
}

function createBoard() {
  const duplicated = [...pairs.slice(0, 5), ...pairs.slice(0, 5)];
  shuffle(duplicated);

  const board = document.getElementById("gameBoard");
  duplicated.forEach((item) => {
    const card = document.createElement("div");
    card.className = "card";
    card.dataset.label = item.label;
    card.dataset.image = item.image;

  const innerHTML =
  '<div class="card-inner">' +
    '<div class="card-front">?</div>' +
    '<div class="card-back" style="flex-direction: column;">' +
      '<img src="' + item.image + '" alt="' + item.label + '" style="width: 100%; height: 80%; object-fit: cover;" />' +
      '<span style="font-size: 14px; margin-top: 5px; color: #1EB980;">' + item.label + '</span>' +
    '</div>' +
  '</div>';



    card.innerHTML = innerHTML;
    card.addEventListener("click", () => flipCard(card));
    board.appendChild(card);
    cards.push(card);
  });
}


function flipCard(card) {
  if (flipped.length >= 2 || card.classList.contains("flipped") || card.classList.contains("matched")) return;
  card.classList.add("flipped");
  flipped.push(card);
  if (flipped.length === 2) checkMatch();
}

function checkMatch() {
  const [card1, card2] = flipped;
  const isMatch = card1.dataset.image === card2.dataset.image && card1 !== card2;

  if (isMatch) {
    card1.classList.add("matched", "correct");
    card2.classList.add("matched", "correct");
    matchedCount++;

    setTimeout(() => {
      card1.classList.remove("correct");
      card2.classList.remove("correct");
    }, 1000);

    if (matchedCount === pairs.length) {
if (matchedCount === pairs.length) {
  fetch("issueCoupon.jsp")
    .then(res => res.text())
    .then(msg => {
      showCouponPopup("🎉 모든 짝을 다 맞췄어요!" + msg);
    });

 
  document.getElementById("goToMypage").style.display = "inline-block";  
  document.getElementById("resetGame").style.display = "inline-block"; 
}


    }
  } else {
    card1.classList.add("wrong");
    card2.classList.add("wrong");

    setTimeout(() => {
      card1.classList.remove("flipped", "wrong");
      card2.classList.remove("flipped", "wrong");
    }, 1000);
  }

  flipped = [];
}

createBoard();
</script>
</body>
</html>