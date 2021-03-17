<?php

require __DIR__.'/vendor/autoload.php';
session_start();



use \App\Entidy\Pedido;
use   \App\Session\Login;

Login::requireLogin();

foreach ($_SESSION['dados'] as $key) {
  
        $item = new Pedido;
        $item->nome          = $key['nome'];
        $item->qtd           = $key['qtd'];
        $item->subtotal      = $key['subtotal'];
        $item->produtos_id   = $key['produtos_id'];
        $item-> cadastar();
    
    }    
    
    header('location: sucesso.php?status=success');
    



