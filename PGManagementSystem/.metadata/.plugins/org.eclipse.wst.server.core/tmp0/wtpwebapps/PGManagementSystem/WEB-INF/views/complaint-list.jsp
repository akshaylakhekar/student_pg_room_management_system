<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Complaint List</title>

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
            max-width: 1400px;
            margin: 30px auto;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            margin-bottom: 25px;
            flex-wrap: wrap;
        }

        .header h2 {
            margin: 0;
            color: #1e293b;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
        }

        .message {
            background: #fee2e2;
            border: 1px solid #fecaca;
            color: #991b1b;
            padding: 12px 15px;
            border-radius: 7px;
            margin-bottom: 20px;
        }

        .search-box {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }

        .search-box input {
            flex: 1;
            min-width: 250px;
            padding: 11px 12px;
            border: 1px solid #cbd5e1;
            border-radius: 7px;
            font-size: 14px;
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

        .btn-secondary {
            background: #64748b;
            color: white;
        }

        .btn-secondary:hover {
            background: #475569;
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

        .total {
            margin: 15px 0;
            font-size: 15px;
        }

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 900px;
        }

        th {
            background: #1e293b;
            color: white;
            padding: 13px 10px;
            text-align: left;
            white-space: nowrap;
        }

        td {
            padding: 12px 10px;
            border-bottom: 1px solid #e2e8f0;
            vertical-align: top;
        }

        tr:hover {
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
            padding: 35px;
            color: #64748b;
        }

        .bottom-links {
            margin-top: 25px;
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        @media (max-width: 600px) {

            .container {
                width: 94%;
                margin: 20px auto;
            }

            .card {
                padding: 18px;
            }

            .search-box {
                flex-direction: column;
            }

            .search-box input {
                width: 100%;
                min-width: 0;
            }

        }

    </style>

</head>

<body>

    <div class="navbar">
        <h2>PG Management System</h2>
    </div>


    <div class="container">

        <div class="header">

            <h2>Complaint List</h2>

            <a href="${pageContext.request.contextPath}/complaint/add"
               class="btn btn-success">
                + Add New Complaint
            </a>

        </div>


        <c:if test="${not empty errorMessage}">

            <div class="message">
                ${errorMessage}
            </div>

        </c:if>


        <div class="card">

            <form action="${pageContext.request.contextPath}/complaint/list"
                  method="get"
                  class="search-box">

                <input type="text"
                       name="keyword"
                       value="${keyword}"
                       placeholder="Search by Student ID, Category, Description or Status">

                <button type="submit"
                        class="btn btn-primary">
                    Search
                </button>

                <a href="${pageContext.request.contextPath}/complaint/list"
                   class="btn btn-secondary">
                    Clear
                </a>

            </form>


            <div class="total">

                Total Complaints:
                <strong>${complaints.size()}</strong>

            </div>


            <c:choose>

                <c:when test="${not empty complaints}">

                    <div class="table-wrapper">

                        <table>

                            <thead>

                                <tr>

                                    <th>ID</th>
                                    <th>Student ID</th>
                                    <th>Category</th>
                                    <th>Description</th>
                                    <th>Status</th>
                                    <th>Created At</th>
                                    <th>Actions</th>

                                </tr>

                            </thead>

                            <tbody>

                                <c:forEach var="complaint"
                                           items="${complaints}">

                                    <tr>

                                        <td>
                                            ${complaint.id}
                                        </td>

                                        <td>
                                            ${complaint.studentId}
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

                                                <a href="${pageContext.request.contextPath}/complaint/edit?id=${complaint.id}"
                                                   class="btn btn-warning">
                                                    Edit
                                                </a>

                                                <a href="${pageContext.request.contextPath}/complaint/delete?id=${complaint.id}"
                                                   class="btn btn-danger"
                                                   onclick="return confirm('Are you sure you want to delete this complaint?');">
                                                    Delete
                                                </a>

                                                <a href="${pageContext.request.contextPath}/complaint/student?studentId=${complaint.studentId}"
                                                   class="btn btn-primary">
                                                    Student Complaints
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
                        No complaints found.
                    </div>

                </c:otherwise>

            </c:choose>


            <div class="bottom-links">

                <a href="${pageContext.request.contextPath}/dashboard"
                   class="btn btn-secondary">
                    Back to Dashboard
                </a>

            </div>

        </div>

    </div>

</body>

</html>