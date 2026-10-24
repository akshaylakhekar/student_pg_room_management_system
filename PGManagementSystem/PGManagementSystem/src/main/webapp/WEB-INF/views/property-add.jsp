<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Add Property</title>

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
        textarea {
            width: 100%;
            padding: 11px 12px;
            border: 1px solid #cbd5e1;
            border-radius: 7px;
            font-size: 14px;
            outline: none;
        }

        input:focus,
        textarea:focus {
            border-color: #2563eb;
        }

        textarea {
            min-height: 100px;
            resize: vertical;
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

            <h2>Add New Property</h2>

            <form action="${pageContext.request.contextPath}/property/save"
                  method="post">


                <div class="form-group">

                    <label>
                        Property Name <span class="required">*</span>
                    </label>

                    <input type="text"
                           name="propertyName"
                           value="${property.propertyName}"
                           placeholder="Enter property name"
                           maxlength="100"
                           required>

                </div>


                <div class="form-group">

                    <label>
                        Property Address <span class="required">*</span>
                    </label>

                    <textarea name="address"
                              placeholder="Enter complete property address"
                              maxlength="255"
                              required>${property.address}</textarea>

                </div>


                <div class="form-group">

                    <label>
                        Owner Name <span class="required">*</span>
                    </label>

                    <input type="text"
                           name="ownerName"
                           value="${property.ownerName}"
                           placeholder="Enter owner name"
                           maxlength="100"
                           required>

                </div>


                <div class="form-group">

                    <label>
                        Contact Number <span class="required">*</span>
                    </label>

                    <input type="tel"
                           name="contactNumber"
                           value="${property.contactNumber}"
                           placeholder="Enter owner contact number"
                           maxlength="15"
                           required>

                </div>


                <div class="buttons">

                    <button type="submit"
                            class="btn btn-primary">
                        Save Property
                    </button>

                    <a href="${pageContext.request.contextPath}/property/list"
                       class="btn btn-secondary">
                        Cancel
                    </a>

                </div>

            </form>

        </div>

    </div>

</body>

</html>