<?php 

require __DIR__.'/vendor/autoload.php';

use \App\Entidy\Vaga;
use  \App\Db\Pagination;
use   \App\Session\Login;


Login::requireLogin();


$buscar = filter_input(INPUT_GET, 'buscar', FILTER_SANITIZE_STRING);
$filtroStatus = filter_input(INPUT_GET, 'filtroStatus', FILTER_SANITIZE_STRING);
$filtroStatus = in_array($filtroStatus,['n','s']) ? $filtroStatus : '';

$condicoes = [
    strlen($buscar) ? 'titulo LIKE "%'.str_replace(' ','%',$buscar).'%"' : null,
    strlen($filtroStatus) ? 'ativo = "'.$filtroStatus.'"' : null
];

$condicoes = array_filter($condicoes);

$where = implode(' AND ', $condicoes);

$quantidadeVagas = Vaga:: getQuantidadeVagas($where);


$obPagination = new Pagination($quantidadeVagas, $_GET['pagina'] ?? 1, 5);



$vagas = Vaga::getVagas($where, null,$obPagination->getLimit());

include __DIR__.'/includes/header.php';
include __DIR__.'/includes/listagem.php';
include __DIR__.'/includes/footer.php';