<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Dashboard - PG Management System</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f7fb;
            color: #1e293b;
        }

        .navbar {
            background: #1e293b;
            color: white;
            padding: 18px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
        }

        .navbar h2 {
            margin: 0;
            font-size: 22px;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-size: 14px;
            background: #334155;
            padding: 9px 14px;
            border-radius: 6px;
        }

        .navbar a:hover {
            background: #475569;
        }

        .container {
            width: 94%;
            max-width: 1250px;
            margin: 35px auto;
        }

        .welcome {
            margin-bottom: 25px;
        }

        .welcome h1 {
            margin: 0 0 8px 0;
            font-size: 28px;
        }

        .welcome p {
            margin: 0;
            color: #64748b;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 18px;
            margin-bottom: 35px;
        }

        .card {
            background: white;
            padding: 22px;
            border-radius: 12px;
            box-shadow: 0 4px 14px rgba(0, 0, 0, 0.07);
            border: 1px solid #e2e8f0;
        }

        .card-title {
            color: #64748b;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .card-number {
            font-size: 30px;
            font-weight: bold;
            color: #1e293b;
        }

        .card-blue {
            border-left: 5px solid #2563eb;
        }

        .card-green {
            border-left: 5px solid #16a34a;
        }

        .card-orange {
            border-left: 5px solid #d97706;
        }

        .card-red {
            border-left: 5px solid #dc2626;
        }

        .quick-section {
            margin-top: 10px;
        }

        .quick-section h2 {
            margin-bottom: 18px;
        }

        .quick-links {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 16px;
        }

        .quick-link {
            background: white;
            padding: 20px;
            border-radius: 10px;
            text-decoration: none;
            color: #1e293b;
            border: 1px solid #e2e8f0;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.05);
            transition: 0.2s;
        }

        .quick-link:hover {
            transform: translateY(-2px);
            border-color: #2563eb;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
        }

        .quick-link-title {
            font-weight: bold;
            font-size: 16px;
            margin-bottom: 6px;
        }

        .quick-link-text {
            color: #64748b;
            font-size: 13px;
        }

        .footer {
            text-align: center;
            color: #64748b;
            padding: 30px 10px;
            font-size: 13px;
        }

        @media (max-width: 1000px) {

            .cards {
                grid-template-columns: repeat(2, 1fr);
            }

            .quick-links {
                grid-template-columns: repeat(2, 1fr);
            }

        }

        @media (max-width: 600px) {

            .navbar {
                padding: 16px 20px;
            }

            .navbar h2 {
                font-size: 18px;
            }

            .container {
                width: 94%;
                margin: 25px auto;
            }

            .welcome h1 {
                font-size: 23px;
            }

            .cards {
                grid-template-columns: 1fr;
            }

            .quick-links {
                grid-template-columns: 1fr;
            }

        }

    </style>

</head>

<body>


    <div class="navbar">

        <h2>
            PG Management System
        </h2>

        <a href="${pageContext.request.contextPath}/">
            Home
        </a>

    </div>


    <div class="container">


        <div class="welcome">

            <h1>
                Dashboard
            </h1>

            <p>
                Manage your PG students, properties, rooms, payments and daily activities.
            </p>

        </div>


        <div class="cards">


            <div class="card card-blue">

                <div class="card-title">
                    Total Students
                </div>

                <div class="card-number">
                    ${studentCount}
                </div>

            </div>


            <div class="card card-green">

                <div class="card-title">
                    Total Properties
                </div>

                <div class="card-number">
                    ${propertyCount}
                </div>

            </div>


            <div class="card card-orange">

                <div class="card-title">
                    Total Rooms
                </div>

                <div class="card-number">
                    ${roomCount}
                </div>

            </div>


            <div class="card card-blue">

                <div class="card-title">
                    Active Allocations
                </div>

                <div class="card-number">
                    ${activeAllocationCount}
                </div>

            </div>


            <div class="card card-red">

                <div class="card-title">
                    Pending Rent
                </div>

                <div class="card-number">
                    ${pendingRentCount}
                </div>

            </div>


            <div class="card card-orange">

                <div class="card-title">
                    Total Complaints
                </div>

                <div class="card-number">
                    ${complaintCount}
                </div>

            </div>


            <div class="card card-green">

                <div class="card-title">
                    Total Visitors
                </div>

                <div class="card-number">
                    ${visitorCount}
                </div>

            </div>


        </div>


        <div class="quick-section">

            <h2>
                Quick Access
            </h2>


            <div class="quick-links">


                <a href="${pageContext.request.contextPath}/student/list"
                   class="quick-link">

                    <div class="quick-link-title">
                        Students
                    </div>

                    <div class="quick-link-text">
                        Add, edit, search and manage students.
                    </div>

                </a>


                <a href="${pageContext.request.contextPath}/property/list"
                   class="quick-link">

                    <div class="quick-link-title">
                        Properties
                    </div>

                    <div class="quick-link-text">
                        Manage PG properties and owners.
                    </div>

                </a>


                <a href="${pageContext.request.contextPath}/room/list"
                   class="quick-link">

                    <div class="quick-link-title">
                        Rooms
                    </div>

                    <div class="quick-link-text">
                        Manage rooms, capacity and rent.
                    </div>

                </a>


                <a href="${pageContext.request.contextPath}/allocation/list"
                   class="quick-link">

                    <div class="quick-link-title">
                        Allocations
                    </div>

                    <div class="quick-link-text">
                        Manage student room allocations.
                    </div>

                </a>


                <a href="${pageContext.request.contextPath}/payment/list"
                   class="quick-link">

                    <div class="quick-link-title">
                        Rent Payments
                    </div>

                    <div class="quick-link-text">
                        Track rent payments and pending dues.
                    </div>

                </a>


                <a href="${pageContext.request.contextPath}/complaint/list"
                   class="quick-link">

                    <div class="quick-link-title">
                        Complaints
                    </div>

                    <div class="quick-link-text">
                        Manage student complaints.
                    </div>

                </a>


                <a href="${pageContext.request.contextPath}/visitor/list"
                   class="quick-link">

                    <div class="quick-link-title">
                        Visitors
                    </div>

                    <div class="quick-link-text">
                        Manage visitor entries and exits.
                    </div>

                </a>


                <a href="${pageContext.request.contextPath}/student/add"
                   class="quick-link">

                    <div class="quick-link-title">
                        Add Student
                    </div>

                    <div class="quick-link-text">
                        Quickly register a new student.
                    </div>

                </a>


            </div>

        </div>


    </div>


    <div class="footer">

        PG Management System &copy; 2026

    </div>


</body>

</html>