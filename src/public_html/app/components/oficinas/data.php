<?php

function getMiniCursos(){
  $id = getTipoOficinaId('minicurso');
  return getOficinas($id);
}

function getProgramacao($oficina_id){
  $sql = "select descricao, data, duracao from programacao where oficina_id = $oficina_id";
  return fromDatabase($sql);
}

function getOficinas($tipo_oficina_id){
  $sql = "select p.id as participante_id, p.nome as participante, o.titulo, o.id, o.descricao, o.carga_horaria, o.foto, o.vagas, (select count(*) from inscricao_oficina io where io.oficina_id = o.id) as inscricoes  from oficina o left join participante p on o.participante_id = p.id";
  if (isset($tipo_oficina_id)){
    $sql .= " where tipo_oficina_id = $tipo_oficina_id";
  }
  return fromDatabase($sql);
}


function getOficinaFromId($id){
  if (!isset($id))
    return null;
  $sql = "select p.id as participante_id, p.nome as participante, p.empresa as empresa, p.area_atuacao as area_atuacao, o.titulo, o.id, o.descricao, o.foto, o.vagas, ".
         "o.prerequisitos, o.carga_horaria from oficina o left join participante p on o.participante_id = p.id where o.id = $id";
         
  return oneFromDatabase($sql);
}


function getTipoOficinaId($tipo){
  $sql = "select id from tipo_oficina where upper(descricao) = upper('$tipo')";
  $one = oneFromDatabase($sql);
  //dd($one);
  return $one['id'];
}