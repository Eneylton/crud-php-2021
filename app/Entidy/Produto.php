<?php 

namespace App\Entidy;

use \App\Db\Database;

use \PDO;


class Produto{
    
    
    public $id;

    public $nome;

    public $preco;

    public $qtd;

    public $imagem;

    /**
     * @return boolean
     */
    public function cadastar(){

        $this-> data = date('Y-m-d H:i:s');

        $obdataBase = new Database('produtos');  
        
        $this->id = $obdataBase->insert([
          
            'nome'       => $this->nome, 
            'preco'      => $this->preco, 
            'qtd'        => $this->qtd, 
            'imagem'     => $this->imagem 

        ]);

        return true;

    }

public static function getProdutos($where = null, $order = null, $limit = null){

    return (new Database ('produtos'))->select($where,$order,$limit)
                                   ->fetchAll(PDO::FETCH_CLASS, self::class);

}

public static function getProdutoUsuarios($where = null, $order = null, $limit = null){

    return (new Database ('usuarios'))->select($where,$order,$limit)
                                   ->fetchAll(PDO::FETCH_CLASS, self::class);

}

public static function getQuantidadeProduto($where = null){

    return (new Database ('produtos'))->select($where,null,null,'COUNT(*) as qtd')
                                   ->fetchObject()
                                   ->qtd;

}


public static function getProdutoID($id){
    return (new Database ('produtos'))->select('id = ' .$id)
                                   ->fetchObject(self::class);
 
}

public static function getBuscarProdutoID($id){
    return (new Database ('produtos'))->buscarID('id = ' .$id)
                                      ->fetchObject(self::class);
                                   
 
}

public function atualizar(){
    return (new Database ('produtos'))->update('id = ' .$this-> id, [

                                                'nome'       => $this->nome, 
                                                'preco'      => $this->preco, 
                                                'qtd'        => $this->qtd, 
                                                'imagem'     => $this->imagem 

    ]);
  
}

public function excluir(){
    return (new Database ('produtos'))->delete('id = ' .$this->id);
  
}

}