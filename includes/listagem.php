<?php

$mensagem = '';
if(isset($_GET['status'])){
   switch ($_GET['status']) {
       case 'success':
            $mensagem = '<div class="alert alert-success"> Ação excutada com Sucesso !!! </div>';
           break;
       
       case 'error':
        $mensagem = '<div class="alert alert-success"> Ação não excutada !!! </div>';
           break;
   }
}

$resultados ='';

foreach ($vagas as $vaga ) {

    $resultados .= '<tr>
                      <td>'.$vaga->id.'</td>
                      <td>'.$vaga->titulo.'</td>
                      <td>'.$vaga->descricao.'</td>
                      <td>'.($vaga->ativo == 's' ? 'Ativo' : 'Inativo').' </td>
                      <td>'.date('d/m/Y à\s H:i:s ', strtotime($vaga->data)).'</td>
                      <td>
                       <a href="editar.php?id='.$vaga->id.'">
                         <button type="button" class="btn btn-primary"> Editar</button>
                       </a>

                       <a href="excluir.php?id='.$vaga->id.'">
                       <button type="button" class="btn btn-danger"> Excluir</button>
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
$paginas = $obPagination->getPages();

foreach ($paginas as $key => $pagina) {
   $class = $pagina['atual'] ? 'btn-primary' : 'btn-light';
   $paginacao .= '<a href="?pagina='.$pagina['pagina']. '&'.$gets.'">
</section>
                  <button type="button" class="btn '.$class.'">'.$pagina['pagina']. '</button>
                  </a>';
}

?>
<main>

<?=$mensagem?> 

<section>

 <a href="cadastrar.php">

 <button class="btn btn-success"> Nova Vaga </button>

 </a>

</section>

<section>
   <form method="get">
          <div class="row my-4">
              <div class="col">

              <label >Buscar por título</label>
                  <input type="text" class="form-control" name="buscar" value="<?=$buscar?>">
              </div>

              <div class="col">
               <label >Status</label>
               
               <select name="filtroStatus" class="form-control">
                    <option value="">Ativo / Inativo</option>
                    <option value="s" <?= $filtroStatus == 's' ? 'selected' : '' ?>>Ativa</option>
                    <option value="n"  <?= $filtroStatus == 'n' ? 'selected' : '' ?>>Inativo</option>
               </select>

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