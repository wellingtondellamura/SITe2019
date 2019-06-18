<?php
function getParticipantes(){

  $sql = "select * from (select p.id, p.nome, p.graduacao, p.ano_graduacao, p.pos_graduacao, p.empresa, p.area_atuacao, p.foto, o.titulo as oficina, o.id as oficina_id from participante p left join oficina o on o.participante_id = p.id) AS a GROUP BY id";

  $array = array();
  foreach (getConnection()->query($sql) as $row) {
    $array[] = $row;
  }
  return $array;
}
