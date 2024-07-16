<?php 
    include("../inc/connect.inc.php"); 
    ob_start();
    session_start();

    // Check if the user is already logged in
    if (!isset($_SESSION['admin_login'])) {
        header("location: login.php");
        exit();
    }

    // Initialize user variables
    $user = $_SESSION['admin_login'];
    $result = mysqli_query($con, "SELECT * FROM admin WHERE id='$user'");
    $get_user_email = mysqli_fetch_assoc($result);
    $uname_db = $get_user_email['firstName'];
    $utype_db = $get_user_email['type'];

    // Initialize form variables
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
            // Validation checks
            if (empty($u_fname) || empty($u_lname) || empty($u_email) || empty($u_mobile) || empty($u_pass) || empty($u_address)) {
                throw new Exception('All fields are required');
            }

            if (!filter_var($u_email, FILTER_VALIDATE_EMAIL)) {
                throw new Exception('Invalid email format');
            }

            if (!preg_match('/^[A-Za-z]+$/', $u_fname) || !preg_match('/^[A-Za-z]+$/', $u_lname)) {
                throw new Exception('First and last names must contain only letters');
            }

            if (strlen($u_pass) < 6) {
                throw new Exception('Password must be at least 6 characters long');
            }

            // Check if email already exists
            $e_check = mysqli_query($con, "SELECT email FROM `user` WHERE email='$u_email'");
            if (mysqli_num_rows($e_check) > 0) {
                throw new Exception('Email already exists');
            }

            // Hash the password
            $hashed_password = password_hash($u_pass, PASSWORD_BCRYPT);

            // Insert the user into the database
            $confirmCode = substr(rand() * 900000 + 100000, 0, 6);
            $sql = "INSERT INTO user (firstName, lastName, email, mobile, address, password, confirmCode) VALUES ('$u_fname', '$u_lname', '$u_email', '$u_mobile', '$u_address', '$hashed_password', '$confirmCode')";
            if (!mysqli_query($con, $sql)) {
                throw new Exception('Error saving user to database: ' . mysqli_error($con));
            }

            // Success message
            $success_message = '
            <div class="signupform_content"><h2>Registration successful!</h2>
            <div class="signupform_text" style="font-size: 18px; text-align: center;">
            Email: ' . $u_email . '<br>
            Activation code sent to your email.<br>
            Your activation code: ' . $confirmCode . '
            </div></div>';
        } catch (Exception $e) {
            $error_message = $e->getMessage();
        }
    }
?>

<!doctype html>
<html>
	<head>
		<title>New Admin</title>
		<link rel="stylesheet" type="text/css" href="../css/style.css">
	</head>
	<body class="home-welcome-text" style="background-image: url(../image/homebackgrndimg2.png);">
		<div class="homepageheader">
			<div class="signinButton loginButton">
				<div class="uiloginbutton signinButton loginButton" style="margin-right: 40px;">
					<?php 
						if ($user!="") {
							echo '<a style="text-decoration: none; color: #fff;" href="logout.php">LOG OUT</a>';
						}
					 ?>
					
				</div>
				<div class="uiloginbutton signinButton loginButton">
					<?php 
						if ($user!="") {
							echo '<a style="text-decoration: none; color: #fff;" href="update_admin.php">Hi '.$uname_db.'</br><span style="color: #de2a74">'.$utype_db.'</span></a>';
						}
						else {
							echo '<a style="text-decoration: none; color: #fff;" href="login.php">LOG IN</a>';
						}
					 ?>
				</div>
			</div>
			<div style="float: left; margin: 5px 0px 0px 23px;">
				<a href="index.php">
					<img style=" height: 75px; width: 130px;" src="../image/cart.png">
				</a>
			</div>
			<div id="srcheader">
				<form id="newsearch" method="get" action="search.php">
				        <?php 
				        	echo '<input type="text" class="srctextinput" name="keywords" size="21" maxlength="120"  placeholder="Search Here..." value=""><input type="submit" value="search" class="srcbutton" >';
				         ?>
				</form>
			<div class="srcclear"></div>
			</div>
		</div>
		<div class="categolis">
			<table>
				<tr>
					<th>
						<a href="index.php" style="text-decoration: none;color:#040403;padding: 4px 12px;background-color: #e6b7b8;border-radius: 12px;">Home</a>
					</th>
					<th><a href="addproduct.php" style="text-decoration: none;color: #040403;padding: 4px 12px;background-color: #e6b7b8;border-radius: 12px;">Add Product</a></th>
					<th><a href="orders.php" style="text-decoration: none;color: #040403;padding: 4px 12px;background-color: #e6b7b8;border-radius: 12px;">Orders</a></th>
					<th><a href="DeliveryRecords.php" style="text-decoration: none;color: #040403;padding: 4px 12px;background-color:#e6b7b8;border-radius: 12px;">DeliveryRecords</a></th>
					<?php 
						if($utype_db == 'admin'){
							echo '<th><a href="report.php" style="text-decoration: none;color: #040403;padding: 4px 12px;background-color: #e6b7b8;border-radius: 12px;">Reports</a></th>
								<th><a href="newadmin.php" style="text-decoration: none;color: #040403;padding: 4px 12px;background-color: #24bfae;;border-radius: 12px;">New Admin</a></th>';
						}
					?>

				</tr>
			</table>
		</div>
		<?php 
			if(isset($success_message)) {echo $success_message;}
			else {
				echo '
					<div class="holecontainer" style="float: right; margin-right: 36%; padding-top: 20px;">
						<div class="container">
							<div>
								<div>
									<div class="signupform_content">
										<h2>New Admin Form!</h2>
										<div class="signupform_text"></div>
										<div>
											<form action="" method="POST" class="registration">
												<div class="signup_form">
													<div>
														<td >
															<input name="first_name" id="first_name" placeholder="First Name" required="required" class="first_name signupbox" type="text" size="30" value="" >
														</td>
													</div>
													<div>
														<td >
															<input name="last_name" id="last_name" placeholder="Last Name" required="required" class="last_name signupbox" type="text" size="30" value="" >
														</td>
													</div>
													<div>
														<td>
															<input name="email" placeholder="Enter Your Email" required="required" class="email signupbox" type="email" size="30" value="">
													</td>
														</div>
													<div>
														<td>
															<input name="mobile" placeholder="Enter Your Mobile" required="required" class="email signupbox" type="text" size="30" value="">
														</td>
													</div>
													<div>
														<td>
															<input name="signupaddress" placeholder="Write Your Full Address" required="required" class="email signupbox" type="text" size="30" value="">
														</td>
													</div>
													<div>
														<td>
															<input name="password" id="password-1" required="required"  placeholder="Enter New Password" class="password signupbox " type="password" size="30" value="">
														</td>
													</div>
													<div>
														<td>
															<select name="admintype" required="required" style=" font-size: 20px;
														font-style: italic;margin-bottom: 3px;margin-top: 0px;padding: 14px;line-height: 25px;border-radius: 4px;border: 1px solid #169E8F;color: #169E8F;margin-left: 0;width: 300px;background-color: transparent;" class="">
																<option selected value="admin">Admin</option>
																<option value="staff">Staff</option>
																
															</select>
														</td>
													</div>
													<div>
														<input name="signup" class="uisignupbutton signupbutton" type="submit" value="Add Admin!">
													</div>
													<div class="signup_error_msg">
														<?php 
															if (isset($error_message)) {echo $error_message;}
															
														?>
													</div>
												</div>
											</form>
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				';
			}
		 ?>
	</body>
</html>
