<?php
require_once("../../util.php");
require_once("../../database/connection.php");

$data['cpf'] = fromPost('cpf');
$data['email'] = fromPost('email');
$messages = "";
$messages .= ((empty($data['cpf']))?("<li>O campo CPF é obrigatório</li>"):"");
$messages .= ((empty($data['email']))?("<li>O campo e-mail é obrigatório</li>"):"");

if (strlen($messages) > 0){
  $messages = "<ul>".$messages."</ul>";
  toSession("messages", $messages);
  toSession("data", $data);
  header("Location: ../../../nav.php?page=painel"); 
  exit();
}

$inscricoes = database_find("inscricao", "cpf",  $data['cpf']);

foreach ($inscricoes as $i) {
  if ($i['email'] == $data['email']){
    $inscricao = $i;
    break;
  }
}
if (!isset($inscricao)){
  $messages = "Sua inscrição não foi encontrada";
  toSession("messages", $messages);
  header("Location: ../../../nav.php?page=painel"); 
  exit();
}

$minicursos_obj = database_find("inscricao_oficina", "inscricao_id",  $inscricao['id']);
$minicursos = array();
foreach ($minicursos_obj as $m) {  
  array_push($minicursos, $m['oficina_id']);
}

toSession("subscription", $inscricao);
toSession("minicursos",  $minicursos);
header("Location: ../../../nav.php?page=cobranca"); 
