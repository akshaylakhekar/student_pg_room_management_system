<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Student Complaints</title>

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
        }

        .navbar h2 {
            margin: 0;
            font-size: 22px;
        }

        .container {
            width: 94%;
            max-width: 1300px;
            margin: 30px auto;
        }

        .page-title {
            margin-bottom: 25px;
        }

        .page-title h2 {
            margin: 0;
            color: #1e293b;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            margin-bottom: 25px;
        }

        .card h3 {
            margin-top: 0;
            color: #1e293b;
        }

        .student-info {
            width: 100%;
            border-collapse: collapse;
        }

        .student-info th {
            width: 180px;
            background: #f1f5f9;
            color: #334155;
            text-align: left;
        }

        .student-info th,
        .student-info td {
            padding: 12px;
            border: 1px solid #e2e8f0;
        }

        .btn {
            display: inline-block;
            padding: 10px 16px;
            border: none;
            border-radius: 7px;
            text-decoration: none;
            font-size: 14px;
            cursor: pointer;
        }

        .btn-primary {
            background: #2563eb;
            color: white;
        }

        .btn-primary:hover {
            background: #1d4ed8;
        }

        .btn-success {
            background: #16a34a;
            color: white;
        }

        .btn-success:hover {
            background: #15803d;
        }

        .btn-warning {
            background: #f59e0b;
            color: white;
        }

        .btn-danger {
            background: #dc2626;
            color: white;
        }

        .btn-danger:hover {
            background: #b91c1c;
        }

        .btn-secondary {
            background: #64748b;
            color: white;
        }

        .btn-secondary:hover {
            background: #475569;
        }

        .student-actions {
            margin-top: 20px;
        }

        .total {
            margin: 20px 0;
            font-size: 15px;
        }

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
        }

        table.complaint-table {
            width: 100%;
            border-collapse: collapse;
            min-width: 850px;
        }

        .complaint-table th {
            background: #1e293b;
            color: white;
            padding: 13px 10px;
            text-align: left;
        }

        .complaint-table td {
            padding: 12px 10px;
            border-bottom: 1px solid #e2e8f0;
            vertical-align: top;
        }

        .complaint-table tr:hover {
            background: #f8fafc;
        }

        .status {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }

        .status-pending,
        .status-open {
            background: #fef3c7;
            color: #92400e;
        }

        .status-resolved {
            background: #dcfce7;
            color: #166534;
        }

        .status-closed {
            background: #e2e8f0;
            color: #475569;
        }

        .actions {
            display: flex;
            gap: 6px;
            flex-wrap: wrap;
        }

        .actions .btn {
            padding: 7px 10px;
            font-size: 12px;
        }

        .empty {
            text-align: center;
            padding: 30px;
            color: #64748b;
        }

        .bottom-links {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            margin-top: 25px;
        }

        @media (max-width: 600px) {

            .container {
                width: 94%;
                margin: 20px auto;
            }

            .card {
                padding: 18px;
            }

            .student-info th {
                width: 120px;
            }

        }

    </style>

</head>

<body>

    <div class="navbar">

        <h2>
            PG Management System
        </h2>

    </div>


    <div class="container">

        <div class="page-title">

            <h2>
                Student Complaints
            </h2>

        </div>


        <c:choose>

            <c:when test="${not empty student}">


                <div class="card">

                    <h3>
                        Student Information
                    </h3>


                    <table class="student-info">

                        <tr>

                            <th>
                                Student ID
                            </th>

                            <td>
                                ${student.id}
                            </td>

                        </tr>


                        <tr>

                            <th>
                                Name
                            </th>

                            <td>
                                ${student.name}
                            </td>

                        </tr>


                        <tr>

                            <th>
                                Email
                            </th>

                            <td>
                                ${student.email}
                            </td>

                        </tr>


                        <tr>

                            <th>
                                Mobile
                            </th>

                            <td>
                                ${student.mobile}
                            </td>

                        </tr>

                    </table>


                    <div class="student-actions">

                        <a
                            href="${pageContext.request.contextPath}/complaint/add?studentId=${student.id}"
                            class="btn btn-success">

                            + Add New Complaint

                        </a>

                    </div>

                </div>


                <div class="card">


                    <div class="total">

                        Total Complaints:

                        <strong>
                            ${complaints.size()}
                        </strong>

                    </div>


                    <c:choose>


                        <c:when test="${not empty complaints}">


                            <div class="table-wrapper">

                                <table class="complaint-table">

                                    <thead>

                                        <tr>

                                            <th>
                                                ID
                                            </th>

                                            <th>
                                                Category
                                            </th>

                                            <th>
                                                Description
                                            </th>

                                            <th>
                                                Status
                                            </th>

                                            <th>
                                                Created At
                                            </th>

                                            <th>
                                                Actions
                                            </th>

                                        </tr>

                                    </thead>


                                    <tbody>


                                        <c:forEach
                                            var="complaint"
                                            items="${complaints}">


                                            <tr>


                                                <td>
                                                    ${complaint.id}
                                                </td>


                                                <td>
                                                    ${complaint.category}
                                                </td>


                                                <td>
                                                    ${complaint.description}
                                                </td>


                                                <td>


                                                    <c:choose>


                                                        <c:when test="${complaint.status == 'Pending'}">

                                                            <span class="status status-pending">

                                                                Pending

                                                            </span>

                                                        </c:when>


                                                        <c:when test="${complaint.status == 'Open'}">

                                                            <span class="status status-open">

                                                                Open

                                                            </span>

                                                        </c:when>


                                                        <c:when test="${complaint.status == 'Resolved'}">

                                                            <span class="status status-resolved">

                                                                Resolved

                                                            </span>

                                                        </c:when>


                                                        <c:when test="${complaint.status == 'Closed'}">

                                                            <span class="status status-closed">

                                                                Closed

                                                            </span>

                                                        </c:when>


                                                        <c:otherwise>

                                                            <span class="status">

                                                                ${complaint.status}

                                                            </span>

                                                        </c:otherwise>


                                                    </c:choose>


                                                </td>


                                                <td>
                                                    ${complaint.createdAt}
                                                </td>


                                                <td>


                                                    <div class="actions">


                                                        <a
                                                            href="${pageContext.request.contextPath}/complaint/edit?id=${complaint.id}"
                                                            class="btn btn-warning">

                                                            Edit

                                                        </a>


                                                        <a
                                                            href="${pageContext.request.contextPath}/complaint/delete?id=${complaint.id}"
                                                            class="btn btn-danger"
                                                            onclick="return confirm('Are you sure you want to delete this complaint?');">

                                                            Delete

                                                        </a>


                                                    </div>


                                                </td>


                                            </tr>


                                        </c:forEach>


                                    </tbody>

                                </table>

                            </div>


                        </c:when>


                        <c:otherwise>


                            <div class="empty">

                                No complaints found for this student.

                            </div>


                        </c:otherwise>


                    </c:choose>


                    <div class="bottom-links">


                        <a
                            href="${pageContext.request.contextPath}/student/profile?id=${student.id}"
                            class="btn btn-primary">

                            Back to Student Profile

                        </a>


                        <a
                            href="${pageContext.request.contextPath}/student/dashboard"
                            class="btn btn-secondary">

                            Back to Dashboard

                        </a>


                    </div>


                </div>


            </c:when>


            <c:otherwise>


                <div class="card">


                    <div class="empty">


                        <h3>
                            Student Not Found
                        </h3>


                        <p>
                            The requested student record could not be found.
                        </p>


                        <a
                            href="${pageContext.request.contextPath}/student/dashboard"
                            class="btn btn-primary">

                            Back to Dashboard

                        </a>


                    </div>


                </div>


            </c:otherwise>


        </c:choose>


    </div>


</body>

</html>