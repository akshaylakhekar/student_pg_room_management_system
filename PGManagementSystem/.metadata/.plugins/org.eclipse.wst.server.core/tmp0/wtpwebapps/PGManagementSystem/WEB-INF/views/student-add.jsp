<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Student Registration - PG Management System</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background: #f4f7fb;
            color: #1e293b;
        }

        .navbar {
            background: #1e293b;
            color: white;
            padding: 17px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .brand {
            font-size: 21px;
            font-weight: bold;
        }

        .back-link {
            color: white;
            text-decoration: none;
            font-size: 14px;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        .container {
            width: 94%;
            max-width: 850px;
            margin: 35px auto;
        }

        .card {
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 5px 18px rgba(0, 0, 0, 0.06);
        }

        h1 {
            margin: 0 0 7px;
            font-size: 27px;
        }

        .subtitle {
            margin: 0 0 28px;
            color: #64748b;
            font-size: 14px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .full-width {
            grid-column: 1 / -1;
        }

        label {
            margin-bottom: 7px;
            font-size: 14px;
            font-weight: bold;
            color: #334155;
        }

        input,
        textarea {
            width: 100%;
            padding: 12px 13px;
            border: 1px solid #cbd5e1;
            border-radius: 7px;
            font-size: 14px;
            font-family: Arial, Helvetica, sans-serif;
            outline: none;
        }

        textarea {
            min-height: 90px;
            resize: vertical;
        }

        input:focus,
        textarea:focus {
            border-color: #2563eb;
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.10);
        }

        .hint {
            margin-top: 6px;
            color: #64748b;
            font-size: 12px;
        }

        .actions {
            display: flex;
            gap: 12px;
            margin-top: 27px;
        }

        .btn {
            border: none;
            border-radius: 7px;
            padding: 12px 22px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }

        .save {
            background: #2563eb;
            color: white;
        }

        .save:hover {
            background: #1d4ed8;
        }

        .cancel {
            background: #e2e8f0;
            color: #334155;
        }

        .cancel:hover {
            background: #cbd5e1;
        }

        .login-info {
            margin-top: 22px;
            padding: 14px;
            background: #eff6ff;
            border: 1px solid #bfdbfe;
            border-radius: 7px;
            color: #1e40af;
            font-size: 13px;
            line-height: 1.5;
        }

        @media (max-width: 650px) {

            .navbar {
                padding: 15px 18px;
            }

            .container {
                width: 92%;
            }

            .card {
                padding: 23px;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .full-width {
                grid-column: auto;
            }

            .actions {
                flex-direction: column;
            }

            .btn {
                text-align: center;
            }

        }

    </style>

</head>

<body>


    <div class="navbar">

        <div class="brand">
            PG Management System
        </div>

        <a
            href="${pageContext.request.contextPath}/student/login"
            class="back-link">

            Student Login

        </a>

    </div>


    <div class="container">


        <div class="card">


            <h1>
                Student Registration
            </h1>

            <p class="subtitle">
                Create your student account for PG Management System.
            </p>


            <form
                action="${pageContext.request.contextPath}/student/save"
                method="post">


                <div class="form-grid">


                    <div class="form-group">

                        <label for="name">
                            Full Name
                        </label>

                        <input
                            type="text"
                            id="name"
                            name="name"
                            placeholder="Enter full name"
                            required>

                    </div>


                    <div class="form-group">

                        <label for="email">
                            Email Address
                        </label>

                        <input
                            type="email"
                            id="email"
                            name="email"
                            placeholder="Enter email address"
                            required>

                    </div>


                    <div class="form-group">

                        <label for="mobile">
                            Mobile Number
                        </label>

                        <input
                            type="text"
                            id="mobile"
                            name="mobile"
                            placeholder="Enter mobile number"
                            maxlength="15"
                            required>

                    </div>


                    <div class="form-group">

                        <label for="guardianMobile">
                            Guardian Mobile
                        </label>

                        <input
                            type="text"
                            id="guardianMobile"
                            name="guardianMobile"
                            placeholder="Enter guardian mobile"
                            maxlength="15">

                    </div>


                    <div class="form-group">

                        <label for="password">
                            Password
                        </label>

                        <input
                            type="password"
                            id="password"
                            name="password"
                            placeholder="Create your password"
                            required
                            minlength="4">

                        <div class="hint">
                            Minimum 4 characters.
                        </div>

                    </div>


                    <div class="form-group">

                        <label for="idProof">
                            ID Proof
                        </label>

                        <input
                            type="text"
                            id="idProof"
                            name="idProof"
                            placeholder="Enter ID proof details">

                    </div>


                    <div class="form-group full-width">

                        <label for="address">
                            Address
                        </label>

                        <textarea
                            id="address"
                            name="address"
                            placeholder="Enter your address"></textarea>

                    </div>


                </div>


                <div class="actions">

                    <button
                        type="submit"
                        class="btn save">

                        Register Student

                    </button>

                    <a
                        href="${pageContext.request.contextPath}/student/login"
                        class="btn cancel">

                        Cancel

                    </a>

                </div>


            </form>


            <div class="login-info">

                After registration, you can login using your
                <strong>email address</strong> and the
                <strong>password</strong> created above.

            </div>


        </div>


    </div>


</body>

</html>