<?php
session_start();
error_reporting(0);
include("dbconnection.php");

$err = '';

if(isset($_POST['submit'])) {
    $email = $_POST['email'];
    $type = $_POST['type'];

    // Vérification si l'e-mail existe dans la base de données pour le type spécifié
    $query = "SELECT * FROM $type WHERE email='$email'";
    $result = mysqli_query($con, $query);

    if(mysqli_num_rows($result) == 1) {
        // Générer un jeton unique pour réinitialiser le mot de passe
        $token = bin2hex(random_bytes(32));

        // Insérer ou mettre à jour le jeton dans la base de données
        $update_token = "UPDATE $type SET reset_token='$token' WHERE email='$email'";
        mysqli_query($con, $update_token);

        // Envoyer l'e-mail avec le lien de réinitialisation à l'utilisateur
        $reset_link = "http://votresite.com/reset-password.php?token=$token&type=$type"; // URL où l'utilisateur réinitialisera son mot de passe
        $to = $email;
        $subject = "Réinitialisation de Mot de Passe";
        $message = "Pour réinitialiser votre mot de passe, cliquez sur le lien suivant : $reset_link";
        $headers = "From: webmaster@example.com" . "\r\n" .
                   "Reply-To: webmaster@example.com" . "\r\n" .
                   "X-Mailer: PHP/" . phpversion();

        if(mail($to, $subject, $message, $headers)) {
            echo "<div class='alert alert-success'>Un lien de réinitialisation de mot de passe a été envoyé à votre adresse e-mail.</div>";
        } else {
            echo "<div class='alert alert-danger'>Erreur lors de l'envoi de l'e-mail de réinitialisation.</div>";
        }
    } else {
        $err = "<div class='alert alert-danger'>L'adresse e-mail n'est pas enregistrée dans notre système pour ce type d'utilisateur.</div>";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>Récupération de Mot de Passe</title>
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
        <h1 class="title"><span>Systeme de Gestion Hospitalière</span> Récupération de Mot de Passe</h1>
        <div class="col-md-12">
            <form method="post" action="" name="frmforgotpassword">
                <div class="input-group">
                    <span class="input-group-addon"><i class="zmdi zmdi-email"></i></span>
                    <div class="form-line">
                        <input type="email" name="email" id="email" class="form-control" placeholder="Entrez votre adresse e-mail" required>
                    </div>
                </div>
                <div class="input-group">
                    <input type="hidden" name="type" value="doctor"> <!-- Remplacez 'doctor' par 'patient' ou 'admin' selon le type d'utilisateur -->
                </div>
                <div class="text-center">
                    <input type="submit" name="submit" value="Envoyer" class="btn btn-raised waves-effect g-bg-cyan">
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
