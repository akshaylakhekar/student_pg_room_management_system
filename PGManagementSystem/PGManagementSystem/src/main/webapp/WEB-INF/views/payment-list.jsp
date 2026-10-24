<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Rent Payments</title>

    <style>

        body {
            margin: 0;
            font-family: Arial;
            background: #f4f7fb;
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
        }

        .button {
            background: #16a34a;
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

        input {
            padding: 10px;
            width: 320px;
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
            min-width: 1200px;
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

        .error {
            background: #fee2e2;
            color: #991b1b;
            padding: 12px;
            margin-top: 15px;
            border-radius: 6px;
        }

        .paid {
            color: #15803d;
            font-weight: bold;
        }

        .pending {
            color: #b45309;
            font-weight: bold;
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
    <h1>Rent Payments</h1>

    <p>
        Total Payments:
        <strong>${payments.size()}</strong>
    </p>
</div>

<a class="button"
   href="${pageContext.request.contextPath}/payment/add">
    + Add Payment
</a>

</div>

<c:if test="${not empty errorMessage}">
    <div class="error">
        ${errorMessage}
    </div>
</c:if>

<div class="search">

<form action="${pageContext.request.contextPath}/payment/list"
      method="get">

<input type="text"
       name="keyword"
       value="${keyword}"
       placeholder="Search student, room, amount or month">

<button type="submit">
    Search
</button>

<a href="${pageContext.request.contextPath}/payment/list">
    Clear
</a>

</form>

</div>

<div class="table-box">

<c:choose>

<c:when test="${not empty payments}">

<table>

<tr>
    <th>ID</th>
    <th>Allocation</th>
    <th>Student</th>
    <th>Room</th>
    <th>Amount</th>
    <th>Date</th>
    <th>Month</th>
    <th>Status</th>
    <th>Actions</th>
</tr>

<c:forEach var="payment"
           items="${payments}">

<tr>

<td>${payment.id}</td>

<td>${payment.allocationId}</td>

<td>${payment.studentName}</td>

<td>${payment.roomNumber}</td>

<td>₹ ${payment.amount}</td>

<td>${payment.paymentDate}</td>

<td>${payment.monthYear}</td>

<td>

<c:choose>

<c:when test="${payment.paymentStatus == 'Paid'}">

<span class="paid">
    Paid
</span>

</c:when>

<c:otherwise>

<span class="pending">
    ${payment.paymentStatus}
</span>

</c:otherwise>

</c:choose>

</td>

<td>

<a href="${pageContext.request.contextPath}/payment/receipt?id=${payment.id}">
    Receipt
</a>

<a href="${pageContext.request.contextPath}/payment/history?allocationId=${payment.allocationId}">
    History
</a>

<a href="${pageContext.request.contextPath}/payment/edit?id=${payment.id}">
    Edit
</a>

<a href="${pageContext.request.contextPath}/payment/delete?id=${payment.id}"
   onclick="return confirm('Delete this payment?');">
    Delete
</a>

</td>

</tr>

</c:forEach>

</table>

</c:when>

<c:otherwise>

<p>No payment records found.</p>

</c:otherwise>

</c:choose>

</div>

</div>

</body>
</html>