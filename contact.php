<?php include 'header.php'; ?>

<!-- Contenu -->
<div id="content"> 

    <!-- Contactez-nous -->
    <section class="p-t-b-150"> 
        <!-- FORMULAIRE DE CONTACT -->
        <div class="container"> 
            <!-- Titre -->
            <div class="heading-block">
                <h4>Contactez-nous</h4>
                <hr>
                <span>Vous avez une question ? Contactez nous !</span>
            </div>
            <div class="contact">
                <div class="contact-form"> 
                    <!-- FORMULAIRE -->
                    <form role="form" id="contact_form" class="contact-form" method="post" onSubmit="return false">
                        <div class="row">
                            <div class="col-md-6">
                                <ul class="row">
                                    <li class="col-sm-12">
                                        <label>
                                            <input type="text" class="form-control" name="name" id="name" placeholder="*Nom">
                                        </label>
                                    </li>
                                    <li class="col-sm-12">
                                        <label>
                                            <input type="text" class="form-control" name="email" id="email" placeholder="*Email">
                                        </label>
                                    </li>
                                    <li class="col-sm-12">
                                        <label>
                                            <input type="text" class="form-control" name="company" id="company" placeholder="Téléphone">
                                        </label>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-6">
                                <ul class="row">
                                    <li class="col-sm-12">
                                        <label>
                                            <input type="text" class="form-control" name="website" id="website" placeholder="Département">
                                        </label>
                                    </li>
                                    <li class="col-sm-12">
                                        <label>
                                            <textarea class="form-control" name="message" id="message" rows="5" placeholder="*Message"></textarea>
                                        </label>
                                    </li>
                                    <li class="col-sm-12 no-margin">
                                        <button type="submit" value="submit" class="btn" id="btn_submit" onClick="proceed();">ENVOYER LE MESSAGE</button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

  <!-- Carte Google Maps -->
 <div class="mb-4">
      <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2624.999767433481!2d2.2944813156745067!3d48.85884407928778!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e66f77f0fba0db%3A0x4313fe1a5db19560!2sTour%20Eiffel!5e0!3m2!1sfr!2sfr!4v1625146369530!5m2!1sfr!2sfr" width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
  </div>
</div>
 

<!-- Pied de page -->
<?php include 'footer.php'; ?>

