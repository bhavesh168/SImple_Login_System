<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="Login_Form_ASP.Welcome" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <%-- 
        Code By : Bhavesh D. Rathod
        Designation : Jr. NET Developer
        Linkdin Profile : @bhaveshdrathod01 (https://www.linkedin.com/in/bhaveshdrathod01) --%>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome Bhavesh</title>
    <!-- Add Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
    <style>
        /* Pink Gradient Border for Form */
        .custom-form {
            border: 2px solid transparent;
            background: linear-gradient(to bottom, pink, white);
            background-clip: padding-box; /* Ensures the gradient doesn't cover the border */
            border-radius: 10px; /* Rounded corners */
            padding: 20px; /* Add some padding to separate content from border */
        }

        /* Green Gradient Background for Button */
        .custom-button {
            background: linear-gradient(to bottom, #4CAF50, #45a049);
            border: none;
            color: white;
        }

            /* Hover effect for the button */
            .custom-button:hover {
                background: linear-gradient(to bottom, #45a049, #4CAF50);
            }

        /* Background Image for the Body */
        body {
            background-image: url('./Sources/Demo.jpg');
            background-size: cover; /* Adjust the background image to cover the entire body */
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center center; /* Center the background image */
        }

        /* Styling for the Welcome Message */
        .welcome-card {
            border: 2px solid #4CAF50; /* Green border */
            border-radius: 10px; /* Rounded corners */
            padding: 20px; /* Add some padding to separate content from border */
            text-align: center; /* Center-align text */
            background-color: pink; /* Pink background */
            color: #4CAF50; /* Green text color */
        }

        /* Bold text */
        .bold-text {
            font-weight: bold;
        }

        /* Styling for the Logout Button */
        .logout-button {
            background: linear-gradient(to bottom, #FF5733, #FF4B00);
            border: none;
            color: white;
            border-radius: 10px;
            padding: 10px 20px;
            margin-top: 20px;
            cursor: pointer;
        }

            /* Hover effect for the Logout Button */
            .logout-button:hover {
                background: linear-gradient(to bottom, #FF4B00, #FF5733);
            }

        /* Sticky Footer */
        .footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            background-color: white;
            color: black;
            font-weight: bold;
            font-size: 14px;
            text-align: center;
            padding: 10px 0;
        }
    </style>
</head>
<body>
    <form id="FRM_2" runat="server">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card welcome-card">
                        <!-- Display Welcome Message -->
                        <p class="bold-text"><%=gblStrMsg %>, <%=gblStrName %>!</p>
                        <p class="bold-text">You have successfully logged in.</p>
                        <!-- End Welcome Message -->
                        <!-- Logout Button -->
                        <button type="submit" name="Logout" class="btn btn-danger logout-button">Logout</button>
                        <!-- End Logout Button -->
                    </div>
                </div>
            </div>
        </div>
    </form>
    <!-- Add Bootstrap JS (optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Responsive Footer -->
    <div class="container-fluid footer">
        <div class="row">
            <div class="col-md-4">
                Code By: Bhavesh D. Rathod
            </div>
            <div class="col-md-4">
                Designation: Jr. NET Developer
            </div>
            <div class="col-md-4">
                Linkedin Profile: <a href="https://www.linkedin.com/in/bhaveshdrathod01" target="_blank">Bhavesh D. Rathod</a>
            </div>
        </div>
    </div>
</body>
</html>

