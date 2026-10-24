<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Room List</title>

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
            max-width: 1250px;
            margin: 35px auto;
        }

        .top-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            margin-bottom: 25px;
            flex-wrap: wrap;
        }

        .top-section h2 {
            margin: 0;
        }

        .btn {
            display: inline-block;
            padding: 10px 16px;
            border-radius: 7px;
            text-decoration: none;
            border: none;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-primary {
            background: #2563eb;
            color: white;
        }

        .btn-primary:hover {
            background: #1d4ed8;
        }

        .btn-secondary {
            background: #64748b;
            color: white;
        }

        .btn-secondary:hover {
            background: #475569;
        }

        .btn-warning {
            background: #d97706;
            color: white;
        }

        .btn-warning:hover {
            background: #b45309;
        }

        .btn-danger {
            background: #dc2626;
            color: white;
        }

        .btn-danger:hover {
            background: #b91c1c;
        }

        .search-card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 3px 12px rgba(0, 0, 0, 0.07);
            margin-bottom: 20px;
        }

        .search-form {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .search-form input {
            flex: 1;
            min-width: 250px;
            padding: 11px 12px;
            border: 1px solid #cbd5e1;
            border-radius: 7px;
            font-size: 14px;
            outline: none;
        }

        .search-form input:focus {
            border-color: #2563eb;
        }

        .message {
            background: #fee2e2;
            color: #991b1b;
            padding: 12px 15px;
            border-radius: 7px;
            margin-bottom: 20px;
        }

        .table-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 3px 12px rgba(0, 0, 0, 0.07);
            overflow: hidden;
        }

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
        }

        table {
            width: 100%;
            min-width: 1050px;
            border-collapse: collapse;
        }

        th {
            background: #1e293b;
            color: white;
            padding: 13px 12px;
            text-align: left;
            font-size: 14px;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #e2e8f0;
            font-size: 14px;
            vertical-align: middle;
        }

        tr:hover td {
            background: #f8fafc;
        }

        .room-id {
            font-weight: bold;
            color: #2563eb;
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

        .status {
            display: inline-block;
            padding: 5px 9px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }

        .status-available {
            background: #dcfce7;
            color: #166534;
        }

        .status-occupied {
            background: #fee2e2;
            color: #991b1b;
        }

        .status-maintenance {
            background: #fef3c7;
            color: #92400e;
        }

        .status-default {
            background: #e2e8f0;
            color: #475569;
        }

        .empty {
            text-align: center;
            padding: 35px;
            color: #64748b;
        }

        @media (max-width: 600px) {

            .container {
                width: 94%;
                margin: 25px auto;
            }

            .top-section {
                align-items: stretch;
            }

            .top-section .btn {
                width: 100%;
                text-align: center;
            }

            .search-form {
                flex-direction: column;
            }

            .search-form input {
                min-width: 100%;
            }

            .search-form .btn {
                width: 100%;
                text-align: center;
            }

        }

    </style>

</head>

<body>

    <div class="navbar">
        <h2>PG Management System</h2>
    </div>


    <div class="container">


        <div class="top-section">

            <h2>Room Management</h2>

            <a href="${pageContext.request.contextPath}/room/add"
               class="btn btn-primary">
                + Add Room
            </a>

        </div>


        <c:if test="${not empty errorMessage}">

            <div class="message">
                ${errorMessage}
            </div>

        </c:if>


        <div class="search-card">

            <form action="${pageContext.request.contextPath}/room/list"
                  method="get"
                  class="search-form">

                <input type="text"
                       name="keyword"
                       value="${keyword}"
                       placeholder="Search by room number, property or sharing type">

                <button type="submit"
                        class="btn btn-primary">
                    Search
                </button>

                <a href="${pageContext.request.contextPath}/room/list"
                   class="btn btn-secondary">
                    Clear
                </a>

            </form>

        </div>


        <div class="table-card">

            <div class="table-wrapper">

                <table>

                    <thead>

                        <tr>
                            <th>ID</th>
                            <th>Property</th>
                            <th>Room Number</th>
                            <th>Capacity</th>
                            <th>Sharing Type</th>
                            <th>Rent Amount</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>

                    </thead>


                    <tbody>

                        <c:choose>

                            <c:when test="${not empty rooms}">

                                <c:forEach var="room"
                                           items="${rooms}">

                                    <tr>

                                        <td>
                                            <span class="room-id">
                                                ${room.id}
                                            </span>
                                        </td>

                                        <td>
                                            <c:choose>

                                                <c:when test="${not empty room.propertyName}">
                                                    ${room.propertyName}
                                                </c:when>

                                                <c:otherwise>
                                                    Property #${room.propertyId}
                                                </c:otherwise>

                                            </c:choose>
                                        </td>

                                        <td>
                                            ${room.roomNumber}
                                        </td>

                                        <td>
                                            ${room.capacity}
                                        </td>

                                        <td>
                                            ${room.sharingType}
                                        </td>

                                        <td>
                                            ₹ ${room.rentAmount}
                                        </td>

                                        <td>

                                            <c:choose>

                                                <c:when test="${room.status == 'Available'}">

                                                    <span class="status status-available">
                                                        Available
                                                    </span>

                                                </c:when>

                                                <c:when test="${room.status == 'Occupied'}">

                                                    <span class="status status-occupied">
                                                        Occupied
                                                    </span>

                                                </c:when>

                                                <c:when test="${room.status == 'Maintenance'}">

                                                    <span class="status status-maintenance">
                                                        Maintenance
                                                    </span>

                                                </c:when>

                                                <c:otherwise>

                                                    <span class="status status-default">
                                                        ${room.status}
                                                    </span>

                                                </c:otherwise>

                                            </c:choose>

                                        </td>

                                        <td>

                                            <div class="actions">

                                                <a href="${pageContext.request.contextPath}/room/edit?id=${room.id}"
                                                   class="btn btn-warning">
                                                    Edit
                                                </a>

                                                <a href="${pageContext.request.contextPath}/room/delete?id=${room.id}"
                                                   class="btn btn-danger"
                                                   onclick="return confirm('Are you sure you want to delete this room?');">
                                                    Delete
                                                </a>

                                            </div>

                                        </td>

                                    </tr>

                                </c:forEach>

                            </c:when>


                            <c:otherwise>

                                <tr>

                                    <td colspan="8"
                                        class="empty">
                                        No rooms found.
                                    </td>

                                </tr>

                            </c:otherwise>

                        </c:choose>

                    </tbody>

                </table>

            </div>

        </div>

    </div>

</body>

</html>