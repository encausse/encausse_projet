<?php
include("adheader.php");

include("dbconnection.php");
if(!isset($_SESSION[patientid]))
{
	echo "<script>window.location='patientlogin.php';</script>";
}

$sqlpatient = "SELECT * FROM patient WHERE patientid='$_SESSION[patientid]' ";
$qsqlpatient = mysqli_query($con,$sqlpatient);
$rspatient = mysqli_fetch_array($qsqlpatient);

$sqlpatientappointment = "SELECT * FROM appointment WHERE patientid='$_SESSION[patientid]' ";
$qsqlpatientappointment = mysqli_query($con,$sqlpatientappointment);
$rspatientappointment = mysqli_fetch_array($qsqlpatientappointment);
?>
<div class=" container-fluid">
    <div class="block-header">
        <h2>Dashboard</h2>
    </div>




    <div class="card">
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="card">
                    <div class="header">
                        <div class="alert bg-teal">
                            <h3>bienvenu , <?php echo $rspatient[patientname]; ?>! </h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row clearfix">
            <div class="col-sm-12 col-md-12 col-lg-12">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs">
                    <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#home_animation_1"
                            aria-expanded="true">historique d'enregistrement</a></li>
                    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#profile_animation_1"
                            aria-expanded="false">rendez-vous</a></li>

                </ul>

                <!-- Tab panes -->
                <div class="tab-content" style="padding: 10px">
                    <div role="tabpanel" class="tab-pane animated flipInX active" id="home_animation_1"
                        aria-expanded="true"> <b>historique d'enregistrement</b>
                        <h3>Vous êtes avec nous depuis <?php echo $rspatient[admissiondate]; ?>
                            <?php echo $rspatient[admissiontime]; ?></h3>
                    </div>
                    <div role="tabpanel" class="tab-pane animated flipInX" id="profile_animation_1"
                        aria-expanded="false"> <b>rendez-vous</b>
                        <?php
                        if(mysqli_num_rows($qsqlpatientappointment) == 0)
                        {
                            ?>
                        <h3>Dossiers de rendez-vous introuvables.. </h3>
                        <?php
                        }
                        else
                        {
                            ?>
                        <h3>Dernier rendez-vous pris - <?php echo $rspatientappointment[appointmentdate]; ?>
                            <?php echo $rspatientappointment[appointmenttime]; ?> </h3>
                        <?php
                        }
                        ?>
                    </div>

                </div>
            </div>
        </div>


    </div>
</div>

<?php
include("adfooter.php");
?>