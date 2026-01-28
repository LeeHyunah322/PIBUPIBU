<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>피부 타입 테스트</title>
  <style>
  
	html {
	  overflow-y: scroll; 
	  overflow-x: hidden; 
	  width: 100vw;      
	}

   .wrapper { 
	  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-image: url(images/background.png);
	  background-size: cover;    
	  background-position: center;  
	  background-repeat: no-repeat; 
      display: flex;
      justify-content: center;
	  flex-direction: column;
      align-items: center;
      height: 100vh;
      margin: 0;
    }
    .quiz-box {
      background: #fff;
      padding: 50px;
      border-radius: 15px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.1);
	  border: 1px solid #cde5d1;
      text-align: center;
      width: 500px;
    }
    .question {
      font-size: 25px;
      margin-bottom: 20px;
      color: #1EB980;
	  font-weight: bold;
    }
    .options {
      display: flex;
      flex-direction: column;
      gap: 10px;
    }
    button {
      background-color: #B8D5BD;
      color: white;
      border: none;
      padding: 10px;
      border-radius: 5px;
      cursor: pointer;
	  font-size: 17px;
	  font-weight: bold;
    }
    button:hover {
      background-color: #97B89D;
    }
	h2 {
	  font-size: 30px;
	  font-weight: bold;
	  color: #1EB980;
	  margin-top: -70px;
	  margin-bottom: 25px;
	  text-align: center;
	}
	.progress-container {
	  width: 500px;
	  margin-bottom: 30px;
	}

	.progress-label {
	  font-size: 20px;
	  color: #1EB980;
	  margin-bottom: 8px;
	  text-align: left;
	}

	.progress-bar {
	  width: 100%;
	  height: 14px;
	  background-color: #B8D5BD;
	  border-radius: 7px;
	  overflow: hidden;
	}

	.progress-fill {
	  height: 100%;
	  width: 0%;
	  background-color: #97B89D;
	  transition: width 0.3s ease;
	}
	.question, .options button {
	  transition: all 0.3s ease;
	  opacity: 1;
	}

	.question.fade-out, .options button.fade-out {
	  opacity: 0;
	  transform: translateY(10px);
	}

@media screen and (max-width: 768px) {
  .quiz-box {
    width: 90%;
    padding: 30px 20px;
  }

  .question {
    font-size: 20px;
  }

  button {
    font-size: 15px;
    padding: 10px;
  }

  .progress-container {
    width: 90%;
  }

  .progress-label {
    font-size: 16px;
  }

  h2 {
    font-size: 24px;
    margin-top: -40px;
    margin-bottom: 20px;
  }
}

@media screen and (max-width: 480px) {
  .quiz-box {
    width: 95%;
    padding: 24px 16px;
  }

  .question {
    font-size: 18px;
  }

  button {
    font-size: 14px;
    padding: 8px;
  }

  .progress-container {
    width: 95%;
  }

  .progress-label {
    font-size: 14px;
  }

  h2 {
    font-size: 22px;
    margin-top: -3px;
  }
}

  </style>
</head>
<body>
<div style="margin-top: -100px;"></div>
<%@ include file="header.jsp" %>

<div class="wrapper">
<h2 style="color: #1EB980;">피부 타입 테스트</h2>



<div class="progress-container">
  <div class="progress-label">진행도: <span id="progress-percent">0%</span></div>
  <div class="progress-bar">
    <div class="progress-fill" id="progress-fill"></div>
  </div>
</div>

  <div class="quiz-box">
    <div id="question" class="question"></div>
    <div id="options" class="options"></div>
  </div>
  </div>
  
<script>
  const questions = [
    { text: "1. 하루에 세수를 3회 이상 하나요?", type: "지성" },
    { text: "2. 피부가 자주 건조하거나 당기나요?", type: "건성" },
    { text: "3. 피부가 자주 번들거리나요?", type: "지성" },
    { text: "4. 피부가 가렵거나 따가운적이 많나요?", type: "민감성" },
    { text: "5. 좁쌀 여드름/트러블이 자주 발생하나요?", type: "민감성" },
  ];

  const answers = {
    "건성": 0,
    "지성": 0,
    "중성": 0,
    "민감성": 0,
    "복합성": 0
  };

  let current = 0;

  const choices = [
    { text: "매우 그렇다", value: 2 },
    { text: "그렇다", value: 1 },
    { text: "보통이다", value: 0 },
    { text: "아니다", value: -1 },
    { text: "전혀 아니다", value: -2 }
  ];

  function showQuestion() {
	  updateProgress();
    document.getElementById("question").innerText = questions[current].text;
    const optionBox = document.getElementById("options");
    optionBox.innerHTML = "";

    choices.forEach(choice => {
      const btn = document.createElement("button");
      btn.innerText = choice.text;
      btn.onclick = () => {
        const qType = questions[current].type;
        if (choice.value === 0) answers["중성"]++;
        else answers[qType] += choice.value;

        current++;
        if (current < questions.length) {
          showQuestion();
        } else {
          calculateSkinType();
        }
      };
      optionBox.appendChild(btn);
    });
  }

  function calculateSkinType() {
    if (Math.abs(answers["건성"] - answers["지성"]) <= 2 && answers["건성"] > 0 && answers["지성"] > 0) {
      answers["복합성"] = Math.min(answers["건성"], answers["지성"]);
    }

    const max = Math.max(...Object.values(answers));
    const skinType = Object.keys(answers).find(key => answers[key] === max);

    const pageMap = {
      "건성": "dry.jsp",
      "지성": "oily.jsp",
      "중성": "normal.jsp",
      "민감성": "sensitive.jsp",
      "복합성": "combination.jsp"
    };

    const xhr = new XMLHttpRequest();
    xhr.open("POST", "saveSkinType.jsp", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send("result=" + encodeURIComponent(skinType));

    xhr.onreadystatechange = function () {
      if (xhr.readyState === 4 && xhr.status === 200) {
        window.location.href = pageMap[skinType];
      }
    };
  }

  window.onload = showQuestion;
  function updateProgress() {
  const percent = Math.min((current / questions.length) * 100, 100);
  document.getElementById("progress-percent").innerText = Math.round(percent) + "%";
  document.getElementById("progress-fill").style.width = percent + "%";
}
function showQuestion() {
  const questionBox = document.getElementById("question");
  const optionBox = document.getElementById("options");

  questionBox.classList.add("fade-out");
  optionBox.classList.add("fade-out");

  setTimeout(() => {
    updateProgress();
    questionBox.innerText = questions[current].text;
    optionBox.innerHTML = "";

    choices.forEach(choice => {
      const btn = document.createElement("button");
      btn.innerText = choice.text;
      btn.onclick = () => {
        const qType = questions[current].type;
        if (choice.value === 0) answers["중성"]++;
        else answers[qType] += choice.value;

        current++;
        if (current < questions.length) {
          showQuestion();
        } else {
          calculateSkinType();
        }
      };
      optionBox.appendChild(btn);
    });

    questionBox.classList.remove("fade-out");
    optionBox.classList.remove("fade-out");
  }, 200);
}

</script>
<div style="margin-bottom: -210px;"></div>
<%@ include file="footer.jsp" %>
</body>

</html>

