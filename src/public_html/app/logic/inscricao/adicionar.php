<?php
require_once("../../util.php");
require_once("../../database/connection.php");

$data['cpf'] = fromPost('cpf');
$data['nome'] = fromPost('nome');
$data['apelido'] = fromPost('apelido');
$data['email'] = fromPost('email');
$data['data_nascimento'] = fromPost('dataNascimento');
$data['telefone'] = fromPost('telefone');
$data['cep'] = fromPost('cep');
$data['endereco'] = fromPost('endereco');
$data['bairro'] = fromPost('bairro');
$data['complemento'] = fromPost('complemento');
$data['cidade'] = fromPost('cidade');
$data['estado'] = fromPost('estado');
$data['perfil'] = fromPost('perfil');
$data['graduacao'] = fromPost('graduacao');
$data['instituicao'] = fromPost('instituicao');
$data['ip_origem'] = $_SERVER['REMOTE_ADDR'];
$minicursos = fromPost('minicursos');
$confirma = fromPost('checkConfirma');

$messages = "";
$messages .= ((empty($data['cpf']))?("<li>O campo CPF é obrigatório</li>"):"");
$messages .= ((empty($data['nome']))?("<li>O campo Nome é obrigatório</li>"):"");
$messages .= ((empty($data['apelido']))?("<li>O campo Apelido é obrigatório</li>"):"");
$messages .= ((empty($data['email']))?("<li>O campo E-mail é obrigatório</li>"):"");
$messages .= ((empty($data['data_nascimento']))?("<li>O campo Data de Nascimento é obrigatório</li>"):"");
$messages .= ((empty($data['telefone']))?("<li>O campo Telefone é obrigatório</li>"):"");
$messages .= ((empty($data['cep']))?("<li>O campo CEP é obrigatório</li>"):"");
$messages .= ((empty($data['endereco']))?("<li>O campo Endereço é obrigatório</li>"):"");
$messages .= ((empty($data['bairro']))?("<li>O campo Bairro é obrigatório</li>"):"");
$messages .= ((empty($data['cidade']))?("<li>O campo Cidade é obrigatório</li>"):"");
$messages .= ((empty($data['estado']))?("<li>O campo Estado é obrigatório</li>"):"");
$messages .= ((empty($data['perfil']))?("<li>O campo Perfil é obrigatório</li>"):"");
$messages .= ((empty($data['graduacao']))?("<li>O campo Graduação é obrigatório</li>"):"");
$messages .= ((empty($data['instituicao']))?("<li>O campo Instituição é obrigatório</li>"):"");

if (!isset($confirma)){
  $messages .= ("<li>Você precisa aceitar os termos para se cadastrar</li>");
}

if (strlen($messages) > 0){
  $messages = "<ul>".$messages."</ul>";
  toSession("messages", $messages);
  toSession("data", $data);
  toSession("minicursos", $minicursos);
  toSession("confirma", $confirma);
  header("Location: ../../../nav.php?page=formulario"); 
  exit();
}

$res = database_create("inscricao", $data);

if ($res>0) {
  foreach ($minicursos as $m) {
    $io['inscricao_id'] = $res;
    $io['oficina_id'] = $m;
    $s = database_create("inscricao_oficina", $io);
    if ($s <= 0){
      $messages .= "Não foi possível se inscrever na oficina $m";
    }
  }
  $data['id'] = $res;
  //registrar_titulo(getTitulo(3118067, 25191, $res),  $data_vencimento, $valor, $inscricao_id);
  if (strlen($messages) > 0){
    $messages = "<ul>".$messages."</ul>";
    toSession("messages", $messages);
  }
  toSession("subscription", $data);
  toSession("minicursos", $minicursos);
  header("Location: ../../../nav.php?page=cobranca"); 
} else {
  $messages .= "Impossível adicionar no banco de dados $res";
  $messages = "<ul>".$messages."</ul>";
  toSession("messages", $messages);
  header("Location: ../../../nav.php?page=formulario");   
}
