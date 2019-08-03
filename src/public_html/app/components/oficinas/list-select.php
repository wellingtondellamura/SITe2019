<?php
  require_once 'data.php';
  $minicursos = (null !== fromSession('minicursos'))?fromSession('minicursos'):[];
  $lst = getMiniCursos();
  //shuffle($lst);
  foreach ($lst as $item) {
    $vagas = $item['vagas'] - $item['inscricoes'];
  ?>
  <div class="col-md-12 col-lg-4">
    <div class="card mb-4" style="max-height: 500px; height: 500px;">
      
      <div class="card-body text-center">
      
      <p class="text-right ">
      <?php if ($vagas > 0) { ?>
          <span class="badge badge-danger"><?= $vagas?> vagas restantes</span>
          
      <?php }?>
        </p>
        <img src="images/common/<?=$item['foto']?>" alt="<?=$item['titulo']?>" style="height: 150px; width: 150px;" class="">
        <a href="nav.php?page=oficina&id=<?=$item['id']?>" class=""> <h6 class="card-title text-center"><?=$item['titulo']?></h6> </a>

        <div class="text-secondary h6">
          <?php
            $prog = getProgramacao($item['id']);
            foreach ($prog as $p) {
          ?>
          <strong><?=$p['descricao']?></strong>
          <?=date_format(date_create($p['data']),'d/m  H:i')?>
          <br/>
          
          <?php } ?>   
        </div>     
      </div>
      <div class="card-footer">
      <?php if ($vagas > 0) { ?>
        <div class="custom-control custom-toggle">
              <input type="checkbox" id="chk-<?=$item['id']?>" name="minicursos[]" class="custom-control-input" value="<?=$item['id']?>">
              <label class="custom-control-label" for="chk-<?=$item['id']?>">Desejo participar!</label>
          </div>
        </div>
      <?php } else { ?>
        <div class="text-center"><span class="badge badge-danger text-center"> Vagas Esgotadas </span></div>
      <?php } ?>
    </div>
  </div>
<?php } ?>
