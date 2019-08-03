<?php
require_once 'data.php';
$id = fromGet('id');

$data = getParticipanteFromId($id);
$oficinas = getOficinaFromParticipanteId($id);
if (!isset($data) || !$data) {
    echo "<h1 class='text-center'> Informação não encontrada...</h1>";
} else {
    ?>
    <div class="mb-4">

        <div>
            <div class="col-10 col-md-3 col-lg-3 ml-auto mr-auto">
                <img src="images/avatar/<?= $data['foto'] ?>" style="width:100%" />
            </div>
            <h4 class="text-center m-0 mt-2"><?= $data['nome'] ?></h4>
            <p class="text-center  m-0 mb-2"><?= $data['area_atuacao'] ?> (<?= $data['empresa'] ?>)</p>
            <p class="text-center  m-0 mb-2"> <?= $data['graduacao'] ?>/<?= $data['ano_graduacao'] ?></p>

            <div class="border-top border-bottom p-4">
                <p class="text-justify">
                    <?= $data['resumo'] ?>
                </p>
            </div>
            <div class=" p-4 text-center">
                <h5>Atividades no Evento</h5>
                <div class="text-center">
                    <?php foreach ($oficinas as $item) { ?>
                        <a href="nav.php?page=oficina&id=<?= $item['id']?>">(<?= $item['tipo_oficina']?>) <?= $item['titulo'] ?></a><br/>
                    <?php } ?>
                    </div>
            </div>
        </div>
    </div>
<?php
}
?>