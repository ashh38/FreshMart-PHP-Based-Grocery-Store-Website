<?php include ("inc/connect.inc.php"); ?>
<?php
ob_start();
session_start();
if (isset($_SESSION['user_login'])) {
    header("location: index.php");
    exit();
}

$u_fname = "";
$u_lname = "";
$u_email = "";
$u_mobile = "";
$u_address = "";
$u_pass = "";

if (isset($_POST['signup'])) {
    // Declare variables
    $u_fname = trim($_POST['first_name']);
    $u_lname = trim($_POST['last_name']);
    $u_email = trim($_POST['email']);
    $u_mobile = trim($_POST['mobile']);
    $u_address = trim($_POST['signupaddress']);
    $u_pass = trim($_POST['password']);
    

    try {
        if (empty($u_fname)) {
            throw new Exception('First name cannot be empty');
        }
        if (is_numeric($u_fname[0])) {
            throw new Exception('First name must start with a letter');
        }
        if (empty($u_lname)) {
            throw new Exception('Last name cannot be empty');
        }
        if (is_numeric($u_lname[0])) {
            throw new Exception('Last name must start with a letter');
        }
        if (empty($u_email)) {
            throw new Exception('Email cannot be empty');
        }
        if (empty($u_mobile)) {
            throw new Exception('Mobile cannot be empty');
        }
        if (empty($u_pass)) {
            throw new Exception('Password cannot be empty');
        }
        if (empty($u_address)) {
            throw new Exception('Address cannot be empty');
        }

        // Check if email already exists
        $check = 0;
        $e_check = mysqli_query($con, "SELECT email FROM `user` WHERE email='$u_email'");
        $email_check = mysqli_num_rows($e_check);
        if (strlen($u_fname) > 2 && strlen($u_fname) < 20) {
            if (strlen($u_lname) > 2 && strlen($u_lname) < 20) {
                if ($check == 0) {
                    if ($email_check == 0) {
                        if (strlen($u_pass) > 1) {
                            $d = date("Y-m-d"); // Year - Month - Day
                            $u_fname = ucwords($u_fname);
                            $u_lname = ucwords($u_lname);
                            $u_email = mb_convert_case($u_email, MB_CASE_LOWER, "UTF-8");
                            $hashed_password = password_hash($u_pass, PASSWORD_BCRYPT);
                            $confirmCode = substr(rand() * 900000 + 100000, 0, 6);

                            // Send email (commented out for example)
                            $msg = "
                            Your activation code: $confirmCode
                            Signup email: $u_email
                            ";
                            // mail($u_email, "Activation Code", $msg, "From: no-reply@yourdomain.com");

                            $result = mysqli_query($con, "INSERT INTO user (firstName, lastName, email, mobile, address, password, confirmCode) VALUES ('$u_fname', '$u_lname', '$u_email', '$u_mobile', '$u_address', '$hashed_password', '$confirmCode')");

                            // Success message
                            $success_message = '
                            <div class="signupform_content"><h2>Registration successful!</h2>
                            <div class="signupform_text" style="font-size: 18px; text-align: center;">
                            Email: ' . $u_email . '<br>
                            Activation code sent to your email.<br>
                            Your activation code: ' . $confirmCode . '
                            </div></div>';
                        } else {
                            throw new Exception('Make a stronger password!');
                        }
                    } else {
                        throw new Exception('Email already taken!');
                    }
                } else {
                    throw new Exception('Username already taken!');
                }
            } else {
                throw new Exception('Last name must be 2-20 characters!');
            }
        } else {
            throw new Exception('First name must be 2-20 characters!');
        }
    } catch (Exception $e) {
        $error_message = $e->getMessage();
    }
}
?>

<!doctype html>
<html>
<head>
    <title>Sign Up</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="home-welcome-text" style="background-image: url(image/homebackgrndimg2.png);">
    <div class="homepageheader" style="position: inherit;">
        <div class="signinButton loginButton">
            <div class="uiloginbutton signinButton loginButton" style="margin-right: 40px;">
                <a style="text-decoration: none;" href="signin.php">SIGN UP</a>
            </div>
            <div class="uiloginbutton signinButton loginButton" style="">
                <a style="text-decoration: none;" href="login.php">LOG IN</a>
            </div>
        </div>
        <div style="float: left; margin: 5px 0px 0px 23px;">
            <a href="index.php">
                <img style="height: 75px; width: 130px;" src="image/cart.png">
            </a>
        </div>
        <div>
            <div id="srcheader">
                <form id="newsearch" method="get" action="http://www.google.com">
                    <input type="text" class="srctextinput" name="q" size="21" maxlength="120" placeholder="Search Here...">
                    <input type="submit" value="search" class="srcbutton">
                </form>
                <div class="srcclear"></div>
            </div>
        </div>
    </div>
    <?php 
        if (isset($success_message)) {
            echo $success_message;
        } else {
            echo '
            <div class="holecontainer" style="float: right; margin-right: 36%; padding-top: 26px;">
                <div class="container">
                    <div>
                        <div>
                            <div class="signupform_content">
                                <h2>Sign Up Form!</h2>
                                <div class="signupform_text"></div>
                                <div>
                                    <form action="" method="POST" class="registration">
                                        <div class="signup_form">
                                            <div>
                                                <td>
                                                    <input name="first_name" id="first_name" placeholder="First Name" required="required" class="first_name signupbox" type="text" size="30" value="' . htmlspecialchars($u_fname) . '">
                                                </td>
                                            </div>
                                            <div>
                                                <td>
                                                    <input name="last_name" id="last_name" placeholder="Last Name" required="required" class="last_name signupbox" type="text" size="30" value="' . htmlspecialchars($u_lname) . '">
                                                </td>
                                            </div>
                                            <div>
                                                <td>
                                                    <input name="email" placeholder="Enter Your Email" required="required" class="email signupbox" type="email" size="30" value="' . htmlspecialchars($u_email) . '">
                                                </td>
                                            </div>
                                            <div>
                                                <td>
                                                    <input name="mobile" placeholder="Enter Your Mobile" required="required" class="email signupbox" type="text" size="30" value="' . htmlspecialchars($u_mobile) . '">
                                                </td>
                                            </div>
                                            <div>
                                                <td>
                                                    <input name="signupaddress" placeholder="Write Your Full Address" required="required" class="email signupbox" type="text" size="30" value="' . htmlspecialchars($u_address) . '">
                                                </td>
                                            </div>
                                            <div>
                                                <td>
                                                    <input name="password" id="password-1" required="required" placeholder="Enter New Password" class="password signupbox" type="password" size="30" value="">
                                                </td>
                                            </div>
                                            <div>
                                                <input name="signup" class="uisignupbutton signupbutton" type="submit" value="Sign Me Up!">
                                            </div>
                                            <div class="signup_error_msg">';
                                                if (isset($error_message)) {
                                                    echo $error_message;
                                                }
                                            echo '</div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>';
        }
    ?>
</body>
</html>
