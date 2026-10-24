<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Edit Allocation</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
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
            padding: 11px 20px;
            background: #2563eb;
            color: white;
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

<h1>Edit Room Allocation</h1>

<c:if test="${not empty errorMessage}">
    <div class="error">
        ${errorMessage}
    </div>
</c:if>

<c:choose>

<c:when test="${not empty allocation}">

<form action="${pageContext.request.contextPath}/allocation/update"
      method="post">

    <input type="hidden"
           name="id"
           value="${allocation.id}">

    <div class="form-group">

        <label>Student</label>

        <select name="studentId"
                required>

            <c:forEach var="student"
                       items="${students}">

                <option value="${student.id}"
                    <c:if test="${allocation.studentId == student.id}">
                        selected
                    </c:if>
                >

                    ${student.name}
                    -
                    ${student.mobile}

                </option>

            </c:forEach>

        </select>

    </div>

    <div class="form-group">

        <label>Room</label>

        <select name="roomId"
                required>

            <c:forEach var="room"
                       items="${rooms}">

                <option value="${room.id}"
                    <c:if test="${allocation.roomId == room.id}">
                        selected
                    </c:if>
                >

                    ${room.propertyName}
                    -
                    Room ${room.roomNumber}
                    -
                    ₹ ${room.rentAmount}

                </option>

            </c:forEach>

        </select>

    </div>

    <div class="form-group">

        <label>Allocation Date</label>

        <input type="date"
               name="allocationDate"
               value="${allocation.allocationDate}"
               required>

    </div>

    <div class="form-group">

        <label>Checkout Date</label>

        <input type="date"
               name="checkoutDate"
               value="${allocation.checkoutDate}">

    </div>

    <div class="form-group">

        <label>Status</label>

        <select name="status"
                required>

            <option value="Active"
                <c:if test="${allocation.status == 'Active'}">
                    selected
                </c:if>
            >
                Active
            </option>

            <option value="Checked Out"
                <c:if test="${allocation.status == 'Checked Out'}">
                    selected
                </c:if>
            >
                Checked Out
            </option>

        </select>

    </div>

    <button type="submit">
        Update Allocation
    </button>

</form>

</c:when>

<c:otherwise>

    <p>Allocation record not found.</p>

</c:otherwise>

</c:choose>

<br>

<a href="${pageContext.request.contextPath}/allocation/list">
    ← Back to Allocation List
</a>

</div>

</div>

</body>
</html>