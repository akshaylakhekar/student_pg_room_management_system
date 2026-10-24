<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>PG Management System</title>

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
            padding: 17px 35px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .brand {
            font-size: 21px;
            font-weight: bold;
        }

        .nav-links {
            display: flex;
            gap: 10px;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            padding: 9px 14px;
            border-radius: 6px;
            font-size: 13px;
        }

        .admin-link {
            background: #2563eb;
        }

        .student-link {
            background: #16a34a;
        }

        .hero {
            width: 94%;
            max-width: 1150px;
            margin: 50px auto 35px;
            background: white;
            border-radius: 15px;
            padding: 55px 40px;
            text-align: center;
            border: 1px solid #e2e8f0;
            box-shadow: 0 7px 25px rgba(0, 0, 0, 0.06);
        }

        .hero-icon {
            width: 75px;
            height: 75px;
            margin: 0 auto 20px;
            background: #2563eb;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 30px;
            font-weight: bold;
        }

        .hero h1 {
            margin: 0 0 12px;
            font-size: 34px;
        }

        .hero p {
            max-width: 700px;
            margin: 0 auto;
            color: #64748b;
            line-height: 1.7;
            font-size: 15px;
        }

        .login-section {
            width: 94%;
            max-width: 900px;
            margin: 0 auto 40px;
        }

        .login-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 22px;
        }

        .login-card {
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 30px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
        }

        .login-card-icon {
            width: 55px;
            height: 55px;
            margin: 0 auto 15px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 22px;
            font-weight: bold;
        }

        .admin-icon {
            background: #2563eb;
        }

        .student-icon {
            background: #16a34a;
        }

        .login-card h2 {
            margin: 0 0 8px;
            font-size: 21px;
        }

        .login-card p {
            margin: 0 0 20px;
            color: #64748b;
            font-size: 14px;
            line-height: 1.5;
        }

        .login-btn {
            display: inline-block;
            color: white;
            text-decoration: none;
            padding: 11px 25px;
            border-radius: 7px;
            font-size: 14px;
            font-weight: bold;
        }

        .admin-btn {
            background: #2563eb;
        }

        .admin-btn:hover {
            background: #1d4ed8;
        }

        .student-btn {
            background: #16a34a;
        }

        .student-btn:hover {
            background: #15803d;
        }

        .features {
            width: 94%;
            max-width: 1150px;
            margin: 0 auto 40px;
        }

        .features h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 23px;
        }

        .feature-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 16px;
        }

        .feature {
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
        }

        .feature-icon {
            width: 42px;
            height: 42px;
            margin: 0 auto 12px;
            border-radius: 8px;
            background: #eff6ff;
            color: #2563eb;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }

        .feature h3 {
            margin: 0 0 7px;
            font-size: 16px;
        }

        .feature p {
            margin: 0;
            color: #64748b;
            font-size: 12px;
            line-height: 1.5;
        }

        .footer {
            text-align: center;
            color: #64748b;
            font-size: 13px;
            padding: 25px 10px;
        }

        @media (max-width: 850px) {

            .feature-grid {
                grid-template-columns: repeat(2, 1fr);
            }

        }

        @media (max-width: 650px) {

            .navbar {
                padding: 15px 18px;
                flex-direction: column;
                gap: 13px;
            }

            .hero {
                padding: 40px 22px;
            }

            .hero h1 {
                font-size: 27px;
            }

            .login-grid {
                grid-template-columns: 1fr;
            }

            .feature-grid {
                grid-template-columns: 1fr;
            }

        }

    </style>

</head>

<body>


    <div class="navbar">

        <div class="brand">
            PG Management System
        </div>

        <div class="nav-links">

            <a
                href="${pageContext.request.contextPath}/admin/login"
                class="admin-link">

                Admin Login

            </a>

            <a
                href="${pageContext.request.contextPath}/student/login"
                class="student-link">

                Student Login

            </a>

        </div>

    </div>


    <div class="hero">

        <div class="hero-icon">
            PG
        </div>

        <h1>
            Welcome to PG Management System
        </h1>

        <p>
            A complete web-based system to manage students,
            PG properties, rooms, room allocations, rent payments,
            complaints and visitors in one place.
        </p>

    </div>


    <div class="login-section">

        <div class="login-grid">


            <div class="login-card">

                <div class="login-card-icon admin-icon">
                    A
                </div>

                <h2>
                    Admin Portal
                </h2>

                <p>
                    Manage students, properties, rooms,
                    allocations, payments, complaints and visitors.
                </p>

                <a
                    href="${pageContext.request.contextPath}/admin/login"
                    class="login-btn admin-btn">

                    Login as Admin

                </a>

            </div>


            <div class="login-card">

                <div class="login-card-icon student-icon">
                    S
                </div>

                <h2>
                    Student Portal
                </h2>

                <p>
                    View your profile, room allocation,
                    rent details, complaints and visitor records.
                </p>

                <a
                    href="${pageContext.request.contextPath}/student/login"
                    class="login-btn student-btn">

                    Login as Student

                </a>

            </div>


        </div>

    </div>


    <div class="features">

        <h2>
            System Features
        </h2>


        <div class="feature-grid">


            <div class="feature">

                <div class="feature-icon">
                    S
                </div>

                <h3>
                    Students
                </h3>

                <p>
                    Student registration and profile management.
                </p>

            </div>


            <div class="feature">

                <div class="feature-icon">
                    R
                </div>

                <h3>
                    Rooms
                </h3>

                <p>
                    Manage rooms, rent, capacity and availability.
                </p>

            </div>


            <div class="feature">

                <div class="feature-icon">
                    ₹
                </div>

                <h3>
                    Payments
                </h3>

                <p>
                    Manage rent payments and payment history.
                </p>

            </div>


            <div class="feature">

                <div class="feature-icon">
                    C
                </div>

                <h3>
                    Complaints
                </h3>

                <p>
                    Submit and manage student complaints.
                </p>

            </div>


        </div>

    </div>


    <div class="footer">

        PG Management System &copy; 2026

    </div>


</body>

</html>