<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Student Login - PG Management System</title>

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
            border: 1px solid #e2e8f0;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.10);
        }

        .logo {
            width: 65px;
            height: 65px;
            margin: 0 auto 18px;
            background: #16a34a;
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
            border-color: #16a34a;
            box-shadow: 0 0 0 3px rgba(22, 163, 74, 0.10);
        }

        .login-btn {
            width: 100%;
            border: none;
            padding: 13px;
            border-radius: 7px;
            background: #16a34a;
            color: white;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 5px;
        }

        .login-btn:hover {
            background: #15803d;
        }

        .register {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #64748b;
        }

        .register a {
            color: #2563eb;
            text-decoration: none;
            font-weight: bold;
        }

        .register a:hover {
            text-decoration: underline;
        }

        .back-home {
            text-align: center;
            margin-top: 18px;
        }

        .back-home a {
            color: #64748b;
            text-decoration: none;
            font-size: 14px;
        }

        .back-home a:hover {
            color: #2563eb;
        }

        .demo-info {
            margin-top: 23px;
            padding: 14px;
            background: #f0fdf4;
            border: 1px solid #bbf7d0;
            border-radius: 7px;
            color: #166534;
            font-size: 13px;
            line-height: 1.6;
        }

        .demo-info strong {
            color: #14532d;
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
                S
            </div>


            <h1>
                Student Login
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
                action="${pageContext.request.contextPath}/student/login"
                method="post">


                <div class="form-group">

                    <label for="email">
                        Email Address
                    </label>

                    <input
                        type="email"
                        id="email"
                        name="email"
                        placeholder="Enter your email"
                        required
                        autocomplete="email">

                </div>


                <div class="form-group">

                    <label for="password">
                        Password
                    </label>

                    <input
                        type="password"
                        id="password"
                        name="password"
                        placeholder="Enter your password"
                        required
                        autocomplete="current-password">

                </div>


                <button
                    type="submit"
                    class="login-btn">

                    Login as Student

                </button>


            </form>


            <div class="register">

                Don't have an account?

                <a
                    href="${pageContext.request.contextPath}/student/add">

                    Register here

                </a>

            </div>


            <div class="demo-info">

                <strong>Existing Student</strong><br>

                Existing students have default password:
                <strong>student123</strong>

            </div>


            <div class="back-home">

                <a
                    href="${pageContext.request.contextPath}/">

                    ← Back to Home

                </a>

            </div>


        </div>

    </div>


</body>

</html>