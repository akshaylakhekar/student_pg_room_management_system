<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Edit Rent Payment</title>

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
        }

        .container {
            width: 92%;
            max-width: 800px;
            margin: 35px auto;
        }

        .card {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,.08);
        }

        .form-group {
            margin-bottom: 18px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 7px;
        }

        select,
        input {
            width: 100%;
            padding: 11px;
            border: 1px solid #cbd5e1;
            border-radius: 6px;
        }

        button {
            background: #2563eb;
            color: white;
            padding: 11px 20px;
            border: none;
            border-radius: 6px;
        }

        .error {
            background: #fee2e2;
            color: #991b1b;
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 6px;
        }

        a {
            color: #2563eb;
            text-decoration: none;
        }

    </style>

</head>

<body>

<div class="navbar">
    <h2>PG Management System</h2>
</div>

<div class="container">

<div class="card">

<h1>Edit Rent Payment</h1>

<c:if test="${not empty errorMessage}">
    <div class="error">${errorMessage}</div>
</c:if>

<c:choose>

<c:when test="${not empty payment}">

<form action="${pageContext.request.contextPath}/payment/update"
      method="post">

<input type="hidden"
       name="id"
       value="${payment.id}">

<div class="form-group">

<label>Allocation</label>

<select name="allocationId"
        required>

<c:forEach var="allocation"
           items="${allocations}">

<option value="${allocation.id}"
    <c:if test="${payment.allocationId == allocation.id}">
        selected
    </c:if>
>

Allocation #${allocation.id}
-
${allocation.studentName}
-
Room ${allocation.roomNumber}
-
₹ ${allocation.rentAmount}

</option>

</c:forEach>

</select>

</div>

<div class="form-group">

<label>Amount</label>

<input type="number"
       name="amount"
       step="0.01"
       min="0.01"
       value="${payment.amount}"
       required>

</div>

<div class="form-group">

<label>Payment Date</label>

<input type="date"
       name="paymentDate"
       value="${payment.paymentDate}"
       required>

</div>

<div class="form-group">

<label>Month / Year</label>

<input type="text"
       name="monthYear"
       value="${payment.monthYear}"
       required>

</div>

<div class="form-group">

<label>Status</label>

<select name="paymentStatus"
        required>

<option value="Paid"
    <c:if test="${payment.paymentStatus == 'Paid'}">
        selected
    </c:if>
>
    Paid
</option>

<option value="Pending"
    <c:if test="${payment.paymentStatus == 'Pending'}">
        selected
    </c:if>
>
    Pending
</option>

</select>

</div>

<button type="submit">
    Update Payment
</button>

</form>

</c:when>

<c:otherwise>

<p>Payment record not found.</p>

</c:otherwise>

</c:choose>

<br>

<a href="${pageContext.request.contextPath}/payment/list">
    ← Back to Payment List
</a>

</div>

</div>

</body>
</html>