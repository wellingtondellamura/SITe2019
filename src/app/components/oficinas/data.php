<?php

function getMiniCursos(){
  $id = getTipoOficinaId('minicurso');
  return getOficinas($id);
}

function getOficinas($tipo_oficina_id){
  $sql = "select p.id as participante_id, p.nome as participante, o.titulo, o.id, o.descricao, o.foto from oficina o left join participante p on o.participante_id = p.id";
  if (isset($tipo_oficina_id)){
    $sql .= " where tipo_oficina_id = $tipo_oficina_id";
  }
  return fromDatabase($sql);
}


function getTipoOficinaId($tipo){
  $sql = "select id from tipo_oficina where upper(descricao) = upper('$tipo')";
  $one = oneFromDatabase($sql);
  //dd($one);
  return $one['id'];
}