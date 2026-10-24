<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Admin Dashboard - PG Management System</title>

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
            align-items: center;
            justify-content: space-between;
            gap: 20px;
        }

        .brand {
            font-size: 21px;
            font-weight: bold;
        }

        .nav-right {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .admin-name {
            color: #cbd5e1;
            font-size: 14px;
        }

        .logout {
            color: white;
            text-decoration: none;
            background: #dc2626;
            padding: 9px 14px;
            border-radius: 6px;
            font-size: 13px;
        }

        .logout:hover {
            background: #b91c1c;
        }

        .container {
            width: 94%;
            max-width: 1300px;
            margin: 30px auto;
        }

        .welcome {
            margin-bottom: 25px;
        }

        .welcome h1 {
            margin: 0 0 7px;
            font-size: 28px;
        }

        .welcome p {
            margin: 0;
            color: #64748b;
        }

        .stats {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 18px;
            margin-bottom: 35px;
        }

        .stat-card {
            background: white;
            border-radius: 11px;
            padding: 21px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 4px 13px rgba(0, 0, 0, 0.06);
        }

        .stat-title {
            color: #64748b;
            font-size: 13px;
            margin-bottom: 10px;
        }

        .stat-number {
            font-size: 29px;
            font-weight: bold;
            color: #1e293b;
        }

        .blue {
            border-left: 5px solid #2563eb;
        }

        .green {
            border-left: 5px solid #16a34a;
        }

        .orange {
            border-left: 5px solid #d97706;
        }

        .red {
            border-left: 5px solid #dc2626;
        }

        .section {
            margin-top: 35px;
        }

        .section-header {
            margin-bottom: 17px;
        }

        .section-header h2 {
            margin: 0 0 5px;
            font-size: 22px;
        }

        .section-header p {
            margin: 0;
            color: #64748b;
            font-size: 14px;
        }

        .management-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 17px;
        }

        .management-card {
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 11px;
            padding: 22px;
            text-decoration: none;
            color: #1e293b;
            box-shadow: 0 3px 11px rgba(0, 0, 0, 0.05);
            transition: 0.2s;
        }

        .management-card:hover {
            transform: translateY(-3px);
            border-color: #2563eb;
            box-shadow: 0 7px 18px rgba(0, 0, 0, 0.08);
        }

        .icon {
            width: 48px;
            height: 48px;
            border-radius: 9px;
            background: #eff6ff;
            color: #2563eb;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 21px;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .management-card h3 {
            margin: 0 0 7px;
            font-size: 17px;
        }

        .management-card p {
            margin: 0;
            color: #64748b;
            font-size: 13px;
            line-height: 1.5;
        }

        .actions {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
        }

        .action-btn {
            text-decoration: none;
            text-align: center;
            padding: 13px;
            border-radius: 7px;
            font-weight: bold;
            font-size: 14px;
        }

        .primary {
            background: #2563eb;
            color: white;
        }

        .primary:hover {
            background: #1d4ed8;
        }

        .success {
            background: #16a34a;
            color: white;
        }

        .success:hover {
            background: #15803d;
        }

        .warning {
            background: #d97706;
            color: white;
        }

        .warning:hover {
            background: #b45309;
        }

        .footer {
            text-align: center;
            color: #64748b;
            padding: 35px 10px 25px;
            font-size: 13px;
        }

        @media (max-width: 1050px) {

            .stats {
                grid-template-columns: repeat(2, 1fr);
            }

            .management-grid {
                grid-template-columns: repeat(2, 1fr);
            }

        }

        @media (max-width: 700px) {

            .navbar {
                padding: 15px 18px;
                flex-direction: column;
                align-items: flex-start;
            }

            .nav-right {
                width: 100%;
                justify-content: space-between;
            }

            .container {
                width: 92%;
            }

            .stats {
                grid-template-columns: 1fr;
            }

            .management-grid {
                grid-template-columns: 1fr;
            }

            .actions {
                grid-template-columns: 1fr;
            }

            .welcome h1 {
                font-size: 24px;
            }

        }

    </style>

</head>

<body>


    <div class="navbar">

        <div class="brand">
            PG Management System
        </div>

        <div class="nav-right">

            <span class="admin-name">
                Welcome, ${admin.name}
            </span>

            <a
                href="${pageContext.request.contextPath}/admin/logout"
                class="logout">

                Logout

            </a>

        </div>

    </div>


    <div class="container">


        <div class="welcome">

            <h1>
                Admin Dashboard
            </h1>

            <p>
                Manage students, properties, rooms, allocations,
                payments, complaints and visitors.
            </p>

        </div>


        <div class="stats">


            <div class="stat-card blue">

                <div class="stat-title">
                    Total Students
                </div>

                <div class="stat-number">
                    ${studentCount}
                </div>

            </div>


            <div class="stat-card green">

                <div class="stat-title">
                    Total Properties
                </div>

                <div class="stat-number">
                    ${propertyCount}
                </div>

            </div>


            <div class="stat-card orange">

                <div class="stat-title">
                    Total Rooms
                </div>

                <div class="stat-number">
                    ${roomCount}
                </div>

            </div>


            <div class="stat-card blue">

                <div class="stat-title">
                    Active Allocations
                </div>

                <div class="stat-number">
                    ${activeAllocationCount}
                </div>

            </div>


            <div class="stat-card red">

                <div class="stat-title">
                    Pending Rent
                </div>

                <div class="stat-number">
                    ${pendingRentCount}
                </div>

            </div>


            <div class="stat-card orange">

                <div class="stat-title">
                    Total Complaints
                </div>

                <div class="stat-number">
                    ${complaintCount}
                </div>

            </div>


            <div class="stat-card green">

                <div class="stat-title">
                    Total Visitors
                </div>

                <div class="stat-number">
                    ${visitorCount}
                </div>

            </div>


        </div>


        <div class="section">

            <div class="section-header">

                <h2>
                    Management
                </h2>

                <p>
                    Manage all major PG operations from here.
                </p>

            </div>


            <div class="management-grid">


                <a
                    href="${pageContext.request.contextPath}/student/list"
                    class="management-card">

                    <div class="icon">
                        S
                    </div>

                    <h3>
                        Student Management
                    </h3>

                    <p>
                        Add, update, search, view and delete student records.
                    </p>

                </a>


                <a
                    href="${pageContext.request.contextPath}/property/list"
                    class="management-card">

                    <div class="icon">
                        P
                    </div>

                    <h3>
                        Property Management
                    </h3>

                    <p>
                        Manage PG properties, addresses and owner details.
                    </p>

                </a>


                <a
                    href="${pageContext.request.contextPath}/room/list"
                    class="management-card">

                    <div class="icon">
                        R
                    </div>

                    <h3>
                        Room Management
                    </h3>

                    <p>
                        Manage rooms, capacity, sharing type, rent and status.
                    </p>

                </a>


                <a
                    href="${pageContext.request.contextPath}/allocation/list"
                    class="management-card">

                    <div class="icon">
                        A
                    </div>

                    <h3>
                        Room Allocation
                    </h3>

                    <p>
                        Allocate rooms to students and manage checkout.
                    </p>

                </a>


                <a
                    href="${pageContext.request.contextPath}/payment/list"
                    class="management-card">

                    <div class="icon">
                        ₹
                    </div>

                    <h3>
                        Rent Payments
                    </h3>

                    <p>
                        Manage rent payments, dues, history and receipts.
                    </p>

                </a>


                <a
                    href="${pageContext.request.contextPath}/complaint/list"
                    class="management-card">

                    <div class="icon">
                        C
                    </div>

                    <h3>
                        Complaints
                    </h3>

                    <p>
                        View complaints and update their status.
                    </p>

                </a>


                <a
                    href="${pageContext.request.contextPath}/visitor/list"
                    class="management-card">

                    <div class="icon">
                        V
                    </div>

                    <h3>
                        Visitor Management
                    </h3>

                    <p>
                        Manage visitor entries, exits and visitor history.
                    </p>

                </a>


            </div>

        </div>


        <div class="section">

            <div class="section-header">

                <h2>
                    Quick Actions
                </h2>

                <p>
                    Frequently used actions.
                </p>

            </div>


            <div class="actions">


                <a
                    href="${pageContext.request.contextPath}/student/add"
                    class="action-btn primary">

                    + Add Student

                </a>


                <a
                    href="${pageContext.request.contextPath}/property/add"
                    class="action-btn success">

                    + Add Property

                </a>


                <a
                    href="${pageContext.request.contextPath}/room/add"
                    class="action-btn warning">

                    + Add Room

                </a>


            </div>

        </div>


    </div>


    <div class="footer">

        PG Management System &copy; 2026

    </div>


</body>

</html>