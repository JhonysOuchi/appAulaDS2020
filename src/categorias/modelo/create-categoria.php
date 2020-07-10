<?php
include_once ( '../../banco/conn.php' );

class Categorias{
    private $idcategoria = null;
    private $nome = null;
    private $ativo = null;
    private $datacriacao = null;
    private $datamodificacao = null;
    private $erro = null;

    function pública__get($var){
        return $this->$var;
    }
    function pública__set($var, $value){
        $this->$var = $value;
    }

    function  públicacreaterastr(){
        $conexão = new Conn();
        $conn = $connection-> getConn();

        $sql = "INSERIR EM CATEGORIAS (nome, ativo, datacriacao, datamodificacao) VALORES (?,?,?,?)";

        try{
            $stmt = $conn-> preparar ($sql);
            $stmt->bind_param ('ssss', $this->nome, $this->ativo, $this->datacriacao, $this->datamodificacao);
            $stmt->execute ();
            return true;
        }catch(exception $erro){
            $this->erro = $erro;
            return false;
        }finally {
            $conn->close();
        }
    }

    public function listrastr(){
        $conexão = new Conn();
        $conn = $connection->getConn();

        $sql = "SELECT * FROM categorias";

        try{
            $stmt = $conn->consulta ($sql);
            while ($dado = $stmt->fetch_assoc()){
                $resultado[] = $dado;
            }
            if (!isset ($resultado)){
                no definido ( $resultado );
                return  falso ;
            }else{
                return  $resultado ;
            }
        }catch (exception  $erro){
            $this->erro = $erro;
            return falso;
        }finally{
            $conn->close();
        }
    }
}