<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Room Allocations</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f7fb;
            color: #1f2937;
        }

        .navbar {
            background: #1e293b;
            color: white;
            padding: 18px 40px;
            display: flex;
            justify-content: space-between;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
        }

        .container {
            width: 95%;
            max-width: 1400px;
            margin: 35px auto;
        }

        .top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }

        .button {
            background: #2563eb;
            color: white;
            padding: 11px 16px;
            border-radius: 6px;
            text-decoration: none;
        }

        .search,
        .table-box {
            background: white;
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
        }

        .search input {
            padding: 10px;
            width: 320px;
            max-width: 100%;
        }

        button {
            padding: 10px 16px;
            background: #2563eb;
            color: white;
            border: none;
            border-radius: 6px;
        }

        .table-box {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 1100px;
        }

        th {
            background: #1e293b;
            color: white;
            padding: 12px;
            text-align: left;
        }

        td {
            padding: 11px;
            border-bottom: 1px solid #ddd;
        }

        td a {
            color: #2563eb;
            margin-right: 8px;
        }

        .active {
            color: #15803d;
            font-weight: bold;
        }

        .checkout {
            color: #64748b;
            font-weight: bold;
        }

        .error {
            background: #fee2e2;
            color: #991b1b;
            padding: 12px;
            margin-top: 15px;
            border-radius: 6px;
        }

    </style>

</head>

<body>

<div class="navbar">

    <h2>PG Management System</h2>

    <div>
        <a href="${pageContext.request.contextPath}/dashboard">
            Dashboard
        </a>

        <a href="${pageContext.request.contextPath}/">
            Home
        </a>
    </div>

</div>

<div class="container">

<div class="top">

<div>
    <h1>Room Allocations</h1>

    <p>
        Total Allocations:
        <strong>${allocations.size()}</strong>
    </p>
</div>

<a class="button"
   href="${pageContext.request.contextPath}/allocation/add">
    + New Allocation
</a>

</div>

<c:if test="${not empty errorMessage}">

    <div class="error">
        ${errorMessage}
    </div>

</c:if>

<div class="search">

<form action="${pageContext.request.contextPath}/allocation/list"
      method="get">

    <input type="text"
           name="keyword"
           value="${keyword}"
           placeholder="Search student, room, ID or status">

    <button type="submit">
        Search
    </button>

    <a href="${pageContext.request.contextPath}/allocation/list">
        Clear
    </a>

</form>

</div>

<div class="table-box">

<c:choose>

<c:when test="${not empty allocations}">

<table>

<tr>
    <th>ID</th>
    <th>Student</th>
    <th>Room</th>
    <th>Rent</th>
    <th>Allocation Date</th>
    <th>Checkout Date</th>
    <th>Status</th>
    <th>Actions</th>
</tr>

<c:forEach var="allocation"
           items="${allocations}">

<tr>

<td>${allocation.id}</td>

<td>

<c:choose>

<c:when test="${not empty allocation.studentName}">
    ${allocation.studentName}
</c:when>

<c:otherwise>
    Student ID: ${allocation.studentId}
</c:otherwise>

</c:choose>

</td>

<td>

<c:choose>

<c:when test="${not empty allocation.roomNumber}">
    ${allocation.roomNumber}
</c:when>

<c:otherwise>
    Room ID: ${allocation.roomId}
</c:otherwise>

</c:choose>

</td>

<td>
    ₹ ${allocation.rentAmount}
</td>

<td>
    ${allocation.allocationDate}
</td>

<td>

<c:choose>

<c:when test="${not empty allocation.checkoutDate}">
    ${allocation.checkoutDate}
</c:when>

<c:otherwise>
    -
</c:otherwise>

</c:choose>

</td>

<td>

<c:choose>

<c:when test="${allocation.status == 'Active'}">

    <span class="active">
        Active
    </span>

</c:when>

<c:otherwise>

    <span class="checkout">
        ${allocation.status}
    </span>

</c:otherwise>

</c:choose>

</td>

<td>

<a href="${pageContext.request.contextPath}/allocation/edit?id=${allocation.id}">
    Edit
</a>

<a href="${pageContext.request.contextPath}/payment/history?allocationId=${allocation.id}">
    Payments
</a>

<c:if test="${allocation.status == 'Active'}">

<a href="${pageContext.request.contextPath}/payment/add?allocationId=${allocation.id}">
    Add Payment
</a>

<a href="${pageContext.request.contextPath}/allocation/checkout?id=${allocation.id}"
   onclick="return confirm('Checkout this allocation?');">
    Checkout
</a>

</c:if>

<a href="${pageContext.request.contextPath}/allocation/delete?id=${allocation.id}"
   onclick="return confirm('Delete this allocation?');">
    Delete
</a>

</td>

</tr>

</c:forEach>

</table>

</c:when>

<c:otherwise>

<p>No allocation records found.</p>

</c:otherwise>

</c:choose>

</div>

</div>

</body>
</html>