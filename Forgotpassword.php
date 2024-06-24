<?php
session_start();
error_reporting(0);
include("header.php");
include("dbconnection.php");

?>

<div class="wrapper col2">
  <div id="breadcrumb">
    <ul>
      <li class="first">Ajouter votre nouveau mot de passe </li></ul>
  </div>
</div>
<div class="wrapper col4">
  <div id="container">
    <h1>Ajouter votre nouveau mot de passe</h1>
    <table width="200" border="3">
      <tbody>
        <tr>
          <td width="34%">login</td>
          <td width="66%"><input type="text" name="loginid" id="loginid" /></td>
        </tr>
        <tr>
        <tr>
          <td width="34%">mot de passe</td>
          <td width="66%"><input type="text" name="loginid" id="loginid" /></td>
        </tr>
        <tr>
        <tr>
          <td width="34%"> confirmer le mot de passe</td>
          <td width="66%"><input type="text" name="loginid" id="loginid" /></td>
        </tr>
        <tr>

          <td height="36" colspan="2" align="center"><input type="submit" name="submit" id="submit" value="Enregistrer" /></td>
        </tr>
      </tbody>
    </table>
    <p>&nbsp;</p>
  </div>
</div>
</div>
 <div class="clear"></div>
  </div>
</div>
<?php
include("footer.php");
?>