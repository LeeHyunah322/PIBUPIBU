<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
<%@ include file="DBConnection.jsp" %> 


<%
request.setCharacterEncoding("UTF-8");


String loginId = (String) session.getAttribute("sid");

int currentPage = 1;
int itemsPerPage = 3;
if (request.getParameter("currentPage") != null) {
    currentPage = Integer.parseInt(request.getParameter("currentPage"));
}
int offset = (currentPage - 1) * itemsPerPage;


if ("POST".equalsIgnoreCase(request.getMethod()) && loginId != null) {
    String question = request.getParameter("qnaQuestion");

    if (question != null && !question.trim().equals("")) {
        String sql = "INSERT INTO qna (userId, qnaQuestion, qnaStatus) VALUES (?, ?, 'pending')";
        try (Connection conn = DriverManager.getConnection(url, user, password);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, loginId);
            pstmt.setString(2, question);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("qna.jsp");
        return;
    }
}
%>


<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html>
<head>
<title>QnA</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">

<script type="text/javascript">
var enablepersist="on"
var collapseprevious="yes"

if (document.getElementById){
document.write('<style type="text/css">')
document.write('.switchcontent{display:none;}')
document.write('</style>')
}

function getElementbyClass(classname){
ccollect=new Array()
var inc=0
var alltags=document.all? document.all : document.getElementsByTagName("*")
for (i=0; i<alltags.length; i++){
if (alltags[i].className==classname)
ccollect[inc++]=alltags[i]
}
}

function contractcontent(omit){
var inc=0
while (ccollect[inc]){
if (ccollect[inc].id!=omit)
ccollect[inc].style.display="none"
inc++
}
}

function expandcontent(cid){
if (typeof ccollect!="undefined"){
if (collapseprevious=="yes")
contractcontent(cid)
document.getElementById(cid).style.display=(document.getElementById(cid).style.display!="block")? "block" : "none"
}
}

function revivecontent(){
contractcontent("omitnothing")
selectedItem=getselectedItem()
selectedComponents=selectedItem.split("|")
for (i=0; i<selectedComponents.length-1; i++)
document.getElementById(selectedComponents[i]).style.display="block"
}

function get_cookie(Name) { 
var search = Name + "="
var returnvalue = "";
if (document.cookie.length > 0) {
offset = document.cookie.indexOf(search)
if (offset != -1) { 
offset += search.length
end = document.cookie.indexOf(";", offset);
if (end == -1) end = document.cookie.length;
returnvalue=unescape(document.cookie.substring(offset, end))
}
}
return returnvalue;
}

function getselectedItem(){
if (get_cookie(window.location.pathname) != ""){
selectedItem=get_cookie(window.location.pathname)
return selectedItem
}
else
return ""
}

function saveswitchstate(){
var inc=0, selectedItem=""
while (ccollect[inc]){
if (ccollect[inc].style.display=="block")
selectedItem+=ccollect[inc].id+"|"
inc++
}

document.cookie=window.location.pathname+"="+selectedItem
}

function do_onload(){
getElementbyClass("switchcontent")
if (enablepersist=="on" && typeof ccollect!="undefined")
revivecontent()
}


if (window.addEventListener)
window.addEventListener("load", do_onload, false)
else if (window.attachEvent)
window.attachEvent("onload", do_onload)
else if (document.getElementById)
window.onload=do_onload

if (enablepersist=="on" && document.getElementById)
window.onunload=saveswitchstate

</script>

<style type="text/css">
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
	font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
    background-color: #fff;
    color: #333;
    line-height: 1.6;
	
}

.container {
    width: 100%;
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px 0;
	margin-top:-60px;
}
.wave-header {
  background-image: url('images/intro2.png');
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center 62px;
  background-size: 1920px auto; 
  padding: 49px 0;
  text-align: center;
  color: #1EB980;
}

.page-header {
    text-align: center;
    margin-bottom: 40px;
}

.page-header h2 {
  font-size: 32px;
  font-weight: bold;
  color: #1EB980;
  margin-bottom: 25px;
  text-align: center;
  margin-top: 66px;
}


.page-header p {
margin-top:10px;
    color: #444;
}

.faq-container {
    margin-top: 30px;
}

.faq-item {
    margin-bottom: 15px;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 2px 10px rgba(0,0,0,0.05);
}

.faq-question {
    background-color: #E8F5E9;
    color: #1AA56F;
    padding: 18px 25px;
    cursor: pointer;
    font-weight: 500;
    font-size: 16px;
    transition: all 0.3s;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.faq-question:hover {
    background-color: #C8E6C9;
}

.faq-question:after {
    content: '+';
    font-size: 20px;
    color: #1AA56F;
    font-weight: bold;
}

.faq-question.active:after {
    content: '-';
}

.faq-answer {
    padding: 20px 25px;
    background-color: #FFF;
    border-top: 1px solid #E8F5E9;
    font-size: 15px;
    color: #555;
    line-height: 1.8;
}
 .ask-title {
		
		text-align: center; 
        margin-top: 20px;
        font-size: 29px;
        font-weight: 600;
        color: #1EB980;
    }
	
    .qna-box {
		max-width: 1200px;
        border-radius: 8px;
        background-color: #E8F5E9;
        margin: 20px auto;
        padding: 20px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
		transition: all 0.3s;
    }
	
	.qna-box:hover {
    background-color: #C8E6C9;
}
    .qna-question {
        font-size: 16px;
        font-weight: bold;
        color: #1AA56F;
        cursor: pointer;
    }

    .qna-meta {
        font-size: 13px;
        color: #666;
        margin: 10px 0;
    }

    .qna-answer {
        padding: 15px;
        background-color: #fff;
        border-left: 5px solid #1AA56F;
        margin-top: 10px;
        display: none;
    }

    .qna-answer.pending {
        background-color: #f4f4f4;
        color: #aaa;
        font-style: italic;
        border-left-color: #ccc;
    }

    textarea {
        width: 100%;
        max-width: 800px;
        padding: 10px;
        font-size: 15px;
        margin-top: 10px;
    }

    input[type="submit"] {
        margin-top: 10px;
        padding: 8px 20px;
        font-size: 15px;
        background-color: #2E7D32;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #27692d;
    }
	.question-form-wrapper {
    max-width: 800px;
    margin: 40px auto 20px;
    background-color: #f8fff6;
    border: 1px solid #cce3cc;
    border-radius: 10px;
    padding: 30px 20px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
}
.question-form-wrapper textarea {
    width: 100%;
    padding: 12px;
    border-radius: 6px;
    border: 1px solid #ccc;
    resize: vertical;
    font-size: 15px;
    font-family: inherit;
    background-color: #fff;
}

.question-form-wrapper input[type="submit"] {
    display: block;
    margin: 15px auto 0;
    padding: 10px 24px;
    font-size: 16px;
    background: #E8F5E9;
        color: #2E7D32;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: background-color 0.2s;
}

.question-form-wrapper input[type="submit"]:hover {
    background: #C8E6C9;
}

	.login-notice {
    text-align: center;
    margin-top: 20px;
    color: #2E7D32;
    font-weight: 600;
}

	.pagination {
  text-align: center;
  margin-top: 30px;
}

.pagination a, .pagination strong {
  display: inline-block;
  margin: 0 5px;
  padding: 8px 14px;
  font-size: 16px;
  border-radius: 6px;
  color: #555;
  text-decoration: none;
  transition: background-color 0.2s, color 0.2s;
}

.pagination a:hover {
   background: #E8F5E9;
  color: #2E7D32;
}

.pagination strong {
  background-color: #E8F5E9;
  color: #2E7D32;
}

	
	
	
	
@media (max-width: 768px) {
    .container {
        width: 95%;
        padding: 30px 0;
    }
    
    .faq-question {
        padding: 15px 20px;
        font-size: 15px;
    }
    
    .faq-answer {
        padding: 15px 20px;
    }
	.page-header{
		margin-top:150px;
	
	}
    .page-header h2,
    .ask-title {
        font-size: 22px;
    }

    .faq-question {
        font-size: 14px;
        padding: 12px 16px;
    }

    .faq-answer {
        font-size: 14px;
        padding: 15px 16px;
    }

    .qna-box {
        margin: 15px 10px;
        padding: 15px;
    }

    .qna-question {
        font-size: 15px;
    }

    .qna-meta {
        font-size: 12px;
    }

    .qna-answer {
        font-size: 14px;
    }

    .question-form-wrapper {
        margin: 30px 10px;
        padding: 20px;
    }

    .question-form-wrapper textarea {
        font-size: 14px;
    }

    .question-form-wrapper input[type="submit"] {
        font-size: 15px;
        padding: 8px 20px;
    }

    .pagination a,
    .pagination strong {
        font-size: 14px;
        padding: 6px 10px;
    }
}
</style>
</head>

<body>
<div style="margin-top:-65px;"></div>
<%@ include file="header.jsp" %>
<div class="page-header">
<div class="wave-header">
        <h2>자주 묻는 질문</h2>
        <p>고객님들께서 자주 문의하시는 질문과 답변을 모았습니다.</p>
    </div>
	</div>
<div class="container">
    
    
    <div class="faq-container">
        <div class="faq-item">
            <div class="faq-question" onClick="expandcontent('sc1')">
                [배송문의] 배송기간은 얼마나 걸리죠?
            </div>
            <div id="sc1" class="switchcontent faq-answer">
                결제 확인 시간 오후 3시 이전일 경우 당일 주문 건으로 처리되어 2~5일(주말 제외),
결제 확인 시간 오후 4시 이후일 경우 익일 주문 건으로 처리되어 3~6일(주말 제외) 정도 소요됩니다.
물품에 따라 주문량이 많은 상품일 경우 추가 시일 발생할 수 있습니다.
            </div>
        </div>
        
        <div class="faq-item">
            <div class="faq-question" onClick="expandcontent('sc2')">
                [배송문의] 오배송 or 불량일 경우는 어떻게 하나요?
            </div>
            <div id="sc2" class="switchcontent faq-answer">
                상품이 오배송이나 불량이 왔을 경우엔 절대 사용하지 마시고,
고객센터로 문의하시면 신속히 처리해 드리겠습니다.
(사용 후 변형이나 훼손된 경우에는 어떠한 사유로도 교환/환불이 어려운 점 양해 부탁드립니다.)
            </div>
        </div>
        
        <div class="faq-item">
            <div class="faq-question" onClick="expandcontent('sc3')">
                [환불관련] 반품 보냈는데 언제쯤 환불이 되죠?
            </div>
            <div id="sc3" class="switchcontent faq-answer">
                반품하신 상품의 환불은 물품이 물류센터에 도착한 후 2~3일 내로 처리되오니 양지해 주시기 바랍니다.
                카드 취소의 경우 취소 후 카드 대행사와 카드사의 전산 처리 시간으로 인하여 취소된 날로부터 2~7일 안에 카드사에서 확인이 가능합니다.
                만일 시일이 많이 지체되었지만, 환불되지 않았을 경우 상품을 반품 하실 때의 이용하신 택배사 이름 및 운송장 번호를 문의 게시판으로 알려주시면 보다 신속히 확인 후 처리해 드리겠습니다.
            </div>
        </div>
    </div>
</div>

<h3 class="ask-title">1 : 1 질문</h3>
<%
Connection conn = null;
Statement stmt = null;
int totalQna = 0;
try {
    conn = DriverManager.getConnection(url, user, password);
    stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM qna ORDER BY qnaId DESC LIMIT " + offset + ", " + itemsPerPage);
    while (rs.next()) {
        int qnaId = rs.getInt("qnaId");
        String userId = rs.getString("userId");
        String maskedId = userId.length() <= 3 ? userId.substring(0, 1) + "***" : userId.substring(0, userId.length() - 3) + "***";
        String question = rs.getString("qnaQuestion");
        String answer = rs.getString("qnaAnswer");
        Timestamp createdAt = rs.getTimestamp("created_at");
        String dateStr = new SimpleDateFormat("yyyy-MM-dd").format(createdAt);
%>
    <div class="qna-box">
        <div class="qna-question" onclick="toggleAnswer('<%= qnaId %>')">
            Q. <%= question %>
        </div>
        <div class="qna-meta">
            작성자: <%= maskedId %> | 날짜: <%= dateStr %>
        </div>
        <div id="answer-<%= qnaId %>" class="qna-answer <%= (answer == null || answer.trim().equals("")) ? "pending" : "" %>">
            <% if (answer == null || answer.trim().equals("")) { %>
                답변 준비 중입니다.
            <% } else { %>
                A. <%= answer %>
            <% } %>
        </div>
    </div>
<%
    }
    ResultSet countRs = stmt.executeQuery("SELECT COUNT(*) FROM qna");
    if (countRs.next()) {
        totalQna = countRs.getInt(1);
    }
} catch (Exception e) {
    e.printStackTrace();
} finally {
    try { if (stmt != null) stmt.close(); } catch (Exception e) {}
    try { if (conn != null) conn.close(); } catch (Exception e) {}
}
int totalPages = (int)Math.ceil((double)totalQna / itemsPerPage);
%>
<div class="pagination">
<% for (int i = 1; i <= totalPages; i++) { %>
    <% if (i == currentPage) { %>
        <strong><%= i %></strong>
    <% } else { %>
        <a href="qna.jsp?currentPage=<%= i %>"><%= i %></a>
    <% } %>
<% } %>

</div>

<h3 class="ask-title">질문을 남겨보세요</h3>
<% if (loginId != null) { %>
    <div class="question-form-wrapper">
        <form method="post">
            <textarea name="qnaQuestion" rows="4" placeholder="내용을 입력하세요" required></textarea><br>
            <input type="submit" value="질문 등록">
        </form>
    </div>
<% } else { %>
    <div style="text-align: center; margin-top: 20px;">
        <p><a href="login.jsp">로그인</a> 후 질문을 작성할 수 있습니다.</p>
    </div>
<% } %>

<div style="margin-bottom: 100px;"></div>
<%@ include file="footer.jsp" %>
<script>
function toggleAnswer(id) {
    const el = document.getElementById("answer-" + id);
    if (el) {
        el.style.display = (el.style.display === "block") ? "none" : "block";
    }
}
</script>
</body>
</html>