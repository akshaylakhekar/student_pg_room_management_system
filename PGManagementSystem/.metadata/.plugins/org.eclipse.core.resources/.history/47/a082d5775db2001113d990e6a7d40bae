<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student List</title>
</head>
<body>

    <h2>Student List</h2>

    <br>

    <a href="${pageContext.request.contextPath}/student/add">
        Add New Student
    </a>

    <br><br>

    <table border="1" cellpadding="10" cellspacing="0">

        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>Guardian Mobile</th>
                <th>Address</th>
                <th>ID Proof</th>
            </tr>
        </thead>

        <tbody>

            <c:forEach var="student" items="${students}">

                <tr>
                    <td>${student.id}</td>
                    <td>${student.name}</td>
                    <td>${student.email}</td>
                    <td>${student.mobile}</td>
                    <td>${student.guardianMobile}</td>
                    <td>${student.address}</td>
                    <td>${student.idProof}</td>
                </tr>

            </c:forEach>

        </tbody>

    </table>

</body>
</html>