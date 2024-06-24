<?php
session_start();
error_reporting(0);
include("dbconnection.php");

$err = '';

if(isset($_POST['submit'])) {
    $newpassword = $_POST['newpassword'];
    $confirmpassword = $_POST['confirmpassword'];
    $token = $_GET['token'];

    // Vérification que les deux mots de passe correspondent
    if($newpassword === $confirmpassword) {
        // Hash du nouveau mot de passe avant de l'enregistrer dans la base de données
        $hashed_password = password_hash($newpassword, PASSWORD_DEFAULT);

        // Mettez à jour le mot de passe dans la base de données pour le patient correspondant au token
        $update_password = "UPDATE patient SET password='$hashed_password', reset_token='' WHERE reset_token='$token'";
        mysqli_query($con, $update_password);

        // Redirigez le patient vers une page de confirmation ou vers le tableau de bord
        echo "<div class='alert alert-success'>Mot de passe réinitialisé avec succès. <a href='patientlogin.php'>Connectez-vous ici</a></div>";
        // Vous pouvez également rediriger l'utilisateur vers une autre page après la réinitialisation
        // header("Location: patientlogin.php");
        // exit();
    } else {
        $err = "<div class='alert alert-danger'>Les mots de passe ne correspondent pas. Veuillez réessayer.</div>";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>Réinitialisation de Mot de Passe Patient</title>
<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">
<link rel="icon" href="favicon.ico" type="image/x-icon">
<!-- Custom Css -->
<link href="assets/css/main.css" rel="stylesheet">
<link href="assets/css/login.css" rel="stylesheet">

<!-- Swift Themes. You can choose a theme from css/themes instead of get all themes -->
<link href="assets/css/themes/all-themes.css" rel="stylesheet" />
</head>
<body class="theme-cyan login-page authentication">

<div class="container">
    <div id="err"><?php echo $err; ?></div>
    <div class="card-top"></div>
    <div class="card">
        <h1 class="title"><span>Système de Gestion Hospitalière</span> Réinitialisation de Mot de Passe Patient</h1>
        <div class="col-md-12">
            <form method="post" action="">
                <div class="input-group">
                    <span class="input-group-addon"><i class="zmdi zmdi-lock"></i></span>
                    <div class="form-line">
                        <input type="password" name="newpassword" id="newpassword" class="form-control" placeholder="Nouveau mot de passe" required>
                    </div>
                </div>
                <div class="input-group">
                    <span class="input-group-addon"><i class="zmdi zmdi-lock-outline"></i></span>
                    <div class="form-line">
                        <input type="password" name="confirmpassword" id="confirmpassword" class="form-control" placeholder="Confirmer le mot de passe" required>
                    </div>
                </div>
                <div class="text-center">
                    <input type="submit" name="submit" value="Réinitialiser le mot de passe" class="btn btn-raised waves-effect g-bg-cyan">
                </div>
            </form>
        </div>
    </div>
</div>

<script src="assets/bundles/libscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->
<script src="assets/bundles/mainscripts.bundle.js"></script><!-- Custom Js -->
</body>
</html>
