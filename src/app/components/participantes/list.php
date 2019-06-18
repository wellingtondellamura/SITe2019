<?php
  require_once 'data.php';
  $lst = getParticipantes();
  shuffle($lst);
  $count = count($lst);
  foreach ($lst as $item) {
  ?>
    <div class="col-md-3 testimonial text-center">
        <a  href="nav.php?page=participante&id=<?=$item['id']?>"   class="mb-1 h4">
          <div class="avatar rounded-circle with-shadows mb-3 ml-auto mr-auto">
              <img src="images/avatar/<?=$item['foto']?>" class="w-100" alt="Testimonial Avatar" />
          </div>
        <?=$item['nome']?></a>
        <span class="text-muted">
          <?=$item['graduacao']?>/<?=$item['ano_graduacao']?>
          <br/>
          <?=$item['area_atuacao']?> (<?=$item['empresa']?>)
        </span>
        
        <a href="nav.php?page=oficina&id=<?=$item['oficina_id']?>" class="h5 text-primary"><?=$item['oficina']?></a>
    </div>
<?php } ?>
