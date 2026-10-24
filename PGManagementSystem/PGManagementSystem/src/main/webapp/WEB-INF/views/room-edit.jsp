<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Edit Room</title>

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
            max-width: 800px;
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

        .message {
            background: #fee2e2;
            color: #991b1b;
            padding: 12px 15px;
            border-radius: 7px;
            margin-bottom: 20px;
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
            background: white;
        }

        input:focus,
        select:focus {
            border-color: #2563eb;
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
        <h2>PG Management System</h2>
    </div>


    <div class="container">

        <div class="card">

            <h2>Edit Room</h2>


            <c:if test="${not empty errorMessage}">

                <div class="message">
                    ${errorMessage}
                </div>

            </c:if>


            <form action="${pageContext.request.contextPath}/room/update"
                  method="post">

                <input type="hidden"
                       name="id"
                       value="${room.id}">


                <div class="form-group">

                    <label>
                        Property <span class="required">*</span>
                    </label>

                    <select name="propertyId" required>

                        <option value="">
                            -- Select Property --
                        </option>

                        <c:forEach var="property"
                                   items="${properties}">

                            <option value="${property.id}"
                                    <c:if test="${room.propertyId == property.id}">
                                        selected
                                    </c:if>>

                                ${property.propertyName}

                            </option>

                        </c:forEach>

                    </select>

                </div>


                <div class="form-group">

                    <label>
                        Room Number <span class="required">*</span>
                    </label>

                    <input type="text"
                           name="roomNumber"
                           value="${room.roomNumber}"
                           placeholder="Example: 101, A-101, Room 1"
                           maxlength="20"
                           required>

                </div>


                <div class="form-group">

                    <label>
                        Capacity <span class="required">*</span>
                    </label>

                    <input type="number"
                           name="capacity"
                           value="${room.capacity}"
                           placeholder="Enter room capacity"
                           min="1"
                           required>

                </div>


                <div class="form-group">

                    <label>
                        Sharing Type <span class="required">*</span>
                    </label>

                    <select name="sharingType" required>

                        <option value="">
                            -- Select Sharing Type --
                        </option>

                        <option value="Single"
                                <c:if test="${room.sharingType == 'Single'}">
                                    selected
                                </c:if>>
                            Single
                        </option>

                        <option value="Double"
                                <c:if test="${room.sharingType == 'Double'}">
                                    selected
                                </c:if>>
                            Double
                        </option>

                        <option value="Triple"
                                <c:if test="${room.sharingType == 'Triple'}">
                                    selected
                                </c:if>>
                            Triple
                        </option>

                        <option value="Four Sharing"
                                <c:if test="${room.sharingType == 'Four Sharing'}">
                                    selected
                                </c:if>>
                            Four Sharing
                        </option>

                    </select>

                </div>


                <div class="form-group">

                    <label>
                        Rent Amount <span class="required">*</span>
                    </label>

                    <input type="number"
                           name="rentAmount"
                           value="${room.rentAmount}"
                           placeholder="Enter monthly rent"
                           min="0"
                           step="0.01"
                           required>

                </div>


                <div class="form-group">

                    <label>
                        Status
                    </label>

                    <select name="status">

                        <option value="">
                            -- Select Status --
                        </option>

                        <option value="Available"
                                <c:if test="${room.status == 'Available'}">
                                    selected
                                </c:if>>
                            Available
                        </option>

                        <option value="Occupied"
                                <c:if test="${room.status == 'Occupied'}">
                                    selected
                                </c:if>>
                            Occupied
                        </option>

                        <option value="Maintenance"
                                <c:if test="${room.status == 'Maintenance'}">
                                    selected
                                </c:if>>
                            Maintenance
                        </option>

                    </select>

                </div>


                <div class="buttons">

                    <button type="submit"
                            class="btn btn-primary">
                        Update Room
                    </button>

                    <a href="${pageContext.request.contextPath}/room/list"
                       class="btn btn-secondary">
                        Cancel
                    </a>

                </div>

            </form>

        </div>

    </div>

</body>

</html>