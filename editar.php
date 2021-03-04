<?php 

require __DIR__.'/vendor/autoload.php';

define('TITLE','Editar Vaga');

use \App\Entidy\Vaga;

if(!isset($_GET['id']) or !is_numeric($_GET['id'])){
 
    header('location: index.php?status=error');

    exit;
}

$obVagas = Vaga::getVagasID($_GET['id']);

if(!$obVagas instanceof Vaga){
    header('location: index.php?status=error');

    exit;
}



if(isset($_POST['titulo'], $_POST['descricao'], $_POST['ativo'])){
    
    $obVagas->titulo = $_POST['titulo'];
    $obVagas->descricao = $_POST['descricao'];
    $obVagas->ativo = $_POST['ativo'];
    $obVagas-> atualizar();

    header('location: index.php?status=success');

    exit;
}

include __DIR__.'/includes/header.php';
include __DIR__.'/includes/formulario.php';
include __DIR__.'/includes/footer.php';