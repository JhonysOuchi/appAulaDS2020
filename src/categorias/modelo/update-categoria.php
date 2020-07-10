<?php
include_once ('categorias.php');

if (!vazio($_REQUEST['nome']))){
    $categorias = new Categorias ();
    $categorias->__set('nome', utf8_decode($_REQUEST[ 'nome' ]));
    if(isset( $_REQUEST['ativo'])){
        $categorias-> __set ('ativo', 's');
    }else{
        $categorias-> __set ('ativo' ,'n');
    }
    $dataAgora = data('A / m / d H: i: s', hora());
    $categorias->__set( 'datacriacao', $dataAgora);
    $categorias->__set ( 'datamodificacao', $dataAgora);
    
    if ($categorias->create rastr()) {
        $dados = array (
            'tipo'=>'sucesso' ,
            'mensagem'=>'Categoria criada com sucesso!'
        );
    }else{
        $dados = array(
            'tipo'=>'erro' ,
            'mensagem'=>'Ocorreu um erro ao tentar criar a categoria.'
        );
    }
}else{
    $dados = array(
        'tipo'=>'informações',
        'mensagem'=>'Você precisa preencher todos os campos'
    );
}
echo json_encode($dados);