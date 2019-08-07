<?php
  require_once 'app/components/oficinas/data.php';
  require_once 'app/boleto-util.php';

  $subscription = fromSessionPersistent('subscription');
  $messages = fromSession('messages');
  $minicursos = fromSessionPersistent('minicursos');
  $cpf = isset($subscription['cpf'])?$subscription['cpf']:'';
  $nome = isset($subscription['nome'])?$subscription['nome']:'';
  $email = isset($subscription['email'])?$subscription['email']:'';
  $perfil = isset($subscription['perfil'])?$subscription['perfil']:'';
  $graduacao = isset($subscription['graduacao'])?$subscription['graduacao']:'';
  $instituicao = isset($subscription['instituicao'])?$subscription['instituicao']:'';
  $valor = $data['subscription'];
  $count = sizeof($minicursos);
  if ($count) {
   $valor += ($count-$data['bonus-workshop']) * $data['workshop']; 
  }  
  $sit_badge = ($subscription['pago']?'badge-success':($subscription['isento']?'badge-info':'badge-danger'));
  $situacao = ($subscription['pago']?'Pago':($subscription['isento']?'Isento':'Aguardando pagamento'));
  //(segundaVia ? "21" : "2")

  $actual_link = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://{$_SERVER['HTTP_HOST']}{$_SERVER['REQUEST_URI']}";

  $boleto['idConv'] = "318420";
  $boleto['refTran'] = getTitulo(3118067, 25191, $subscription['id']);
  $boleto['dtVenc'] = "19082019";
  $boleto['tpPagamento'] = "21";
  $boleto['cpfCnpj'] = sanitize_text($subscription['cpf']);
  $boleto['indicadorPessoa'] = "1";//ok
  $boleto['valor'] = $valor*100;//ok
  $boleto['tpDuplicata'] = "DS";//ok
  $boleto['formato'] = "3";//ok
  $boleto['nome'] = sanitize_text($subscription['nome']);
  $boleto['endereco'] = sanitize_text($subscription['endereco']).' . '.sanitize_text($subscription['bairro']).' . '.sanitize_text($subscription['complemento']);
  $boleto['cidade'] = sanitize_text($subscription['cidade']);
  $boleto['uf'] = sanitize_text($subscription['estado']);
  $boleto['cep'] = sanitize_text($subscription['cep']);  
  $boleto['urlRetorno'] = $actual_link;
  $boleto['msgLoja'] = "SITe CCT/UENP - Mais informacoes em http://cct.uenp.edu.br/site. Em caso de duvidas entre em contato com  o Suporte do SITe: (43) 3542-8014 ou site.cct@uenp.edu.br.";//ok
?>
<section>
  <header>
    <h1>Sua inscrição foi realizada com sucesso!</h1>
  </header>
  <main>
    <div class="spacer-50"></div>
    <div class="h6 text-justify">
      <ul>
        <li>A taxa de inscrição deve ser recolhida por meio de boleto bancário. O valor da inscrição é <strong>R$ <?=$data['subscription']?>,00</strong> com direito a <strong><?=$data['bonus-workshop']?> minicurso</strong>.</li>
        <li>Aos interessados em participar em mais minicursos, o valor adicional de cada minicurso é <strong>R$ <?=$data['workshop']?>,00</strong>.</li>
        <li>O comprovante de pagamento deve ser enviado para <i class="text-primary">site.cct@uenp.edu.br</i> com o assunto <i class="text-primary">"SEU NOME - pagamento SITe"</i>.</li>  
      </ul>
    </div>

    <div class="alert alert-secondary text-center h6">
      Caso queria se inscrever em novos minicursos ou alterar sua inscrição, por favor solicite via e-mail para <i class="text-primary">site.cct@uenp.edu.br</i>.

    </div>

<div class="spacer-50"></div>
<div class="row">    
   <div class="alert alert-light col-12 col-sm-8">
    <h3>Dados da Inscrição</h3>
      <div  class="h6">
        <strong>Nome: </strong> <?=$nome?> <br/>
        <strong>CPF: </strong> <?=$cpf?> <br/>
        <strong>Perfil: </strong> <?=$perfil?>/<?=$graduacao?> <br/>
        <strong>Instituição: </strong> <?=$instituicao?> <br/>
        <strong>Situação: </strong> <span class='badge <?=$sit_badge?>'><?=$situacao?></span> <br/>
      </div>
   </div>
   <div class="col"></div>
   <div class="alert alert-light col-12 col-sm-3"> 
    <div class="text-center">
      <div >
        <h5>Valor a Pagar</h5>
        <h5 >R$ <?=$valor?>,00</h5>
      </div>
      <form method="post" action="https://mpag.bb.com.br/site/mpag/" target="_blank">
        <input type="hidden" name="idConv"  value="<?=$boleto['idConv']?>"/>
        <input type="hidden" name="refTran" value="<?=$boleto['refTran']?>"/>
        <input type="hidden" name="dtVenc"  value="<?=$boleto['dtVenc']?>"/>
        <input type="hidden" name="tpPagamento"  value="<?=$boleto['tpPagamento']?>"/>
        <input type="hidden" name="cpfCnpj" value="<?=$boleto['cpfCnpj']?>"/>
        <input type="hidden" name="indicadorPessoa" value="<?=$boleto['indicadorPessoa']?>"/>
        <input type="hidden" name="valor"  value="<?=$boleto['valor']?>"/>
        <input type="hidden" name="tpDuplicata"  value="<?=$boleto['tpDuplicata']?>"/>
        <input type="hidden" name="formato" value="<?=$boleto['formato']?>"/>
        <input type="hidden" name="nome"  value="<?=$boleto['nome']?>"/>
        <input type="hidden" name="endereco" value="<?=$boleto['endereco']?>"/>
        <input type="hidden" name="cidade" value="<?=$boleto['cidade']?>"/>
        <input type="hidden" name="uf"  value="<?=$boleto['uf']?>"/> 
        <input type="hidden" name="cep"  value="<?=$boleto['cep']?>"/>
        <input type="hidden" name="msgLoja"  value="<?=$boleto['msgLoja']?>"/>
        <input type="hidden" name="urlRetorno"  value="<?=$boleto['urlRetorno']?>"/>
        <button type="submit" class="btn btn-primary btn-block">Imprimir Boleto</button>
      </form>
      <br/>
      <button onclick="window.print();" class="btn btn-secondary  btn-block">Imprimir Ficha de Inscrição</button>
    </div>
    </div>
</div>
    <div class="spacer-15"></div>
    <h3>Minicursos Selecionados</h3>
    <hr/>
<?php
    foreach ($minicursos as $m) {      
      $curso = getOficinaFromId($m);
        if (!isset($curso)) {
          echo "Minicurso $m não encontrado...";
        } else {
          ?>
          <div class="col-md-12 col-lg-12">
            <div class="row align-items-center ">
              <div class="col-2">
              <a href="nav.php?page=oficina&id=<?= $curso['id'] ?>" target="_blank">
                <img src="images/common/<?= $curso['foto'] ?>" alt="<?= $curso['titulo'] ?>" style="width: 90px;">
              </a>
              </div>
              <div class="col-auto">
              <a href="nav.php?page=oficina&id=<?= $curso['id'] ?>" target="_blank"><h6 class="font-weight-light"><?= $curso['titulo'] ?></h6></a>
                <p>
                  <strong>Palestrante: </strong> <a href="nav.php?page=participante&id=<?= $curso['participante_id'] ?>"  target="_blank"><?= $curso['participante'] ?></a> / 
                  <strong>Área: </strong> <?= $curso['area_atuacao'] ?> (<?= $curso['empresa'] ?>)
                </p>

                </p>
                
              </div>
            </div>
          </div>
          
          <hr/>
        <?php  } ?>
    <?php  } ?>

    <div class="spacer-50"></div>
  </main>
</section>
