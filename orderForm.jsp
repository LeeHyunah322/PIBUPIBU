<%@ page contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" %>
<%
    String loginId = (String) session.getAttribute("sid");
    if (loginId == null) {
        response.sendRedirect("login.jsp?redirect=orderForm.jsp" + (request.getQueryString() != null ? "?" + request.getQueryString() : ""));
        return;
    }
%>

<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page import="java.util.List, java.util.Map, java.util.HashMap" %>
<html>
<head>

<title>주문 정보 입력</title>
<style type="text/css">
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    body {
        background-color: #fff;
        color: #333;
        line-height: 1.6;
    }
    
    .container {
        width: 95%;
        max-width: 1200px;
        margin: 0 auto;
        padding: 30px 0;
    }
    
    .order-header {
        text-align: center;
        margin-bottom: 30px;
    }
    
    .order-header h1 {
        color: #1AA56F;
        font-weight: 500;
        margin-bottom: 10px;
    }
    
    .order-step {
        display: flex;
        justify-content: center;
        margin-bottom: 30px;
    }
    
    .step {
        text-align: center;
        position: relative;
        padding: 0 20px;
    }
    
    .step-number {
        width: 30px;
        height: 30px;
        background: #E8F5E9;
        color: #1AA56F;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 10px;
        font-weight: 500;
    }
    
    .step.active .step-number {
        background: #1AA56F;
        color: white;
    }
    
    .step-title {
        font-size: 14px;
        color: #777;
    }
    
    .step.active .step-title {
        color: #1AA56F;
        font-weight: 500;
    }
    
    /* 상품 요약 정보 - 세로 정렬 */
    .product-summary {
        display: block;
        padding: 20px;
        background: #F8F9FA;
        border-radius: 8px;
        margin-bottom: 30px;
    }

    .product-summary-row {
        display: flex;
        justify-content: space-between;
        padding: 10px 0;
        border-bottom: 1px solid #eee;
    }

    .product-summary-label {
        font-weight: 500;
        color: #555;
        width: 150px;
    }

    .product-summary-value {
        text-align: left;
        flex: 1;
    }

    .product-summary .product-price {
        color: #1AA56F;
        font-weight: 700;
    }

    .product-summary .total-price {
        font-size: 18px;
        font-weight: 700;
    }
    
    .order-form {
        background: white;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
		border: 1px solid #cde5d1;
    }
    
    .form-section {
        margin-bottom: 30px;
    }
    
    .section-title {
        font-size: 20px;
        font-weight: 600;
        color: #1AA56F;
        margin-bottom: 20px;
        padding-bottom: 10px;
        border-bottom: 2px solid #E8F5E9;
    }
    
    .form-group {
        margin-bottom: 15px;
    }
    
    .form-label {
        display: block;
        margin-bottom: 8px;
        font-weight: 500;
        color: #555;
    }
    
    .form-control {
        width: 100%;
        padding: 10px 15px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 16px;
    }
    
    .form-control:focus {
        border-color: #1AA56F;
        outline: none;
    }
    
    /* 결제 정보 섹션 */
    .payment-methods {
        display: flex;
        gap: 20px;
        flex-wrap: wrap;
        margin-top: 15px;
    }

    .payment-method {
        display: flex;
        align-items: center;
        gap: 10px;
        padding: 15px;
        border: 1px solid #E8F5E9;
        border-radius: 8px;
        flex: 1;
        min-width: 200px;
    }

    .payment-method.selected {
        border-color: #4CAF50;
        background-color: #E8F5E9;
    }

    .payment-icon {
        width: 40px;
        height: 40px;
        object-fit: contain;
    }

    .payment-total {
        background: #F8F9FA;
        padding: 20px;
        border-radius: 8px;
        margin-top: 20px;
        text-align: right;
        font-size: 18px;
        font-weight: 700;
        color: #1AA56F;
    }
    
    .btn-submit {
        display: block;
        width: 100%;
        padding: 12px;
        background: #1EB980;
        color: white;
        border: none;
        border-radius: 4px;
        font-size: 16px;
        font-weight: 500;
        cursor: pointer;
        transition: background 0.3s;
    }
    
    .btn-submit:hover {
        background: #1AA56F;
    }
    #discountAmount {
    color: #FF5722;
    font-weight: bold;
}
.discount-label {
    color: #FF5722;
    font-weight: bold;
}
    @media screen and (max-width: 768px) {
        .container {
            width: 100%;
            padding: 20px 15px;
        }
        
        .payment-methods {
            flex-direction: column;
            gap: 10px;
        }
        
        .payment-method {
            min-width: 100%;
        }
    }
</style>
</head>

<body>
<div style="margin-top: 140px;"></div>
<%@ include file="header.jsp" %>

<%
String no = "";
String name = "";
String qty = request.getParameter("qty");
int price = 0;
int totalPrice = 0;
int deliveryFee = 0;

try {
    String DB_URL = "jdbc:mysql://localhost:3306/project?useSSL=false&characterEncoding=UTF-8&useUnicode=true";
    String DB_ID = "root";  
    String DB_PASSWORD = "1234"; 
    
    Class.forName("org.gjt.mm.mysql.Driver"); 
    Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD); 

	String pNo = request.getParameter("prdNo");
	qty = request.getParameter("qty");
	totalPrice = 0; 
	deliveryFee = 0;
	String nameDB = "";
	String phoneDB = "";
	String addressDB = "";
	String postcodeDB = "";
	String detailAddressDB = "";

if (loginId != null) {
    String sql = "SELECT memName, memPhone, memAddress, postcode, detailAddress FROM member WHERE memId = ?";
    PreparedStatement pstmtMember = con.prepareStatement(sql);
    pstmtMember.setString(1, loginId);
    ResultSet rsMember = pstmtMember.executeQuery();

    if (rsMember.next()) {
        nameDB = rsMember.getString("memName");
        phoneDB = rsMember.getString("memPhone");
        addressDB = rsMember.getString("memAddress");
        postcodeDB = rsMember.getString("postcode");
        detailAddressDB = rsMember.getString("detailAddress");
    }

    rsMember.close();
    pstmtMember.close();
}
// 단일 상품 주문일 경우
if (pNo != null && qty != null) {
    if (qty.equals("")) qty = "1";

    String jsql = "SELECT * FROM goods WHERE prdNo = ?";
    PreparedStatement pstmt = con.prepareStatement(jsql);
    pstmt.setString(1, pNo);
    ResultSet rs = pstmt.executeQuery();

    if (!rs.next()) {
        response.sendRedirect("viewProduct.jsp");
        return;
    }

   no = rs.getString("prdNo");
name = rs.getString("prdName");
price = rs.getInt("prdPrice");

    totalPrice = price * Integer.parseInt(qty);
    deliveryFee = totalPrice >= 1000 ? 0 : 3000;

    // 단일 상품용 화면에 사용할 변수 설정해두기
    request.setAttribute("single", true);
    request.setAttribute("no", no);
    request.setAttribute("name", name);
    request.setAttribute("qty", qty);
    request.setAttribute("price", price);

    rs.close();
    pstmt.close();
} else {
    // 장바구니 기반 주문일 경우
    List<Map<String, Object>> cartItems = (List<Map<String, Object>>) session.getAttribute("cartItems");

    if (cartItems == null || cartItems.isEmpty()) {
        response.sendRedirect("viewProduct.jsp");
        return;
    }

    for (Map<String, Object> item : cartItems) {
         int cartPrice = (int) item.get("prdPrice");
        int quantity = (int) item.get("ctQty");
        totalPrice += cartPrice * quantity;
    }
    deliveryFee = totalPrice >= 1000 ? 0 : 3000;
    request.setAttribute("single", false);
}

%>

<div class="container">
    <div class="order-header">
        <h1>주문 정보 입력</h1>
    </div>
    
    <div class="order-step">
        <div class="step active">
            <div class="step-number">1</div>
            <div class="step-title">주문 정보 입력</div>
        </div>
        <div class="step">
            <div class="step-number">2</div>
            <div class="step-title">주문 확인</div>
        </div>
        <div class="step">
            <div class="step-number">3</div>
            <div class="step-title">주문 완료</div>
        </div>
    </div>
    
    <!-- 상품 요약 정보 섹션 (세로 정렬) -->
    <div class="product-summary">
	<%
    boolean isSingle = (Boolean) request.getAttribute("single");
    if (isSingle) {
    %>

        <div class="product-summary-row">
            <span class="product-summary-label">상품명</span>
            <span class="product-summary-value"><%=name%></span>
        </div>
        <div class="product-summary-row">
            <span class="product-summary-label">수량</span>
            <span class="product-summary-value"><%=qty%>개</span>
        </div>
        <div class="product-summary-row">
            <span class="product-summary-label">상품 가격</span>
            <span class="product-summary-value product-price"><%=String.format("%,d", price)%>원</span>
        </div>
		 <%
    } else {
        List<Map<String, Object>> cartItems = (List<Map<String, Object>>) session.getAttribute("cartItems");
        for (Map<String, Object> item : cartItems) {
            String pname = (String) item.get("prdName");
            int pqty = (int) item.get("ctQty");
            int pprice = (int) item.get("prdPrice");
    %>
        <div class="product-summary-row">
            <span class="product-summary-label">상품명</span>
            <span class="product-summary-value"><%= pname %></span>
        </div>
        <div class="product-summary-row">
            <span class="product-summary-label">수량</span>
            <span class="product-summary-value"><%= pqty %>개</span>
        </div>
        <div class="product-summary-row" style="border-bottom: 2px dotted #ccc;">
            <span class="product-summary-label">가격</span>
            <span class="product-summary-value product-price"><%= String.format("%,d", pprice * pqty) %>원</span>
        </div>
    <%
        }
    }
    %>
        <div class="product-summary-row">
            <span class="product-summary-label">주문 금액</span>
            <span class="product-summary-value product-price"><%=String.format("%,d", totalPrice)%>원</span>
        </div>
        <div class="product-summary-row">
            <span class="product-summary-label">배송비</span>
            <span class="product-summary-value"><%=deliveryFee == 0 ? "무료" : "3,000원"%></span>
        </div>
    </div>
    
    <form id="orderForm" action="kakaopay.jsp" method="post" class="order-form">
        <input type="hidden" name="prdNo" value="<%=no%>">
        <input type="hidden" name="qty" value="<%=qty%>">
        
        <div class="form-section">
            <h3 class="section-title">배송 정보</h3>
            
           <div class="form-group">
    <label for="receiver" class="form-label">받는 분 성함</label>
    <input type="text" id="receiver" name="receiver" class="form-control" required value="<%= nameDB %>">
</div>

<div class="form-group">
    <label for="phone" class="form-label">휴대폰 번호</label>
    <input type="text" id="phone" name="phone" class="form-control" placeholder="예) 010-1234-5678" required value="<%= phoneDB %>">
</div>

<div class="form-group">
    <label for="postcode" class="form-label">우편번호</label>
    <div style="display: flex; gap: 10px;">
        <input type="text" id="postcode" name="postcode" class="form-control" style="flex: 1;" required value="<%= postcodeDB %>">
        <button type="button" onclick="execDaumPostcode()" style="padding: 0 15px; background: #E8F5E9; border: none; border-radius: 4px; color: #1AA56F; cursor: pointer;">주소 찾기</button>
    </div>
</div>

<div class="form-group">
    <label for="address" class="form-label">주소</label>
    <input type="text" id="address" name="address" class="form-control" required value="<%= addressDB %>">
</div>

<div class="form-group">
    <label for="detailAddress" class="form-label">상세 주소</label>
    <input type="text" id="detailAddress" name="detailAddress" class="form-control" value="<%= detailAddressDB %>">
</div>

            
            <div class="form-group">
                <label for="deliveryMemo" class="form-label">배송 메모</label>
                <select id="deliveryMemo" name="deliveryMemo" class="form-control">
                    <option value="">배송 시 요청사항을 선택해주세요</option>
                    <option value="문 앞에 놓아주세요">문 앞에 놓아주세요</option>
                    <option value="경비실에 맡겨주세요">경비실에 맡겨주세요</option>
                    <option value="배송 전 연락 바랍니다">배송 전 연락 바랍니다</option>
                    <option value="직접 입력">직접 입력</option>
                </select>
                <input type="text" id="customMemo" name="customMemo" class="form-control" style="margin-top: 10px; display: none;" placeholder="요청사항을 입력해주세요">
            </div>
        </div>
        <div class="form-section">
    <h3 class="section-title">쿠폰 적용</h3>
    <div class="form-group">
        <label for="coupon" class="form-label">쿠폰 선택</label>
        <select id="coupon" name="coupon" class="form-control" onchange="calculateDiscount()">
            <option value="0" data-discount="0">쿠폰을 선택해주세요</option>
            <% 
            try {
                Class.forName("org.gjt.mm.mysql.Driver");
                Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "1234");
                String sql2 = "SELECT * FROM coupon WHERE memId = ?";
                PreparedStatement pstmt2 = con2.prepareStatement(sql2);
                pstmt2.setString(1,loginId); 
                ResultSet rs2 = pstmt2.executeQuery();
                while(rs2.next()) {
                    int discount = rs2.getInt("discount");
                    String code = rs2.getString("couponCode");
            %>
                    <option value="<%= code %>" data-discount="<%= discount %>">
                        <%= code %> (<%= discount %>% 할인)
                    </option>
            <%
                }
                rs2.close();
                pstmt2.close();
                con2.close();
            } catch(Exception e) { e.printStackTrace(); }
            %>
        </select>
        <input type="hidden" id="selectedCouponCode" name="selectedCouponCode" value="0">
    </div>
</div>

        <div class="form-section">
            <h3 class="section-title">결제 정보</h3>
            
            <!-- 결제 방법 선택 (가로 정렬 + 아이콘) -->
            <div class="payment-methods">
                <label class="payment-method">
					<input type="radio" name="paymentMethod" value="credit" checked>
					<img src="./images/credit-card.png" alt="신용카드" class="payment-icon">
					<span>신용카드</span>
				</label>
				<label class="payment-method">
					<input type="radio" name="paymentMethod" value="kakao">
					<img src="./images/kakaopay.png" alt="카카오페이" class="payment-icon">
					<span>카카오페이</span>
				</label>
            </div>
            
            <!-- 최종 결제 금액 표시 -->
            <div class="payment-total" id="discountInfo">
    <span class="discount-label">쿠폰 할인: </span><strong id="discountAmount">0원</strong><br>
    총 결제 금액: <strong id="finalAmount"><%= String.format("%,d", totalPrice + deliveryFee) %>원</strong>
    <input type="hidden" id="finalAmountInput" name="finalAmount" value="<%= totalPrice + deliveryFee %>">
    <div style="font-size: 14px; color: #777; margin-top: 5px;">
        (상품금액 <%= String.format("%,d", totalPrice) %>원 + 배송비 <%= deliveryFee == 0 ? "무료" : "3,000원" %>)
    </div>
</div>

        
        <button type="submit" class="btn-submit">주문 확인</button>
    </form>
</div>

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
    
    document.getElementById('deliveryMemo').addEventListener('change', function() {
        var customMemo = document.getElementById('customMemo');
        if(this.value === '직접 입력') {
            customMemo.style.display = 'block';
            customMemo.required = true;
        } else {
            customMemo.style.display = 'none';
            customMemo.required = false;
        }
    });
</script>
<script>
function calculateDiscount() {
    const select = document.getElementById("coupon");
    const discountRate = parseInt(select.options[select.selectedIndex].dataset.discount || 0);

    const productPrice = <%= totalPrice %>;
    const deliveryFee = <%= deliveryFee %>;

    const discountAmount = Math.floor(productPrice * discountRate / 100);
    const finalAmount = productPrice - discountAmount + deliveryFee;

    document.getElementById("discountAmount").innerText = discountAmount.toLocaleString() + "원";
    document.getElementById("finalAmount").innerText = finalAmount.toLocaleString() + "원";
    document.getElementById("selectedCouponCode").value = select.value;
    document.getElementById("finalAmountInput").value = finalAmount;
}
</script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.getElementById('orderForm');
        const paymentMethods = document.getElementsByName('paymentMethod');
        
        form.addEventListener('submit', function(e) {
            e.preventDefault();
            
            // 선택된 결제 방법 확인
            let selectedMethod;
            for (let method of paymentMethods) {
                if (method.checked) {
                    selectedMethod = method.value;
                    break;
                }
            }
            
            // 결제 방법에 따라 폼 제출 경로 변경
            if (selectedMethod === 'bank') {
                form.action = "toss_vbank.jsp";  // 무통장 입금(가상계좌) 처리 페이지
            } else if (selectedMethod === 'kakao') {
                form.action = "kakaopay.jsp";  // 카카오페이 처리 페이지
            } else {
                form.action = "creditcard.jsp?step=input";  // 신용카드 처리 페이지 (step 파라미터 추가)
            }
            
            form.submit();
        });
    });
</script>
<%
    } catch(Exception e) {
        out.println(e);
    }
%>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>