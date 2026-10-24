<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Visitor List</title>

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
            min-width: 1000px;
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

        .inside {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 20px;
            background: #fef3c7;
            color: #92400e;
            font-size: 12px;
            font-weight: bold;
        }

        .exited {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 20px;
            background: #dcfce7;
            color: #166534;
            font-size: 12px;
            font-weight: bold;
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

            <h2>Visitor List</h2>

            <a href="${pageContext.request.contextPath}/visitor/add"
               class="btn btn-success">
                + Add New Visitor
            </a>

        </div>


        <c:if test="${not empty errorMessage}">

            <div class="message">
                ${errorMessage}
            </div>

        </c:if>


        <div class="card">

            <form action="${pageContext.request.contextPath}/visitor/list"
                  method="get"
                  class="search-box">

                <input type="text"
                       name="keyword"
                       value="${keyword}"
                       placeholder="Search by Student ID, Visitor Name or Relation">

                <button type="submit"
                        class="btn btn-primary">
                    Search
                </button>

                <a href="${pageContext.request.contextPath}/visitor/list"
                   class="btn btn-secondary">
                    Clear
                </a>

            </form>


            <div class="total">

                Total Visitors:
                <strong>${visitors.size()}</strong>

            </div>


            <c:choose>

                <c:when test="${not empty visitors}">

                    <div class="table-wrapper">

                        <table>

                            <thead>

                                <tr>

                                    <th>ID</th>
                                    <th>Student ID</th>
                                    <th>Visitor Name</th>
                                    <th>Relation</th>
                                    <th>Entry Time</th>
                                    <th>Exit Time</th>
                                    <th>Actions</th>

                                </tr>

                            </thead>

                            <tbody>

                                <c:forEach var="visitor"
                                           items="${visitors}">

                                    <tr>

                                        <td>
                                            ${visitor.id}
                                        </td>

                                        <td>
                                            ${visitor.studentId}
                                        </td>

                                        <td>
                                            ${visitor.visitorName}
                                        </td>

                                        <td>
                                            ${visitor.relation}
                                        </td>

                                        <td>
                                            ${visitor.entryTime}
                                        </td>

                                        <td>

                                            <c:choose>

                                                <c:when test="${not empty visitor.exitTime}">

                                                    <span class="exited">
                                                        ${visitor.exitTime}
                                                    </span>

                                                </c:when>

                                                <c:otherwise>

                                                    <span class="inside">
                                                        Still Inside
                                                    </span>

                                                </c:otherwise>

                                            </c:choose>

                                        </td>

                                        <td>

                                            <div class="actions">

                                                <a href="${pageContext.request.contextPath}/visitor/edit?id=${visitor.id}"
                                                   class="btn btn-warning">
                                                    Edit
                                                </a>

                                                <a href="${pageContext.request.contextPath}/visitor/delete?id=${visitor.id}"
                                                   class="btn btn-danger"
                                                   onclick="return confirm('Are you sure you want to delete this visitor record?');">
                                                    Delete
                                                </a>

                                                <a href="${pageContext.request.contextPath}/visitor/student?studentId=${visitor.studentId}"
                                                   class="btn btn-primary">
                                                    Student Visitors
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
                        No visitors found.
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