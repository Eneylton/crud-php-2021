<?php 

require __DIR__.'/vendor/autoload.php';
use   \App\Session\Login;

Login::requireLogin();


include __DIR__.'/includes/header.php';
include __DIR__.'/includes/sucesso-form.php';
include __DIR__.'/includes/footer.php';