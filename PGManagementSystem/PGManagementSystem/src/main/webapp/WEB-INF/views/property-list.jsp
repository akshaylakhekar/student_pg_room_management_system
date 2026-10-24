<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Property List</title>

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
            max-width: 1200px;
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
            min-width: 900px;
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

        .property-id {
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

            <h2>Property Management</h2>

            <a href="${pageContext.request.contextPath}/property/add"
               class="btn btn-primary">
                + Add Property
            </a>

        </div>


        <c:if test="${not empty errorMessage}">

            <div class="message">
                ${errorMessage}
            </div>

        </c:if>


        <div class="search-card">

            <form action="${pageContext.request.contextPath}/property/list"
                  method="get"
                  class="search-form">

                <input type="text"
                       name="keyword"
                       value="${keyword}"
                       placeholder="Search by property name, address or owner">

                <button type="submit"
                        class="btn btn-primary">
                    Search
                </button>

                <a href="${pageContext.request.contextPath}/property/list"
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
                            <th>Property Name</th>
                            <th>Address</th>
                            <th>Owner Name</th>
                            <th>Contact Number</th>
                            <th>Actions</th>
                        </tr>

                    </thead>


                    <tbody>

                        <c:choose>

                            <c:when test="${not empty properties}">

                                <c:forEach var="property"
                                           items="${properties}">

                                    <tr>

                                        <td>
                                            <span class="property-id">
                                                ${property.id}
                                            </span>
                                        </td>

                                        <td>
                                            ${property.propertyName}
                                        </td>

                                        <td>
                                            ${property.address}
                                        </td>

                                        <td>
                                            ${property.ownerName}
                                        </td>

                                        <td>
                                            ${property.contactNumber}
                                        </td>

                                        <td>

                                            <div class="actions">

                                                <a href="${pageContext.request.contextPath}/property/edit?id=${property.id}"
                                                   class="btn btn-warning">
                                                    Edit
                                                </a>

                                                <a href="${pageContext.request.contextPath}/property/delete?id=${property.id}"
                                                   class="btn btn-danger"
                                                   onclick="return confirm('Are you sure you want to delete this property?');">
                                                    Delete
                                                </a>

                                            </div>

                                        </td>

                                    </tr>

                                </c:forEach>

                            </c:when>


                            <c:otherwise>

                                <tr>

                                    <td colspan="6"
                                        class="empty">
                                        No properties found.
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