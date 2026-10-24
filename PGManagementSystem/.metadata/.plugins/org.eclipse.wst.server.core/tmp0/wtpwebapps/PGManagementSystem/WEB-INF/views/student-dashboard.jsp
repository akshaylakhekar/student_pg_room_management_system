<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Student Dashboard - PG Management System</title>

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
            gap: 20px;
        }

        .brand {
            font-size: 21px;
            font-weight: bold;
        }

        .nav-right {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .student-name {
            color: #cbd5e1;
            font-size: 14px;
        }

        .logout {
            background: #dc2626;
            color: white;
            text-decoration: none;
            padding: 9px 14px;
            border-radius: 6px;
            font-size: 13px;
        }

        .logout:hover {
            background: #b91c1c;
        }

        .container {
            width: 94%;
            max-width: 1200px;
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
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
            margin-bottom: 30px;
        }

        .stat-card {
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 11px;
            padding: 22px;
            box-shadow: 0 4px 13px rgba(0, 0, 0, 0.06);
        }

        .stat-title {
            color: #64748b;
            font-size: 13px;
            margin-bottom: 10px;
        }

        .stat-value {
            font-size: 25px;
            font-weight: bold;
            color: #1e293b;
        }

        .green {
            border-left: 5px solid #16a34a;
        }

        .blue {
            border-left: 5px solid #2563eb;
        }

        .red {
            border-left: 5px solid #dc2626;
        }

        .section {
            margin-top: 30px;
        }

        .section-title {
            margin-bottom: 15px;
        }

        .section-title h2 {
            margin: 0 0 5px;
            font-size: 21px;
        }

        .section-title p {
            margin: 0;
            color: #64748b;
            font-size: 14px;
        }

        .room-card {
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 11px;
            padding: 23px;
            box-shadow: 0 4px 13px rgba(0, 0, 0, 0.05);
        }

        .room-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
        }

        .detail {
            background: #f8fafc;
            padding: 14px;
            border-radius: 7px;
        }

        .detail-label {
            color: #64748b;
            font-size: 12px;
            margin-bottom: 5px;
        }

        .detail-value {
            font-size: 15px;
            font-weight: bold;
            color: #1e293b;
        }

        .no-room {
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 11px;
            padding: 30px;
            text-align: center;
            color: #64748b;
        }

        .quick-links {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 15px;
        }

        .link-card {
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 10px;
            padding: 20px;
            text-decoration: none;
            color: #1e293b;
            box-shadow: 0 3px 11px rgba(0, 0, 0, 0.05);
            transition: 0.2s;
        }

        .link-card:hover {
            transform: translateY(-3px);
            border-color: #2563eb;
        }

        .link-card.disabled {
            cursor: not-allowed;
            opacity: 0.65;
        }

        .link-card.disabled:hover {
            transform: none;
            border-color: #e2e8f0;
        }

        .link-icon {
            width: 44px;
            height: 44px;
            background: #eff6ff;
            color: #2563eb;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            margin-bottom: 13px;
        }

        .link-card h3 {
            margin: 0 0 6px;
            font-size: 16px;
        }

        .link-card p {
            margin: 0;
            color: #64748b;
            font-size: 12px;
            line-height: 1.5;
        }

        .profile-card {
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 11px;
            padding: 23px;
            box-shadow: 0 4px 13px rgba(0, 0, 0, 0.05);
        }

        .profile-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
        }

        .footer {
            text-align: center;
            color: #64748b;
            font-size: 13px;
            padding: 35px 10px 25px;
        }

        @media (max-width: 950px) {

            .quick-links {
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

            .room-grid,
            .profile-grid {
                grid-template-columns: 1fr;
            }

            .quick-links {
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

            <span class="student-name">
                Welcome, ${student.name}
            </span>

            <a
                href="${pageContext.request.contextPath}/student/logout"
                class="logout">
                Logout
            </a>

        </div>

    </div>


    <div class="container">

        <div class="welcome">

            <h1>
                Student Dashboard
            </h1>

            <p>
                View your profile, room allocation and payment details.
            </p>

        </div>


        <!-- Statistics -->

        <div class="stats">

            <div class="stat-card green">

                <div class="stat-title">
                    Monthly Rent
                </div>

                <div class="stat-value">
                    ₹ ${monthlyRent}
                </div>

            </div>


            <div class="stat-card blue">

                <div class="stat-title">
                    Total Paid
                </div>

                <div class="stat-value">
                    ₹ ${totalPaid}
                </div>

            </div>


            <div class="stat-card red">

                <div class="stat-title">
                    Balance Due
                </div>

                <div class="stat-value">
                    ₹ ${balanceDue}
                </div>

            </div>

        </div>


        <!-- Room -->

        <div class="section">

            <div class="section-title">

                <h2>
                    My Room
                </h2>

                <p>
                    Your current room allocation details.
                </p>

            </div>


            <%

                if (request.getAttribute("currentAllocation") != null) {

            %>

                <div class="room-card">

                    <div class="room-grid">

                        <div class="detail">

                            <div class="detail-label">
                                Room Number
                            </div>

                            <div class="detail-value">
                                ${currentAllocation.roomNumber}
                            </div>

                        </div>


                        <div class="detail">

                            <div class="detail-label">
                                Property
                            </div>

                            <div class="detail-value">
                                ${currentAllocation.propertyName}
                            </div>

                        </div>


                        <div class="detail">

                            <div class="detail-label">
                                Sharing Type
                            </div>

                            <div class="detail-value">
                                ${currentAllocation.sharingType}
                            </div>

                        </div>


                        <div class="detail">

                            <div class="detail-label">
                                Rent Amount
                            </div>

                            <div class="detail-value">
                                ₹ ${currentAllocation.rentAmount}
                            </div>

                        </div>


                        <div class="detail">

                            <div class="detail-label">
                                Allocation Date
                            </div>

                            <div class="detail-value">
                                ${currentAllocation.allocationDate}
                            </div>

                        </div>


                        <div class="detail">

                            <div class="detail-label">
                                Status
                            </div>

                            <div class="detail-value">
                                ${currentAllocation.status}
                            </div>

                        </div>

                    </div>

                </div>

            <%

                } else {

            %>

                <div class="no-room">

                    <strong>
                        No Active Room Allocation
                    </strong>

                    <p>
                        You currently do not have an active room allocation.
                    </p>

                </div>

            <%

                }

            %>

        </div>


        <!-- Profile -->

        <div class="section">

            <div class="section-title">

                <h2>
                    My Profile
                </h2>

                <p>
                    Your registered student information.
                </p>

            </div>


            <div class="profile-card">

                <div class="profile-grid">

                    <div class="detail">

                        <div class="detail-label">
                            Name
                        </div>

                        <div class="detail-value">
                            ${student.name}
                        </div>

                    </div>


                    <div class="detail">

                        <div class="detail-label">
                            Email
                        </div>

                        <div class="detail-value">
                            ${student.email}
                        </div>

                    </div>


                    <div class="detail">

                        <div class="detail-label">
                            Mobile
                        </div>

                        <div class="detail-value">
                            ${student.mobile}
                        </div>

                    </div>


                    <div class="detail">

                        <div class="detail-label">
                            Guardian Mobile
                        </div>

                        <div class="detail-value">
                            ${student.guardianMobile}
                        </div>

                    </div>

                </div>

            </div>

        </div>


        <!-- Quick Links -->

        <div class="section">

            <div class="section-title">

                <h2>
                    Quick Access
                </h2>

                <p>
                    Access your PG related information.
                </p>

            </div>


            <div class="quick-links">


                <!-- Profile -->

                <a
                    href="${pageContext.request.contextPath}/student/profile?id=${student.id}"
                    class="link-card">

                    <div class="link-icon">
                        P
                    </div>

                    <h3>
                        My Profile
                    </h3>

                    <p>
                        View complete profile and accommodation details.
                    </p>

                </a>


                <!-- Payment History -->

                <%

                    if (request.getAttribute("currentAllocation") != null) {

                %>

                    <a
                        href="${pageContext.request.contextPath}/payment/history?allocationId=${currentAllocation.id}"
                        class="link-card">

                        <div class="link-icon">
                            ₹
                        </div>

                        <h3>
                            Payment History
                        </h3>

                        <p>
                            View your rent payment history.
                        </p>

                    </a>

                <%

                    } else {

                %>

                    <div class="link-card disabled">

                        <div class="link-icon">
                            ₹
                        </div>

                        <h3>
                            Payment History
                        </h3>

                        <p>
                            Payment history is available after room allocation.
                        </p>

                    </div>

                <%

                    }

                %>


                <!-- Complaints -->

                <a
                    href="${pageContext.request.contextPath}/complaint/student?studentId=${student.id}"
                    class="link-card">

                    <div class="link-icon">
                        C
                    </div>

                    <h3>
                        My Complaints
                    </h3>

                    <p>
                        View your submitted complaints.
                    </p>

                </a>


                <!-- Visitors -->

                <a
                    href="${pageContext.request.contextPath}/visitor/student?studentId=${student.id}"
                    class="link-card">

                    <div class="link-icon">
                        V
                    </div>

                    <h3>
                        Visitor Log
                    </h3>

                    <p>
                        View your visitor records.
                    </p>

                </a>


            </div>

        </div>


    </div>


    <div class="footer">

        PG Management System &copy; 2026

    </div>


</body>

</html>