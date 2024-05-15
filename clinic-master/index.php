<?php
session_start();

require 'functions.php';


if (isset($_POST["login"])) {

  $email = $_POST["email"];
  $password = $_POST["password"];

  $result = mysqli_query($koneksi, "SELECT * FROM patient WHERE( email = '$email')");

  // cek email
  if (mysqli_num_rows($result) === 1) {
    // cek password
    $row = mysqli_fetch_assoc($result);
    $_SESSION['id_patient'] = $row['id_patient'];
    if (password_verify($password, $row["password"])) {
      // set session 
      $_SESSION["login"] = true;

      header("location: home.php");
      exit;
    }
  }

  $error = true;
}

if (isset($_POST["register"])) {

  if (registrasi($_POST) > 0) {
    echo "<script>
          alert ('Account Created Successfully, Please Sign In!');
          document.location.href = '?p=login';
        </script> ";
  } else {
    echo mysqli_error($koneksi);
  }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
<title>HaHaHealth & Care Medical</title>

<link rel="shortcut icon" href="images/favicon.png">

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<!-- Custom Theme files -->
<link href="css/stylelogin.css" rel="stylesheet" type="text/css" media="all" />
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- web font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200&family=Poppins:wght@300&family=Roboto:wght@500&display=swap" rel="stylesheet">
<!-- //web font -->
</head>
<body>

  <?php
    $p = @$_GET['p'];
    
    switch($p){
    default:
      
    ?>

  <section class="main">
  <div class="layer">
    
    <div class="bottom-grid">
      <div class="logo">
        <img src="images/logo1.png" class="logo-fluid logo">
      </div>
      <div class="links">
        <ul class="links-unordered-list">
          <li class="">
            <a href="?p=login" >SIGN IN</a>
          </li>
          <li class="active">
            <a href="?p=register">SIGN UP</a>
          </li>
        </ul>
      </div>
    </div>
    
    </div>
</section>
  <!-- main -->
  <div class="main-agile">
    <div class="w3ls-grids">
      <div class="w3ls-right">
        <div class="w3l-dot">
          <div class="w3-heading">
            
          </div>
        </div>
      </div>
      <div class="w3ls-left">
        <div class="w3ls-dot">
          
        </div>
      </div>
    </div>
  </div>

  <?php
  break;
  case 'login':
  ?>

  <section class="w3l-workinghny-form">
      <section class="main">
        <div class="layer">
          <div class="bottom-grid">
            <div class="logo">
              <img src="images/logo1.png" class="logo-fluid logo">
            </div>
            <div class="links">
              <ul class="links-unordered-list">
                <li class="">
                  <a href="#">SIGN IN</a>
                </li>
                <li class="active">
                  <a href="#">SIGN UP</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </section>
      <!-- main -->
      <div class="main-agile">
        <div class="w3ls-grids">
          <div class="w3ls-right">
            <div class="w3l-dot">
              <div class="w3-heading">
                
              </div>
            </div>
          </div>
          <div class="w3ls-left">
            <div class="w3ls-dot">
              
            </div>
          </div>
        </div>
      </div>
    </section>  

    <div class="login">
      <div id="login">
        <div class="modal-header border-bottom-0">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <a href="login.php"><span aria-hidden="true">&times;</span></a>
          </button>
        </div>
        <div class="modal-body">
          <div class="form-title text-center">
            <img src="images/logo.png" class="logo-form-login">
          </div><br>
          <div class="d-flex flex-column">
            <form action="" method="post" class="signin-form">
              <div class="form-group mb-3"> <!-- css baris ke 8126 -->
                <label class="label" for="email">Email Address</label>
                <input type="email" class="form-control" id="email" name="email">
              </div>
              <div class="form-group mb-3">
                <label class="label" for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password">
              </div>
              </div>
              <br>
              <div class="form-group"> <!-- css baris ke 8229 -->
                <button type="submit" name="login" class="btn btn-primary rounded submit px-3">SIGN IN</button>
              </div>
              <div class="modal-footer d-flex justify-content-center">
                <div class="signup-section">Don't have an account yet? <a href="?p=register" class="text-info classname">SIGN UP</a></div> 
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

    <?php
    break;
    case 'register':
    ?>

    <section class="w3l-workinghny-form">
      <section class="main">
        <div class="layer">
          <div class="bottom-grid">
            <div class="logo">
              <img src="images/logo1.png" class="logo-fluid logo">
            </div>
            <div class="links">
              <ul class="links-unordered-list">
                <li class="">
                  <a href="#">SIGN IN</a>
                </li>
                <li class="active">
                  <a href="#">SIGN UP</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </section>
      <!-- main -->
      <div class="main-agile">
        <div class="w3ls-grids">
          <div class="w3ls-right">
            <div class="w3l-dot">
              <div class="w3-heading">
                
              </div>
            </div>
          </div>
          <div class="w3ls-left">
            <div class="w3ls-dot">
              
            </div>
          </div>
        </div>
      </div>
    </section>  

      <div class="register">
        <div id="register">
          <div class="modal-header border-bottom-0">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <a href="login.php"><span aria-hidden="true">&times;</span></a>
            </button>
          </div>
          <div class="modal-body">
            <div class="form-title text-center">
              <img src="images/logo.png" class="logo-form">
            </div>
            <div class="d-flex flex-column">
              <form action="" method="post" class="signin-form">
                <div class="form-group mb-3">
                  <label class="label" for="name_patient">Full Name</label>
                  <input type="text" class="form-control" id="name_patient" name="name_patient">
                </div>
                <div class="form-group mb-3">
                  <label class="label" for="email">Email</label>
                  <input type="email" class="form-control" id="email" name="email">
                </div>
                <div class="form-group mb-3">
                  <label class="label" for="password">Password</label>
                  <input type="password" class="form-control" id="password" name="password">
                </div>
                <div class="form-group">
                  <button type="submit" name="register" class="btn btn-primary rounded submit px-3">SIGN UP</button>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                  <div class="signup-section">Already have an account? <a href="?p=login"class="text-info">SIGN IN</a></div> <!-- css baris ke 7931 -->
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>

    <?php } ?>

<!-- /form -->
                


	<!-- //main --> 
	<!--scripts--> 
	<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js'></script>
  <!-- Popper JS -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js'></script>
  <!-- Bootstrap JS -->
  <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js'></script>
   <!-- Custom Script -->      
  <script  src="js/scriptlogin.js"></script>
	<!--//scripts--> 
</body>
</html>