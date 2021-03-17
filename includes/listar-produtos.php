<?php



$resultados ='';

foreach ($produtos as $item ) {

    $resultados .= '<tr>
                      <td>'.$item->id.'</td>
                      <td>'.$item->nome.'</td>
                      <td>'.$item->qtd.'</td>
                      <td>'.$item->preco.' </td>
                      <td>'.$item->imagem.'</td>
                      <td>
                      <a href="carrinho.php?acao=add&id='.$item->id.'"> 
                         <button type="button" class="btn btn-warning"> Comprar </button>
                       </a>


                      </td>
                      </tr>

                      ';
    
}

$resultados = strlen($resultados) ? $resultados : '<tr>
                                                     <td colspan="6" class="text-center" > Nenhuma Vaga Encontrada !!!!! </td>
                                                     </tr>';


unset($_GET['status']);
unset($_GET['pagina']);
$gets = http_build_query($_GET);

//PAGINAÇÂO

$paginacao = '';
$paginas = $pagination->getPages();

foreach ($paginas as $key => $pagina) {
   $class = $pagina['atual'] ? 'btn-primary' : 'btn-light';
   $paginacao .= '<a href="?pagina='.$pagina['pagina']. '&'.$gets.'">
</section>
                  <button type="button" class="btn '.$class.'">'.$pagina['pagina']. '</button>
                  </a>';
}

?>
<main>


<section>

 <a href="cadastrar.php">

 <button class="btn btn-success"> Nova Vaga </button>

 </a>

</section>

<section>
   <form method="get">
          <div class="row my-4">
              <div class="col">

              <label >Buscar por Nome</label>
                  <input type="text" class="form-control" name="buscar" value="<?=$buscar?>">
              </div>

             

              <div class="col d-flex align-items-end" >
                <button type="submit" class="btn btn-primary" name="" >Pesquisar</button>
              </div>

             
             
          </div>

   </form>
</section>

<section>

<table class="table bg-light mt-4">
  <thead>
  <tr>
     <th> ID </th>
     <th> TITULO </th>
     <th> DESCRIÇÃO </th>
     <th> STATUS </th>
     <th> DATA </th>
     <th> AÇÃO </th>
  </tr>
  </thead>

   <tbody>
   
   <?=$resultados?>

   </tbody>
</table>

</section>

<section>
<?=$paginacao?>
</section>
</main>