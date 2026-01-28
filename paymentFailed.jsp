<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>결제 실패</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Noto Sans KR', sans-serif;
        }
        
        body {
            background-color: #f5f5f5;
            color: #333;
            line-height: 1.6;
        }
        
        .container {
            width: 95%;
            max-width: 600px;
            margin: 0 auto;
            padding: 40px 0;
        }
        
        .error-header {
            text-align: center;
            margin-bottom: 40px;
        }
        
        .error-header h1 {
            color: #D32F2F;
            font-weight: 500;
            margin-bottom: 15px;
        }
        
        .error-icon {
            font-size: 80px;
            color: #D32F2F;
            margin-bottom: 20px;
        }
        
        .error-message {
            text-align: center;
            font-size: 18px;
            margin-bottom: 30px;
            color: #555;
        }
        
        .error-detail {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            margin-bottom: 30px;
            color: #D32F2F;
            text-align: center;
        }
        
        .btn-group {
            display: flex;
            justify-content: center;
            gap: 15px;
        }
        
        .btn {
            display: inline-block;
            padding: 12px 25px;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.3s;
            text-align: center;
            text-decoration: none;
        }
        
        .btn-retry {
            background: #D32F2F;
            color: white;
            border: none;
        }
        
        .btn-retry:hover {
            background: #B71C1C;
        }
        
        .btn-home {
            background: #f5f5f5;
            color: #333;
            border: 1px solid #ddd;
        }
        
        .btn-home:hover {
            background: #e0e0e0;
        }
    </style>
</head>
<body>
<div style="margin-top: 140px;"></div>
<%@ include file="header.jsp" %>

<div class="container">
    <div class="error-header">
        <div class="error-icon">✕</div>
        <h1>결제에 실패했습니다</h1>
        <p class="error-message">결제 과정에서 문제가 발생했습니다. 아래 버튼을 통해 다시 시도해 주세요.</p>
    </div>
    
    <div class="btn-group">
        <button onclick="history.back()" class="btn btn-retry">다시 시도</button>
        <a href="index.jsp" class="btn btn-home">홈으로 이동</a>
    </div>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>