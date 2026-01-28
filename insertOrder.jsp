<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*, java.text.SimpleDateFormat, java.util.Date" %>
<%
    String loginId = (String) session.getAttribute("sid");
    if (loginId == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    request.setCharacterEncoding("UTF-8");

    String receiver = request.getParameter("receiver");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String pay = request.getParameter("paymentMethod");
    String bank = request.getParameter("cardBank");
    String cardNo = request.getParameter("cardNo");
    String cardPass = request.getParameter("cardPass");
    String cvc = request.getParameter("cardCvc");
    String prdNo = request.getParameter("prdNo");
    String qty = request.getParameter("qty");
    String finalAmount = request.getParameter("finalAmount");

    String ordNo = "ORD_" + loginId + "_" + new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());

    try {
        String DB_URL = "jdbc:mysql://localhost:3306/project";
        String DB_ID = "root";
        String DB_PASSWORD = "1234";

        Class.forName("org.gjt.mm.mysql.Driver");
        Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

        String loginId = (String) session.getAttribute("sid");
        String receiver = request.getParameter("receiver");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String pay = request.getParameter("pay");
        String bank = request.getParameter("bank"); // 무통장 입금 시 은행
        String cardNo = request.getParameter("cardNo"); // 카드 결제 시 카드 번호
        String cardPass = request.getParameter("cardPass"); // 카드 결제 시 카드 비밀번호
        String cvc = request.getParameter("cvc"); // 카드 결제 시 CVC
        String cardBank = request.getParameter("cardBank"); // 카드 결제 시 카드사
        String finalAmount = request.getParameter("finalAmount"); // 최종 결제 금액
        String prdNo = request.getParameter("prdNo"); // 단일 상품 주문 시 상품 번호
        String qty = request.getParameter("qty"); // 단일 상품 주문 시 수량

        // 배송 메모 값 가져오기 (customMemo 우선, 없으면 deliveryMemo 사용)
        String deliveryMemo = request.getParameter("customMemo");
        if (deliveryMemo == null || deliveryMemo.trim().isEmpty()) {
            deliveryMemo = request.getParameter("deliveryMemo");
        }
        // 값이 없을 경우 기본값 설정
        if (deliveryMemo == null || deliveryMemo.trim().isEmpty()) {
            deliveryMemo = "요청사항 없음";
        }


        // 주문 번호 생성 (예시: 타임스탬프 + 랜덤 숫자)
        String ordNo = System.currentTimeMillis() + "" + (int)(Math.random() * 1000);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String now = sdf.format(new Date());

        // SQL 쿼리에 deliveryMemo 컬럼 추가
        String sql = "INSERT INTO orderinfo (ordNo, memId, ordDate, ordReceiver, ordRcvAddress, ordRcvPhone, ordPay, ordBank, ordCardNo, ordCardPass, cardCvc, cardBank, deliveryMemo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setString(1, ordNo);
        pstmt.setString(2, loginId);
        pstmt.setString(3, now);
        pstmt.setString(4, receiver);
        pstmt.setString(5, address);
        pstmt.setString(6, phone);
        pstmt.setString(7, pay);

        if ("bank".equals(pay)) {
            pstmt.setString(8, bank);
            pstmt.setString(9, null);
            pstmt.setString(10, null);
            pstmt.setString(11, null);
            pstmt.setString(12, null);
        } else { // 카드 결제 등
            pstmt.setString(8, null);
            pstmt.setString(9, cardNo);
            pstmt.setString(10, cardPass);
            pstmt.setString(11, cvc);
            pstmt.setString(12, cardBank);
        }
        pstmt.setString(13, deliveryMemo); // deliveryMemo 값 설정

        pstmt.executeUpdate();
        pstmt.close();

        if (prdNo != null && qty != null) {
            sql = "INSERT INTO orderproduct (ordNo, prdNo, ordQty) VALUES (?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, ordNo);
            pstmt.setString(2, prdNo);
            pstmt.setInt(3, Integer.parseInt(qty));
            pstmt.executeUpdate();
            pstmt.close();
        }

        con.close();

        response.sendRedirect("paymentSuccess.jsp?orderId=" + ordNo + "&amount=" + finalAmount + "&prdNo=" + prdNo + "&qty=" + qty);
    } catch(Exception e) {
        out.println("DB 오류: " + e.getMessage());
    }
%>