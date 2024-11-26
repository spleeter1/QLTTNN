<%-- 
    Document   : ConfirmPersonalInfor.jsp
    Created on : Nov 26, 2024, 4:32:36 PM
    Author     : NAMPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xác nhận</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                margin: 0;
                padding: 0;
            }
            .container {
                width: 40%;
                margin: 100px auto;
                padding: 30px;
                background-color: white;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }
            .title {
                font-size: 24px;
                font-weight: bold;
                text-align: center;
                margin-bottom: 20px;
            }
            .message {
                font-size: 18px;
                text-align: center;
                margin-bottom: 30px;
                color: #333;
            }
            .button-container {
                display: flex;
                justify-content: center;
                gap: 20px;
            }
            button {
                padding: 10px 20px;
                font-size: 16px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .confirm-button {
                background-color: #4CAF50;
                color: white;
            }
            .confirm-button:hover {
                background-color: #45a049;
            }
            .cancel-button {
                background-color: #f44336;
                color: white;
            }
            .cancel-button:hover {
                background-color: #e53935;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="title">Xác nhận hành động</div>
            <div class="message">
                Bạn có chắc chắn muốn lưu thay đổi thông tin cá nhân không?
            </div>
            <div class="button-container">
                <form action="personalInfor.jsp" method="post">
                    <button type="submit" name="action" value="confirm" class="confirm-button">Có</button>
                </form>
                <a href="personalInfor.jsp">
                    <button class="cancel-button">Không</button>
                </a>
            </div>
        </div>
    </body>
</html>