<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
<%
    String loginId = (String) session.getAttribute("sid");
    if (loginId == null) {
        response.sendRedirect("login.jsp?redirect=orderDetail.jsp");
        return;
    }

    // 주문 번호 파라미터 확인
    String ordNo = request.getParameter("ordNo");
    if (ordNo == null || ordNo.trim().isEmpty()) {
        response.sendRedirect("mypage.jsp");
        return;
    }
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>주문 상세 내역</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #fff;
            margin: 0;
            padding: 40px;
            color: #333;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.1);
        }
        h1 {
            color: #1AA56F;
            margin-bottom: 30px;
            font-size: 28px;
            text-align: center;
        }
        .section {
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid #eee;
        }
        .section:last-child {
            border-bottom: none;
        }
        .section-title {
            font-size: 20px;
            font-weight: 600;
            color: #444;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 2px solid #E8F5E9;
        }
        .order-info {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }
        .info-group {
            margin-bottom: 15px;
        }
        .info-label {
            font-weight: 500;
            color: #666;
            margin-bottom: 5px;
        }
        .info-value {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #E8F5E9;
            color: #777;
        }
        .product-name {
            text-align: left;
        }
        .total-row {
            font-weight: 600;
            background-color: #f9f9f9;
        }
        .status-badge {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 500;
            background-color: #E8F5E9;
            color: #1AA56F;
        }
        .btn-back {
            display: block;
            width: 200px;
            margin: 30px auto 0;
            padding: 12px 20px;
            background: #1EB980;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 4px;
            font-weight: 500;
            transition: background 0.3s;
        }
        .btn-back:hover {
            background: #1AA56F;
        }
        @media screen and (max-width: 768px) {
            body {
                padding: 20px;
            }
            .container {
                padding: 20px;
            }
            .order-info {
                grid-template-columns: 1fr;
            }
            .btn-back {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<div style="margin-top: 200px;"></div>
<%@ include file="header.jsp" %>

<div class="container">
    <h1>주문 상세 내역</h1>
    
    <%
        String DB_URL = "jdbc:mysql://localhost:3306/project?useSSL=false&characterEncoding=UTF-8&useUnicode=true";
        String DB_ID = "root";
        String DB_PASSWORD = "1234";
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
            
            // 주문 기본 정보 조회
            String orderInfoSql = "SELECT oi.*, op.prdNo, g.prdName, op.ordQty, g.prdPrice " +
                                "FROM orderInfo oi " +
                                "LEFT JOIN orderProduct op ON oi.ordNo = op.ordNo " +
                                "LEFT JOIN goods g ON op.prdNo = g.prdNo " +
                                "WHERE oi.ordNo = ? AND oi.memId = ?";
            pstmt = conn.prepareStatement(orderInfoSql);
            pstmt.setString(1, ordNo);
            pstmt.setString(2, loginId);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                String ordDate = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss").format(rs.getTimestamp("ordDate"));
                String ordReceiver = rs.getString("ordReceiver");
                String ordRcvAddress = rs.getString("ordRcvAddress");
                String ordRcvPhone = rs.getString("ordRcvPhone");
                int ordPay = rs.getInt("ordPay");
                String ordStatus = rs.getString("ordStatus");
                String paymentKey = rs.getString("paymentKey");
                String cardNo = rs.getString("ordCardNo");
                
                if (ordStatus == null || ordStatus.isEmpty()) {
                    ordStatus = "배송 준비중";
                }
                
                // 주문 기본 정보 출력
                %>
                <div class='section'>
                    <h2 class='section-title'>주문 정보</h2>
                    <div class='order-info'>
                        <div>
                            <div class='info-group'>
                                <div class='info-label'>주문 번호</div>
                                <div class='info-value'><%=ordNo%></div>
                            </div>
                            <div class='info-group'>
                                <div class='info-label'>주문 일시</div>
                                <div class='info-value'><%=ordDate%></div>
                            </div>
                            <div class='info-group'>
                                <div class='info-label'>주문 상태</div>
                                <div class='info-value'><span class='status-badge'><%=ordStatus%></span></div>
                            </div>
                        </div>
                        
                        <div>
                            <div class='info-group'>
                                <div class='info-label'>수령인</div>
                                <div class='info-value'><%=ordReceiver%></div>
                            </div>
                            <div class='info-group'>
                                <div class='info-label'>연락처</div>
                                <div class='info-value'><%=ordRcvPhone%></div>
                            </div>
                            <div class='info-group'>
                                <div class='info-label'>배송지</div>
                                <div class='info-value'><%=ordRcvAddress%></div>
                            </div>
							<div class='info-group'>
                                <div class='info-label'>배송 메모</div>
                                <div class='info-value'><%= rs.getString("deliveryMemo") %></div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class='section'>
                    <h2 class='section-title'>주문 상품</h2>
                    <table>
                        <tr>
                            <th>상품명</th>
                            <th>수량</th>
                            <th>단가</th>
                            <th>금액</th>
                        </tr>
                        <%
                        // 주문 상품 정보를 저장할 변수들
                        int totalAmount = 0;
                        do {
                            String prdNo = rs.getString("prdNo");
                            String prdName = rs.getString("prdName");
                            int ordQty = rs.getInt("ordQty");
                            int prdPrice = rs.getInt("prdPrice");
                            int itemTotal = ordQty * prdPrice;
                            totalAmount += itemTotal;
                            
                            if (prdNo != null && prdName != null) {
                                %>
                                <tr>
                                    <td class='product-name'>
                                        <a href='viewDetailProduct.jsp?prdNo=<%=prdNo%>' style='color:#1AA56F; text-decoration:none;'>
                                            <%=prdName%>
                                        </a>
                                    </td>
                                    <td><%=ordQty%></td>
                                    <td><%=String.format("%,d원", prdPrice)%></td>
                                    <td><%=String.format("%,d원", itemTotal)%></td>
                                </tr>
                                <%
                            }
                        } while(rs.next());
                        
						int calculatedDeliveryFee = totalAmount >= 1000 ? 0 : 3000;
                        // 할인금액 계산
                        int discountAmount = totalAmount - ordPay;
                        %>
                        
                        <tr class='total-row'>
                            <td colspan='3' style='text-align:right;'>상품 금액 합계</td>
                            <td><%=String.format("%,d원", totalAmount)%></td>
                        </tr>
                        
                        <% if (discountAmount > 0) { %>
                        <tr class='total-row'>
                            <td colspan='3' style='text-align:right;'>쿠폰 할인</td>
                            <td>-<%=String.format("%,d원", discountAmount)%></td>
                        </tr>
                        <% } %>
							<tr class='total-row'>
                            <td colspan='3' style='text-align:right;'>배송비</td>
                            <td><%=calculatedDeliveryFee == 0 ? "무료" : String.format("%,d원", calculatedDeliveryFee)%></td>
                        </tr>
                    
                        <tr class='total-row'>
                            <td colspan='3' style='text-align:right;'>최종 결제 금액</td>
                            <td style='color:#b30000; font-weight:bold;'><%=String.format("%,d원", ordPay)%></td>
                        </tr>
                    </table>
                </div>
                
                <div class='section'>
                    <h2 class='section-title'>결제 정보</h2>
                    <div class='order-info'>
                        <div>
                            <div class='info-group'>
                                <div class='info-label'>결제 방법</div>
                                <div class='info-value'>
                                    <%=(paymentKey != null && !paymentKey.isEmpty()) ? "카카오페이" : "신용카드"%>
                                </div>
                            </div>
                            
                            <% if (cardNo != null && !cardNo.isEmpty()) { 
                                // 카드번호 마스킹 처리
                                String maskedCardNo = "";
                                if (cardNo.length() >= 12) {
                                    maskedCardNo = cardNo.substring(0, 6) + "******" + cardNo.substring(cardNo.length() - 4);
                                } else {
                                    maskedCardNo = "********" + cardNo.substring(Math.max(0, cardNo.length() - 4));
                                }
                            %>
                            <div class='info-group'>
                                <div class='info-label'>카드 정보</div>
                                <div class='info-value'><%=maskedCardNo%></div>
                            </div>
                            <% } %>
                        </div>
                        
                        <div>
                            <div class='info-group'>
                                <div class='info-label'>결제 금액</div>
                                <div class='info-value'><%=String.format("%,d원", ordPay)%></div>
                            </div>
                            <div class='info-group'>
                                <div class='info-label'>결제 일시</div>
                                <div class='info-value'><%=ordDate%></div>
                            </div>
                        </div>
                    </div>
                </div>
                <%
            } else {
                %>
                <div class='section'>
                    <p style='text-align:center; color:#b30000;'>주문 정보를 찾을 수 없거나 접근 권한이 없습니다.</p>
                </div>
                <%
            }
            
        } catch (Exception e) {
            %>
            <div class='section'>
                <p style='text-align:center; color:#b30000;'>오류 발생: <%=e.getMessage()%></p>
            </div>
            <%
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (Exception e) {}
            if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
            if (conn != null) try { conn.close(); } catch (Exception e) {}
        }
    %>
    
    <a href="mypage.jsp" class="btn-back">마이페이지로 돌아가기</a>
</div>

<div style="margin-bottom: 160px;"></div>
<%@ include file="footer.jsp" %>
</body>
</html>