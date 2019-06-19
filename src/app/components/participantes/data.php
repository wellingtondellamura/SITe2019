<?php
function getParticipantes(){

  $sql = "select * from (select p.id, p.nome, p.graduacao, p.ano_graduacao, p.pos_graduacao, p.empresa, p.area_atuacao, p.foto, o.titulo as oficina, o.id as oficina_id from participante p left join oficina o on o.participante_id = p.id) AS a GROUP BY id";

  $array = array();
  foreach (getConnection()->query($sql) as $row) {
    $array[] = $row;
  }
  return $array;
}



function getParticipanteFromId($id){
  if (!isset($id))
    return null;
  $sql = "select id, nome, graduacao, ano_graduacao, pos_graduacao, empresa, area_atuacao, resumo, contato, redes_sociais, foto from participante where id = $id";     
  return oneFromDatabase($sql);
}


function getOficinaFromParticipanteId($id){
  if (!isset($id))
    return null;
  $sql = "select o.titulo, o.id, o.descricao, o.foto, o.vagas, ".
         "o.prerequisitos, o.carga_horaria from oficina o where participante_id = $id";
         
  return fromDatabase($sql);
}
