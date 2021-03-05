<?php 

require __DIR__.'/vendor/autoload.php';

define('TITLE','Cadastrar Vaga');

use \App\Entidy\Vaga;
use   \App\Session\Login;


Login::requireLogin();

if(isset($_POST['titulo'], $_POST['descricao'], $_POST['ativo'])){
    $obVagas = new Vaga;
    $obVagas->titulo = $_POST['titulo'];
    $obVagas->descricao = $_POST['descricao'];
    $obVagas->ativo = $_POST['ativo'];
    $obVagas-> cadastar();

    header('location: index.php?status=success');

    exit;
}

include __DIR__.'/includes/header.php';
include __DIR__.'/includes/formulario.php';
include __DIR__.'/includes/footer.php';