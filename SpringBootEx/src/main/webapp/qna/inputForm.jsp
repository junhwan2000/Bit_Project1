<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>1:1 문의하기</title>
    <style>
        body {
            font-family: 'Apple SD Gothic Neo', sans-serif;
            background-color: #fff;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #e0e0e0;
            padding: 20px;
            text-align: right;
            font-weight: bold;
            font-size: 20px;
        }

        .navbar {
            background-color: #ddd;
            padding: 10px;
            text-align: center;
        }

        .container {
            max-width: 700px;
            margin: 40px auto;
            padding: 20px;
        }

        h2 {
            font-size: 24px;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-top: 20px;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .required {
            color: red;
        }

        input[type="text"],
        input[type="file"],
        textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 25px;
            box-sizing: border-box;
            font-size: 14px;
        }

        textarea {
            height: 150px;
            border-radius: 15px;
            resize: none;
        }

        .char-count {
            text-align: right;
            font-size: 12px;
            color: #777;
            margin-top: 5px;
        }

        .form-bottom {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }

        .submit-btn {
            padding: 10px 25px;
            font-size: 14px;
            border: 1px solid #ccc;
            background-color: white;
            border-radius: 20px;
            cursor: pointer;
        }

        .submit-btn:hover {
            background-color: #eee;
        }

        .file-upload-wrapper {
            display: flex;
            align-items: center;
            gap: 10px;
        }
    </style>
    <script>
        function updateCharCount() {
            const textarea = document.getElementById('content');
            const count = textarea.value.length;
            const max = 5000;
            document.getElementById('charCount').innerText = count + ' / ' + max;
        }
    </script>
</head>
<body>
<div class="header">com.fruit</div>
<div class="navbar">Nav Bar</div>
<div class="container">
    <h2>1:1 문의하기</h2>
    <form action="submitInquiry.do" method="post" enctype="multipart/form-data">
        <label for="name">이름 <span class="required">*</span></label>
        <input type="text" name="name" placeholder="Nickname" required>

        <label for="title">문의 내용 <span class="required">*</span></label>
        <input type="text" name="title" placeholder="제목을 입력해주세요" required>

        <textarea id="content" name="content" placeholder="문의 내용을 자세히 입력해주세요" maxlength="5000"
                  onkeyup="updateCharCount()" required></textarea>
        <div class="char-count" id="charCount">0 / 5,000</div>

        <label for="file">첨부 파일</label>
        <div class="file-upload-wrapper">
            <input type="file" name="file">
        </div>

        <div class="form-bottom">
            <div></div>
            <input type="submit" class="submit-btn" value="문의하기">
        </div>
    </form>
</div>
</body>
</html>
