<?php

$resultados ='';

foreach ($vagasUsuarios as $user ) {
   
   $resultados .= '<option value="'.$user->id.'">'.$user->email.'</option>';

}

?>

<main>

<section>

 <a href="index.php">

 <button class="btn btn-success"> Voltar </button>

 </a>

</section>

<h2 class="mt-3"><?=TITLE?></h2>

<form method="post">
   
   <div class="form-group">
        <label >Titulo</label>
        <input type="text" class="form-control" name="titulo" >
   </div>

   <div class="form-group">
        <label >Descrição</label>
        <textarea type="text" class="form-control" name="descricao" rows="5"></textarea>
   </div>

   <div class="form-grop" >
   
   <label for="cars">Lista de Usuários</label>

      <select name="cars" id="user" class="form-control">
         
        <option value="">Selecione um uusuário !!!</option>
          
         <?=$resultados ?>
         
      
      </select>

   </div>


   <div class="form-group">
     
     <label >Status</label>
     <div>
     <div class="form-check form-check-inline">
        <label class="form-control">
        <input type="radio" name="ativo" value="s" checked> Ativo
        </label>
        </div>

        <div class="form-check form-check-inline">
        <label class="form-control">
        <input type="radio" name="ativo" value="n"> Inativo
        </label>
        </div>
     </div>
   </div>

   <div class="form-group"> 

   <button type="submit" class="btn btn-danger">Enviar</button>
   
   </div>

</form>
</main>