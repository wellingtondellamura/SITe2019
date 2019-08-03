<?php
require_once 'data.php';
$id = fromGet('id');
$data = getOficinaFromId($id);
if (!isset($data)) {
  echo "<h1> Informação não encontrada...</h1>";
} else {
    $prerequisitos = strlen($data['prerequisitos'])>0? "<strong>Pré-requisitos: </strong>".$data['prerequisitos'] : "";
    $vagas = $data['vagas']>0? $data['vagas'] . " vagas" : "Palestra";
  ?>
  <div class="col-md-12 col-lg-12">
    <div class="row align-items-center my-5">
      <div class="col-lg-3">
        <img src="images/common/<?= $data['foto'] ?>" alt="<?= $data['titulo'] ?>" style="width: 100%;">
      </div>
      <div class="col-lg-9">
        <h3 class="font-weight-light"><?= $data['titulo'] ?></h3>
        <p class="text-right ">
          <span class="badge badge-outline-info"><?= $data['carga_horaria'] ?>h</span>
          <span class="badge badge-danger"><?= $vagas?></span>
        </p>
        <p>
          <strong>Palestrante: </strong> <a href="nav.php?page=participante&id=<?= $data['participante_id'] ?>"><?= $data['participante'] ?></a> <br />
          <strong>Área: </strong> <?= $data['area_atuacao'] ?> (<?= $data['empresa'] ?>)
        </p>

        </p>
      </div>
    </div>
    <p class="text-justify text-muted"><?= $data['descricao'] ?></p>
    <p class="text-justify"> <?=$prerequisitos?></p>
  </div>
<?php
}
?>