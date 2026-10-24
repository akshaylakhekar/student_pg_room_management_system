<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Edit Visitor</title>

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
            width: 90%;
            max-width: 750px;
            margin: 40px auto;
        }

        .card {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
        }

        .card h2 {
            margin-top: 0;
            margin-bottom: 25px;
            color: #1e293b;
        }

        .info-box {
            background: #eff6ff;
            border: 1px solid #bfdbfe;
            padding: 12px 15px;
            border-radius: 7px;
            margin-bottom: 22px;
            color: #1e40af;
        }

        .student-box {
            background: #f8fafc;
            border: 1px solid #cbd5e1;
            padding: 12px 15px;
            border-radius: 7px;
            color: #334155;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 7px;
            font-weight: bold;
            color: #334155;
        }

        input,
        select {
            width: 100%;
            padding: 11px 12px;
            border: 1px solid #cbd5e1;
            border-radius: 7px;
            font-size: 14px;
            outline: none;
        }

        input:focus,
        select:focus {
            border-color: #2563eb;
        }

        input[readonly] {
            background: #f1f5f9;
            color: #475569;
            cursor: not-allowed;
        }

        .hint {
            margin-top: 6px;
            font-size: 12px;
            color: #64748b;
        }

        .required {
            color: #dc2626;
        }

        .buttons {
            display: flex;
            gap: 12px;
            margin-top: 25px;
        }

        .btn {
            display: inline-block;
            padding: 11px 20px;
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

        .btn-secondary {
            background: #64748b;
            color: white;
        }

        .btn-secondary:hover {
            background: #475569;
        }

        @media (max-width: 600px) {

            .container {
                width: 94%;
                margin: 25px auto;
            }

            .card {
                padding: 20px;
            }

            .buttons {
                flex-direction: column;
            }

            .btn {
                text-align: center;
            }

        }

    </style>

</head>

<body>

    <div class="navbar">

        <h2>
            PG Management System
        </h2>

    </div>

    <div class="container">

        <div class="card">

            <h2>
                Edit Visitor
            </h2>

            <div class="info-box">

                Visitor ID:
                <strong>${visitor.id}</strong>

            </div>

            <form
                action="${pageContext.request.contextPath}/visitor/update"
                method="post">

                <input
                    type="hidden"
                    name="id"
                    value="${visitor.id}">

                <div class="form-group">

                    <label>

                        Student
                        <span class="required">*</span>

                    </label>

                    <c:choose>

                        <c:when test="${sessionScope.role == 'ADMIN'}">

                            <select
                                name="studentId"
                                required>

                                <option value="">

                                    -- Select Student --

                                </option>

                                <c:forEach
                                    var="student"
                                    items="${students}">

                                    <option
                                        value="${student.id}"
                                        <c:if test="${visitor.studentId == student.id}">
                                            selected
                                        </c:if>
                                    >

                                        ${student.name} - ${student.email}

                                    </option>

                                </c:forEach>

                            </select>

                        </c:when>

                        <c:when test="${sessionScope.role == 'STUDENT'}">

                            <input
                                type="text"
                                value="${loggedInStudent.name} - ${loggedInStudent.email}"
                                readonly>

                            <input
                                type="hidden"
                                name="studentId"
                                value="${loggedInStudent.id}">

                            <div class="student-box">

                                This visitor belongs to your account.

                            </div>

                        </c:when>

                    </c:choose>

                </div>

                <div class="form-group">

                    <label>

                        Visitor Name
                        <span class="required">*</span>

                    </label>

                    <input
                        type="text"
                        name="visitorName"
                        value="${visitor.visitorName}"
                        placeholder="Enter visitor name"
                        maxlength="100"
                        required>

                </div>

                <div class="form-group">

                    <label>
                        Relation
                    </label>

                    <input
                        type="text"
                        name="relation"
                        value="${visitor.relation}"
                        placeholder="Example: Father, Friend, Brother"
                        maxlength="50">

                </div>

                <div class="form-group">

                    <label>

                        Entry Time
                        <span class="required">*</span>

                    </label>

                    <input
                        type="datetime-local"
                        name="entryTime"
                        value="${visitor.entryTime}"
                        required>

                </div>

                <div class="form-group">

                    <label>
                        Exit Time
                    </label>

                    <input
                        type="datetime-local"
                        name="exitTime"
                        value="${visitor.exitTime}">

                    <div class="hint">

                        Leave blank if the visitor is still inside.

                    </div>

                </div>

                <div class="buttons">

                    <button
                        type="submit"
                        class="btn btn-primary">

                        Update Visitor

                    </button>

                    <c:choose>

                        <c:when test="${sessionScope.role == 'STUDENT'}">

                            <a
                                href="${pageContext.request.contextPath}/visitor/student?studentId=${loggedInStudent.id}"
                                class="btn btn-secondary">

                                Cancel

                            </a>

                        </c:when>

                        <c:otherwise>

                            <a
                                href="${pageContext.request.contextPath}/visitor/list"
                                class="btn btn-secondary">

                                Cancel

                            </a>

                        </c:otherwise>

                    </c:choose>

                </div>

            </form>

        </div>

    </div>

</body>

</html>