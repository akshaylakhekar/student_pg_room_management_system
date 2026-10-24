<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Add Rent Payment</title>

    <style>

        * {
            box-sizing: border-box;
        }

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
            background: #16a34a;
            color: white;
            padding: 11px 20px;
            border: none;
            border-radius: 6px;
        }

        .error {
            background: #fee2e2;
            color: #991b1b;
            padding: 12px;
            border-radius: 6px;
            margin-bottom: 20px;
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

<h1>Add Rent Payment</h1>

<c:if test="${not empty errorMessage}">
    <div class="error">
        ${errorMessage}
    </div>
</c:if>

<form action="${pageContext.request.contextPath}/payment/save"
      method="post">

<div class="form-group">

<label>Allocation</label>

<select name="allocationId"
        required>

<option value="">
    -- Select Allocation --
</option>

<c:forEach var="allocation"
           items="${allocations}">

<option value="${allocation.id}"
    <c:if test="${payment.allocationId == allocation.id}">
        selected
    </c:if>
>

    Allocation #${allocation.id}

    -

    <c:choose>

    <c:when test="${not empty allocation.studentName}">
        ${allocation.studentName}
    </c:when>

    <c:otherwise>
        Student ID: ${allocation.studentId}
    </c:otherwise>

    </c:choose>

    -

    <c:choose>

    <c:when test="${not empty allocation.roomNumber}">
        Room ${allocation.roomNumber}
    </c:when>

    <c:otherwise>
        Room ID: ${allocation.roomId}
    </c:otherwise>

    </c:choose>

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
       placeholder="September 2026"
       required>

</div>

<div class="form-group">

<label>Payment Status</label>

<select name="paymentStatus"
        required>

<option value="Paid">
    Paid
</option>

<option value="Pending">
    Pending
</option>

</select>

</div>

<button type="submit">
    Save Payment
</button>

</form>

<br>

<a href="${pageContext.request.contextPath}/payment/list">
    ← Back to Payment List
</a>

</div>

</div>

</body>
</html>