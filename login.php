<?php
session_start();
include 'koneksi.php';


function loginQuery($koneksi, $kolom, $params){
    $query = mysqli_query($koneksi, "SELECT * FROM user WHERE $kolom='$params'");
    if (mysqli_num_rows($query) > 0) {
        return $query;
    }else{
        return false;
    }
}

if(isset($_POST['login'])){
  $email = $_POST['email']; //untuk mengambil nilai dari input
  $password = $_POST['password'];

  $queryLogin = loginQuery($koneksi, "name", $email);
  $queryEmail = loginQuery($koneksi, "email", $email);


  //login dengan username
  if ($queryLogin) {
    $rowLogin = mysqli_fetch_assoc($queryLogin);
    if ($password == $rowLogin['password']) {
      $_SESSION['name'] = $rowLogin['name'];
      $_SESSION['id'] = $rowLogin['id'];
      $_SESSION['id_level'] = $rowLogin['id_level'];
      header("location:index.php");
    } else {
      header("location:login.php?login=gagal");
    }
  } elseif ($queryEmail) {
    $rowLogin = mysqli_fetch_assoc($queryEmail);

    if ($password == $rowLogin['password']) {
        $_SESSION['name'] = $rowLogin['name'];
        $_SESSION['id'] = $rowLogin['id'];
        $_SESSION['id_level'] = $rowLogin['id_level'];
        header("location:index.php");
    } else {
        header("location:login.php?login=gagal");
    }
  }

  //login dengan email
  

//   $queryLogin = mysqli_query($koneksi, "SELECT * FROM user WHERE email='$email'");
  // mysqli_num_row() : untuk melihat total data di dalam table
  if(mysqli_num_rows($queryLogin) > 0) {
    
  } else {
    header("location:login.php?login=gagal");
  }
}

?>
<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
 -->
<!-- beautify ignore:start -->
<html
  lang="en"
  class="light-style customizer-hide"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Login App Laundry</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="assets/assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="assets/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="assets/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="assets/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="assets/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="assets/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->
    <!-- Page -->
    <link rel="stylesheet" href="assets/assets/vendor/css/pages/page-auth.css" />
    <!-- Helpers -->
    <script src="assets/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="assets/assets/js/config.js"></script>
  </head>

  <body>
    <!-- Content -->

    <div class="container-xxl">
      <div class="authentication-wrapper authentication-basic container-p-y">
        <div class="authentication-inner">
          <!-- Register -->
          <div class="card">
            <div class="card-body">
              <!-- Logo -->
              <div class="app-brand justify-content-center">
                <a href="login.php" class="app-brand-link gap-2">
                  <span class="app-brand-logo demo">
                  </span>
                  <span class="app-brand-text demo text-body fw-bolder">laundry app</span>
                </a>
              </div>
              <!-- /Logo -->
              <p class="mb-4">Login with your account</p>

              <form id="formAuthentication" class="mb-3" action="" method="POST">
                <div class="mb-3">
                  <label for="email" class="form-label">Email</label>
                  <input
                    type="text"
                    class="form-control"
                    id="email"
                    name="email"
                    placeholder="Type your email"
                    required
                    autofocus />
                </div>
                <div class="mb-3 form-password-toggle">
                  <div class="d-flex justify-content-between">
                    <label class="form-label" for="password">Password</label>
                    <a href="auth-forgot-password-basic.html">
                      <small>Forgot Password?</small>
                    </a>
                  </div>
                  <div class="input-group input-group-merge">
                    <input
                      required
                      type="password"
                      id="password"
                      class="form-control"
                      name="password"
                      placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                      aria-describedby="password"
                    />
                    <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                  </div>
                </div>
                <div class="mb-3">
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="remember-me" />
                    <label class="form-check-label" for="remember-me"> Remember Me </label>
                  </div>
                </div>
                <div class="mb-3">
                  <button name="login" class="btn btn-primary d-grid w-100" type="submit">Login</button>
                </div>
              </form>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- / Content -->

  <!-- Core JS -->
  <!-- build:js assets/vendor/js/core.js -->
  <script src="assets/assets/vendor/libs/jquery/jquery.js"></script>
  <script src="assets/assets/vendor/libs/popper/popper.js"></script>
  <script src="assets/assets/vendor/js/bootstrap.js"></script>
  <script src="assets/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

  <script src="assets/assets/vendor/js/menu.js"></script>
  <!-- endbuild -->

  <!-- Vendors JS -->

  <!-- Main JS -->
  <script src="assets/assets/js/main.js"></script>

  <!-- Page JS -->

  <!-- Place this tag in your head or just before your close body tag. -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>

</body>

</html>