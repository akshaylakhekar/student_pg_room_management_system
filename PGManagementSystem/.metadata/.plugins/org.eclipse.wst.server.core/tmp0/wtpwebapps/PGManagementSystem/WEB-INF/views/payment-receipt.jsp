<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Payment Receipt</title>

    <style>

        body {
            margin: 0;
            font-family: Arial;
            background: #eef2f7;
        }

        .receipt {
            background: white;
            width: 700px;
            max-width: 92%;
            margin: 40px auto;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,.1);
        }

        .header {
            text-align: center;
            border-bottom: 2px solid #1e293b;
            padding-bottom: 20px;
            margin-bottom: 25px;
        }

        .header h1 {
            margin: 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th,
        td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            width: 40%;
            background: #f1f5f9;
        }

        .summary {
            margin-top: 25px;
        }

        .print {
            margin-top: 25px;
            padding: 11px 20px;
            background: #2563eb;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .links {
            margin-top: 25px;
        }

        .links a {
            color: #2563eb;
            text-decoration: none;
            margin-right: 15px;
        }

        @media print {

            body {
                background: white;
            }

            .print,
            .links {
                display: none;
            }

            .receipt {
                box-shadow: none;
                margin: 0;
                width: 100%;
            }

        }

    </style>

</head>

<body>

<div class="receipt">

<div class="header">

    <h1>PG Management System</h1>

    <p>
        Rent Payment Receipt
    </p>

</div>

<c:choose>

<c:when test="${not empty payment}">

<table>

<tr>
    <th>Payment ID</th>
    <td>${payment.id}</td>
</tr>

<tr>
    <th>Allocation ID</th>
    <td>${payment.allocationId}</td>
</tr>

<tr>
    <th>Student</th>
    <td>${payment.studentName}</td>
</tr>

<tr>
    <th>Room</th>
    <td>${payment.roomNumber}</td>
</tr>

<tr>
    <th>Amount Paid</th>
    <td>₹ ${payment.amount}</td>
</tr>

<tr>
    <th>Payment Date</th>
    <td>${payment.paymentDate}</td>
</tr>

<tr>
    <th>Month / Year</th>
    <td>${payment.monthYear}</td>
</tr>

<tr>
    <th>Status</th>
    <td>${payment.paymentStatus}</td>
</tr>

</table>

<div class="summary">

<h3>Rent Summary</h3>

<table>

<tr>
    <th>Monthly Rent</th>
    <td>₹ ${monthlyRent}</td>
</tr>

<tr>
    <th>Total Paid</th>
    <td>₹ ${totalAmount}</td>
</tr>

<tr>
    <th>Balance Due</th>
    <td>₹ ${balanceDue}</td>
</tr>

</table>

</div>

<button class="print"
        onclick="window.print()">

    Print Receipt

</button>

<div class="links">

<a href="${pageContext.request.contextPath}/payment/list">
    Payment List
</a>

<a href="${pageContext.request.contextPath}/payment/history?allocationId=${payment.allocationId}">
    Payment History
</a>

</div>

</c:when>

<c:otherwise>

<h2>Payment Receipt Not Found</h2>

<a href="${pageContext.request.contextPath}/payment/list">
    Back to Payments
</a>

</c:otherwise>

</c:choose>

</div>

</body>
</html>