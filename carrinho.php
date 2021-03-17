<?php

require __DIR__.'/vendor/autoload.php';
session_start();

use \App\Entidy\Produto;
use   \App\Session\Login;

include __DIR__.'/includes/header.php';

Login::requireLogin();


if (!isset($_SESSION['carrinho'])) {

    $_SESSION['carrinho'] = array();
}



if (isset($_GET['acao'])) {
    
    if ($_GET['acao'] == 'add') {
        
        $id = intval($_GET['id']);
        
        if (!isset($_SESSION['carrinho'][$id])) {
            
            $_SESSION['carrinho'][$id] = 1;
        } else {
            $_SESSION['carrinho'][$id] += 1;
        }
        
    }
   

    if ($_GET['acao'] == 'del') {
        $id = intval($_GET['id']);

        if (isset($_SESSION['carrinho'][$id])) {
            unset($_SESSION['carrinho'][$id]);
        }
    }

    if ($_GET['acao'] == 'up') {

        if (is_array($_POST['prod'])) {

            foreach ($_POST['prod'] as $id => $qtd) {

                $id  = intval($id);
                $qtd = intval($qtd);

                if (!empty($qtd) || $qtd != 0) {
                   
                    $_SESSION['carrinho'][$id] = $qtd;

                }else{

                    unset($_SESSION['carrinho'][$id]);
                }
            }
        }

    }
}

echo '
<main>


<section>

 <a href="produtos.php">

 <button class="btn btn-success"> Voltar a Comprar </button>

 </a>

</section>

<section>
   <form method="get">
          <div class="row my-4">
              <div class="col">

              <label >Buscar por Produto</label>
                  <input type="text" class="form-control" name="buscar" value="">
              </div>

             

              <div class="col d-flex align-items-end" >
                <button type="submit" class="btn btn-primary" name="" >Pesquisar</button>
                &nbsp&nbsp&nbsp&nbsp
                <a class="btn btn-warning" href="finalizar.php">
                Finalizar
                </a>
              </div>

              <div class="col d-flex align-items-end" >
              </div
          </div>

   </form>

  
</section>

<section>

<table class="table bg-light mt-4">
  <thead>
  <tr>
     <th> ID </th>
     <th> NOME </th>
     <th> QTD </th>
     <th> VALOR </th>
     <th> REMOVER </th>
     <th> SUBTOTAL </th>

  </tr>
  </thead>
  <form action="?acao=up" method="post">
   <tbody>

   ';

   if (count($_SESSION['carrinho']) == 0) {
    echo "<tr>
    <td>
    Nenhum produro adicionado.....
    </td>
    </tr>";
} else {
    
    $_SESSION['dados'] = array();

    $total =  0;
    foreach ($_SESSION['carrinho'] as $id => $qtd) {

            $item = Produto::getBuscarProdutoID($id);
            
            $sub = $qtd * $item->preco; 

            $total +=$sub;

            echo '
            
            <tr>
                <td>' . $id . '</td>
                <td>' . $item->nome . '</td>
                <td>
                
                <input type="text" size="3" name="prod[' .$id. ']" value="' . $qtd . '" /> 
                <input type="submit" value="Atualizar" />
                </td>
                <td> R$ ' . number_format($item->preco,"2",",",".") . '</td>
                <td> <a href="?acao=del&id=' . $id . '">Remover </a></td>
                <td> R$ ' .number_format($qtd * $item->preco,"2",",","."). '</td>
            </tr>
            
         
            ';

            
            array_push(
                $_SESSION['dados'],
    
                array(
                    'nome'         => $item->nome,
                    'qtd'          => $qtd,
                    'preco'        => $item->preco,
                    'subtotal'     => $sub,
                    'produtos_id'  => $id,
                )
            );

    }

}

 
echo '
<tr>
<td colspan="5">TOTAL</td>

<td>
 
 <button type="submit" class="btn btn-dark btn-sm" name="" >
 
    R$ '.number_format($total,"2",",",".").'

 </button>
</td>
</tr> 
</tbody>
</form>
</table>

</section>

<section>
<?=$paginacao?>
</section>
</main>
';





include __DIR__.'/includes/footer.php';