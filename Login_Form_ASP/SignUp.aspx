<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Login_Form_ASP.SignUp" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <%-- 
        Code By : Bhavesh D. Rathod
        Designation : Jr. NET Developer
        Linkdin Profile : @bhaveshdrathod01 (https://www.linkedin.com/in/bhaveshdrathod01) --%>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup Form</title>

    <%-- Required Filed --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="JS/common.js"></script>

    <style>
        .red-border {
            border: 2px solid red;
        }
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
    <form id="FRM_1" runat="server">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">Sign Up</div>
                        <div class="card-body">
                            <!-- Signup Form -->
                            <div class="custom-form">
                                <div id="dvAlert" class="alert alert-success alert-dismissible d-none">
                                    <button type="button" class="btn-close" onclick="mAlertClose()"></button>
                                    <span id="SpMSG"></span>
                                </div>
                                <div class="mb-3">
                                    <label for="txtname" class="form-label">Name</label>
                                    <input type="text" class="form-control" id="txtname" name="txtname" placeholder="Enter Name" autocomplete="off">
                                </div>
                                <div class="mb-3">
                                    <label for="txtusername" class="form-label">Username</label>
                                    <input type="text" class="form-control" id="txtusername" name="txtusername" onchange="CheckUserExists()" placeholder="Enter Username" maxlength="10" autocomplete="off">
                                </div>
                                <div class="mb-3">
                                    <label for="txtpassword" class="form-label">Password</label>
                                    <div class="input-group">
                                        <input type="password" class="form-control" id="txtpassword" name="txtpassword" placeholder="Enter Password" autocomplete="off">
                                        <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                                            <i class="far fa-eye" id="eyeIcon"></i>
                                        </button>
                                    </div>
                                </div>

                                <button type="submit" name="FRM_1" class="btn btn-primary custom-button" onclick="return Validate()">Sign Up</button>
                                <!-- End Signup Form -->
                                <p class="mt-3">Already have an account? <a href="/Login.aspx">Login here</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-5" style="background-color: white; color: black; font-weight: bold; font-size: 14px; text-align: center;">
                <div class="col-md-4">
                    Code By: Bhavesh D. Rathod
                </div>
                <div class="col-md-4">
                    Designation: Jr. .NET Developer
                </div>
                <div class="col-md-4">
                    Linkedin Profile: <a href="https://www.linkedin.com/in/bhaveshdrathod01" target="_blank">Bhavesh D. Rathod</a>
                </div>
            </div>
        </div>
    </form>
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
    <script>

        $(document).ready(function () {
            $("#togglePassword").click(function () {
                var password = $("#txtpassword");

                if (password.attr("type") === "password") {
                    password.attr("type", "text");
                } else {
                    password.attr("type", "password");
                }
            });
        });
        var gblStrMessage = '<%=gblStrMessage %>';
        var gblStrMessageType = '<%=gblStrMessageType %>';

        if (gblStrMessage != null && gblStrMessage != "" && gblStrMessage != undefined) {
            alertMsg("error", gblStrMessage);
        }

        function Validate() {
            var isValid = true;
            var strMsg = "";

            var name = $('#txtname').val();
            var username = $('#txtusername').val();
            var password = $('#txtpassword').val();

            var usernameRegEx = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\-]).+$/;

            if (name == null || name == "" || name == undefined) {
                $('#txtname').addClass("red-border");
                strMsg += "Please Enter name <br/>";
                isValid = false;
            }
            else {
                $('#txtname').removeClass("red-border");
            }
            if (username == null || username == "" || username == undefined) {
                $('#txtusername').addClass("red-border");
                strMsg += "Please Enter username <br/>";
                isValid = false;
            }
            else {
                if (!usernameRegEx.test(username)) {
                    $('#txtusername').addClass("red-border");
                    strMsg += "Please Enter correct username <br/>";
                    isValid = false;
                }
                else {
                    $('#txtusername').removeClass("red-border");
                }
            }

            if (password == null || password == "" || password == undefined) {
                $('#txtpassword').addClass("red-border");
                strMsg += "Please Enter password <br/>";
                isValid = false;
            }
            else {
                $('#txtpassword').removeClass("red-border");
            }

            if (!isValid) {
                alertMsg("error", strMsg);
            }

            return isValid;
        }

        function CheckUserExists() {
            var username = $('#txtusername').val();
            $.ajax({
                url: 'controller/Common.ashx',
                type: 'GET',
                data: { username: username },
                success: function (data) {
                    if (data != "") {
                        $('#txtusername').addClass("red-border");
                        $('#txtusername').val('');
                        alertMsg("error", data);
                    }
                    else {
                        $('#txtusername').removeClass("red-border");
                    }
                }
            });
        }
    </script>

</body>
</html>

