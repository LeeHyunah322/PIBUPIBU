<%@ page contentType="text/html;charset=euc-kr" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="EUC-KR">
    <title>상품 등록</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color: #333;
            text-align: center;
        }

        .admin-header {
            background-color: #1EB980;
            color: white;
            padding: 40px 0;
            margin-bottom: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .admin-header h1 {
            font-size: 36px;
            margin: 0;
            font-weight: bold;
            letter-spacing: 1px;
        }

        form {
            margin: 0 auto;
            width: 90%;
            max-width: 800px;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            text-align: left;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            1: 18px;
        }

        td:first-child {
            width: 30%;
            font-weight: bold;
            color: #1EB980;
        }

        input[type="text"], select, textarea {
            width: 95%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 18px;
        }
		.input-inline {
			display: flex;
			align-items: center;
			gap: 8px;
		}

	    .input-inline input[type="text"] {
			width: 150px;
		}

        textarea {
            resize: vertical;
        }

        .form-buttons {
            margin-top: 20px;
            text-align: center;
        }
			
        .form-buttons input[type="submit"],
        .form-buttons input[type="reset"],
        .form-buttons a {
            display: inline-block;
            margin: 10px;
            padding: 12px 30px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 30px;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .form-buttons input[type="submit"] {
            background-color: #1EB980;
            color: white;
            border: none;
        }

        .form-buttons input[type="submit"]:hover {
            background-color: #17a36d;
        }

        .form-buttons input[type="reset"] {
            background-color: #6c757d;
            color: white;
            border: none;
        }

        .form-buttons input[type="reset"]:hover {
            background-color: #5a6268;
        }

        .form-buttons a {
            background-color: #ffc107;
            color: white;
        }

        .form-buttons a:hover {
            background-color: #e0a800;
        }
    </style>
</head>

<body>

<div class="admin-header">
    <h1>상품 등록</h1>
</div>

<form method="post" action="insertGoodsResult.jsp">
    <table>
        <tr>
            <td>카테고리 분류</td>
            <td>
                <select name="ctg">
                    <option value="category1">건성</option>
                    <option value="category2">지성</option>
                    <option value="category3">중성</option>
                    <option value="category4">민감성</option>
                    <option value="category5">복합성</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>상품번호</td>
            <td><input type="text" name="no"></td>
        </tr>
        <tr>
            <td>상품명</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
    <td>상품가격</td>
    <td>
        <div class="input-inline">
            <input type="text" name="price"> <span>원</span>
        </div>
    </td>
</tr>
<tr>
    <td>재고수량</td>
    <td>
        <div class="input-inline">
            <input type="text" name="stock"> <span>개</span>
        </div>
    </td>
</tr>
        <tr>
            <td>상세설명</td>
            <td><input type="text" name="summary"></td>
        </tr>
        <tr>
            <td>상품설명</td>
            <td><textarea name="description" rows="5" cols="30"></textarea></td>
        </tr>
    </table>

    <div class="form-buttons">
        <input type="submit" value="상품 등록">
        <input type="reset" value="취소">
        <a href="goods.jsp"><i class="fas fa-arrow-left"></i> 상품 관리로 돌아가기</a>
    </div>
</form>

</body>
</html>
