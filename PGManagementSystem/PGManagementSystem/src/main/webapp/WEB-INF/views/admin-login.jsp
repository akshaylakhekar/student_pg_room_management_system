<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Admin Login - PG Management System</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: Arial, Helvetica, sans-serif;
            background: #f4f7fb;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-wrapper {
            width: 100%;
            max-width: 430px;
            padding: 20px;
        }

        .login-card {
            background: white;
            border-radius: 14px;
            padding: 35px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.10);
            border: 1px solid #e2e8f0;
        }

        .logo {
            width: 65px;
            height: 65px;
            margin: 0 auto 18px;
            background: #2563eb;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 27px;
            font-weight: bold;
        }

        h1 {
            text-align: center;
            margin: 0 0 8px;
            font-size: 26px;
            color: #1e293b;
        }

        .subtitle {
            text-align: center;
            color: #64748b;
            font-size: 14px;
            margin-bottom: 28px;
        }

        .error {
            background: #fef2f2;
            border: 1px solid #fecaca;
            color: #dc2626;
            padding: 12px;
            border-radius: 7px;
            margin-bottom: 20px;
            font-size: 14px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 18px;
        }

        label {
            display: block;
            margin-bottom: 7px;
            color: #334155;
            font-size: 14px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 12px 13px;
            border: 1px solid #cbd5e1;
            border-radius: 7px;
            font-size: 14px;
            outline: none;
        }

        input:focus {
            border-color: #2563eb;
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.10);
        }

        .login-btn {
            width: 100%;
            border: none;
            padding: 13px;
            border-radius: 7px;
            background: #2563eb;
            color: white;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 5px;
        }

        .login-btn:hover {
            background: #1d4ed8;
        }

        .back-home {
            text-align: center;
            margin-top: 22px;
        }

        .back-home a {
            color: #2563eb;
            text-decoration: none;
            font-size: 14px;
        }

        .back-home a:hover {
            text-decoration: underline;
        }

        .demo-info {
            margin-top: 25px;
            padding: 14px;
            background: #eff6ff;
            border: 1px solid #bfdbfe;
            border-radius: 7px;
            color: #1e40af;
            font-size: 13px;
            line-height: 1.6;
        }

        .demo-info strong {
            color: #1e3a8a;
        }

        @media (max-width: 500px) {

            .login-wrapper {
                padding: 15px;
            }

            .login-card {
                padding: 27px 22px;
            }

            h1 {
                font-size: 23px;
            }

        }

    </style>

</head>

<body>


    <div class="login-wrapper">

        <div class="login-card">


            <div class="logo">
                A
            </div>


            <h1>
                Admin Login
            </h1>


            <div class="subtitle">
                PG Management System
            </div>


            <%
                String errorMessage =
                        (String) request.getAttribute("errorMessage");

                if (errorMessage != null) {
            %>

                <div class="error">
                    <%= errorMessage %>
                </div>

            <%
                }
            %>


            <form
                action="${pageContext.request.contextPath}/admin/login"
                method="post">


                <div class="form-group">

                    <label for="username">
                        Username
                    </label>

                    <input
                        type="text"
                        id="username"
                        name="username"
                        placeholder="Enter username"
                        required
                        autocomplete="username">

                </div>


                <div class="form-group">

                    <label for="password">
                        Password
                    </label>

                    <input
                        type="password"
                        id="password"
                        name="password"
                        placeholder="Enter password"
                        required
                        autocomplete="current-password">

                </div>


                <button
                    type="submit"
                    class="login-btn">

                    Login as Admin

                </button>


            </form>


            <div class="demo-info">

                <strong>Demo Login</strong><br>

                Username: admin<br>

                Password: admin123

            </div>


            <div class="back-home">

                <a href="${pageContext.request.contextPath}/">
                    ← Back to Home
                </a>

            </div>


        </div>

    </div>


</body>

</html>