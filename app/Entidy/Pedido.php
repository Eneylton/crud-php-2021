<?php 

namespace App\Entidy;

use \App\Db\Database;

use \PDO;


class Pedido{
    
    
    public $id;

    public $qtd;

    public $subtotal;

    public $produtos_id;

    /**
     * @return boolean
     */
    public function cadastar(){

        $this-> data = date('Y-m-d H:i:s');

        $obdataBase = new Database('pedido');  
        
        $this->id = $obdataBase->insert([
          
            'nome'            => $this->nome, 
            'qtd'             => $this->qtd, 
            'subtotal'        => $this->subtotal, 
            'produtos_id'     => $this->produtos_id 

        ]);

        return true;

    }

public static function getProdutos($where = null, $order = null, $limit = null){

    return (new Database ('pedido'))->select($where,$order,$limit)
                                   ->fetchAll(PDO::FETCH_CLASS, self::class);

}

public static function getProdutoUsuarios($where = null, $order = null, $limit = null){

    return (new Database ('usuarios'))->select($where,$order,$limit)
                                   ->fetchAll(PDO::FETCH_CLASS, self::class);

}

public static function getQuantidadeProduto($where = null){

    return (new Database ('pedido'))->select($where,null,null,'COUNT(*) as qtd')
                                   ->fetchObject()
                                   ->qtd;

}


public static function getProdutoID($id){
    return (new Database ('pedido'))->select('id = ' .$id)
                                   ->fetchObject(self::class);
 
}

public static function getBuscarProdutoID($id){
    return (new Database ('pedido'))->buscarID('id = ' .$id)
                                      ->fetchObject(self::class);
                                   
 
}

public function atualizar(){
    return (new Database ('pedido'))->update('id = ' .$this-> id, [

                                                        'nome'            => $this->nome, 
                                                        'qtd'             => $this->qtd, 
                                                        'subtotal'        => $this->subtotal, 
                                                        'produtos_id'     => $this->produtos_id 

    ]);
  
}

public function excluir(){
    return (new Database ('pedido'))->delete('id = ' .$this->id);
  
}

}