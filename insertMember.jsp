<%@ page contentType="text/html;charset=UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
    <title>회원가입</title>
    
    <style>
        body {
            background-color: #fff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            max-width: 500px;
            margin: 60px auto;
            background: #fff;
            border-radius: 12px;
            padding: 30px 25px;
           box-shadow: 0 5px 15px rgba(0,0,0,0.1);
			border: 1px solid #cde5d1;
        }

        h2 {
			font-size : 29px;
            text-align: center;
            color: #1EB980;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: 500;
            color: #333;
        }

        input[type="text"],
        input[type="password"],
        input[type="date"],
        select {
            width: 100%;
            padding: 8px 10px;
            border: 1px solid #cde5d1;
            border-radius: 6px;
            font-size: 20px;
			font-weight: bold;
        }

        .radio-group {
            display: flex;
            gap: 15px;
            align-items: center;
        }

        .btns {
            text-align: center;
            margin-top: 25px;
        }

        .btn,
        .btn-secondary {
            background-color: #E8F5E9;
            color: #1EB980;
            padding: 8px 15px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 20px;
			font-weight: bold;
			white-space: nowrap;
        }

        .btn:hover,
        .btn-secondary:hover {
            background-color: #C8E6C9;
			
        }

        .btn-secondary {
            background-color: #E8F5E9;
            color: #1EB980;
           font-size: 20px;
			font-weight: bold;
        }

       .id-check-row {
    display: flex;
    gap: 10px;
}

.id-check-row input {
    flex: 1;
}

.id-check-row .id-check-btn {
    white-space: nowrap;
    padding: 8px 12px;
    font-size: 20px;
	font-weight: bold;
}


        .postcode-box {
            display: flex;
            gap: 10px;
        }
.btn-submit {
    background-color: #1EB980;
    color: white;
    padding: 10px 18px;
    font-size: 20px;
    font-weight: bold;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: background-color 0.3s;
}
.btn-submit:hover {
    background-color: #B8D5BD;
}

.btn-cancel {
    background-color: #f8f8f8;
    color: #666;
    padding: 10px 18px;
    font-size: 20px;
    font-weight: bold;
    border: 1px solid #ccc;
    border-radius: 6px;
    margin-left: 10px;
    cursor: pointer;
    transition: background-color 0.3s;
}
.btn-cancel:hover {
    background-color: #e0e0e0;
}

    </style>
    <script language="javascript" src="js_package.js"></script>
</head>
<div style="margin-top: 165px;"></div>
<jsp:include page="header.jsp" />
<body onLoad="idFocus()">
<div class="container">
    <h2>회원가입</h2>
    <form name="newMem" method="post" action="insertMemberResult.jsp">
<div class="form-group">
    <label>ID</label>
    <div class="id-check-row">
        <input type="text" name="id" id="idInput" class="form-control">
        <button type="button" class="btn id-check-btn" onclick="checkID()">중복 확인</button>
    </div>
    <div id="idCheckResult" style="margin-top: 6px; font-size: 13px;"></div>
</div>


        <div class="form-group">
            <label>비밀번호</label>
            <input type="password" name="password">
        </div>

        <div class="form-group">
            <label>성명</label>
            <input type="text" name="name">
        </div>

        <div class="form-group">
            <label>생년월일</label>
            <input type="date" name="birth">
            <div class="radio-group" style="margin-top: 8px;">
                <label><input type="radio" name="solar" value="양력" checked> 양력</label>
                <label><input type="radio" name="solar" value="음력"> 음력</label>
            </div>
        </div>
        <div class="form-group">
            <label for="postcode">우편번호</label>
            <div class="postcode-box">
                <input type="text" id="postcode" name="postcode" class="form-control" required>
                <button type="button" class="btn-secondary" onclick="execDaumPostcode()">주소 찾기</button>
            </div>
        </div>

        <div class="form-group">
            <label for="address">주소</label>
            <input type="text" id="address" name="address" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="detailAddress">상세 주소</label>
            <input type="text" id="detailAddress" name="detailAddress" class="form-control">
        </div>

        <div class="form-group">
            <label>휴대폰번호</label>
            <input type="text" name="phone" id="phoneInput" placeholder="예: 010-1234-5678">
        </div>
		<script>
document.getElementById("phoneInput").addEventListener("input", function(e) {
    let num = e.target.value.replace(/[^0-9]/g, "");
    let formatted = "";

    if (num.length < 4) {
        formatted = num;
    } else if (num.length < 8) {
        formatted = num.slice(0, 3) + "-" + num.slice(3);
    } else if (num.length <= 11) {
        formatted = num.slice(0, 3) + "-" + num.slice(3, 7) + "-" + num.slice(7);
    } else {
        formatted = num.slice(0, 3) + "-" + num.slice(3, 7) + "-" + num.slice(7, 11);
    }

    e.target.value = formatted;
});
</script>



        <div class="form-group">
            <label>성별</label>
            <div class="radio-group">
                <label><input type="radio" name="sex" value="남" checked> 남</label>
                <label><input type="radio" name="sex" value="여"> 여</label>
            </div>
        </div>

      <div class="btns">
    <input type="submit" value="회원가입" class="btn-submit">
    <input type="reset" value="다시작성" class="btn-cancel">
	<button type="button" class="btn-cancel" onclick="location.href='login.jsp'">취소</button>
</div>


    </form>
</div>
<script>
function checkID() {
    const id = document.getElementById("idInput").value;
    const resultDiv = document.getElementById("idCheckResult");

    if (id.trim() === "") {
        resultDiv.innerHTML = "<span style='color: red;'>ID를 입력해주세요.</span>";
        return;
    }

    fetch("checkId.jsp?id=" + encodeURIComponent(id))
    .then(res => res.text())
    .then(data => {
    console.log("응답:", data); // 실제 응답 확인용
    data = data.trim(); // ← 이거 한 줄 추가!!

    if (data === "EXIST") {
        resultDiv.innerHTML = "<span style='color: red;'>❌ 이미 존재하는 ID입니다.</span>";
    } else if (data === "AVAILABLE") {
        resultDiv.innerHTML = "<span style='color: green;'>✅ 사용 가능한 ID입니다.</span>";
    } else {
        resultDiv.innerHTML = "<span style='color: orange;'>⚠️ 오류가 발생했습니다.</span>";
    }
})


        .catch(err => {
            console.error(err);
            resultDiv.innerHTML = "<span style='color: orange;'>⚠️ 네트워크 오류</span>";
        });
}
</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById('address').value = data.address;
            document.getElementById('detailAddress').focus();
        }
    }).open();
}
</script>
<jsp:include page="footer.jsp" />
</body>
</html>
