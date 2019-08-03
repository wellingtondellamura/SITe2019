<?php
  $data = fromSession('data');
  $messages = fromSession('messages');
  $confirma = fromSession('confirma');
  $cpf = isset($data['cpf'])?$data['cpf']:'';
  $nome = isset($data['nome'])?$data['nome']:'';
  $apelido = isset($data['apelido'])?$data['apelido']:'';
  $email = isset($data['email'])?$data['email']:'';
  $dataNascimento = isset($data['dataNascimento'])?:'';
  $telefone = isset($data['telefone'])?$data['telefone']:'';
  $cep = isset($data['cep'])?$data['cep']:'';
  $endereco = isset($data['endereco'])?$data['endereco']:'';
  $bairro = isset($data['bairro'])?$data['bairro']:'';
  $complemento = isset($data['complemento'])?$data['complemento']:'';
  $cidade = isset($data['cidade'])?$data['cidade']:'';
  $estado = isset($data['estado'])?$data['estado']:'';
  $perfil = isset($data['perfil'])?$data['perfil']:'';
  $graduacao = isset($data['graduacao'])?$data['graduacao']:'';
  $instituicao = isset($data['instituicao'])?$data['instituicao']:'';
?>

<script>
  function getNickName(name){
      var n = name.split(' ')[0];
      if (n.length > 0)
          return n;
      return name;
  }

  function genNickName(){
    var nome = document.getElementById('txtNome');
    var apelido = document.getElementById('txtApelido');
    apelido.value = getNickName(nome.value);
  }
</script>
<section>
  <header>
    <h1>Realizar Inscrição</h1>
  </header>
  <main>
    <div class="spacer-50"></div>
    <div class="container">
      <div class="row">
      <form action="app/logic/inscricao/adicionar.php" method="post">
        <h4>Dados Pessoais</h4>
        <div class="form-row">
          <div class="form-group col-12 col-md-4">
              <input type="text" class="form-control" name="cpf" placeholder="CPF" required="true" value="<?=$cpf?>">
              <small id="cpfHelp" class="form-text text-muted">Informe seu CPF no formato 123.456.789-10.</small>
          </div>
        </div>
        <div class="form-row">
          <div class="form-group col-12 col-md-8">
            <input type="text" class="form-control" id="txtNome" name="nome" placeholder="Nome completo" required="true" value="<?=$nome?>" onblur="genNickName()">
            <small id="nomeHelp" class="form-text text-muted">Informe seu nome completo sem abreviações.</small>
          </div>
          <div class="form-group col-12 col-md-4">
            <input type="text" class="form-control" id="txtApelido"  name="apelido" placeholder="Apelido" required="true" value="<?=$apelido?>">
            <small id="apelidoHelp" class="form-text text-muted">Como gostaria de ser chamado no evento? (nome no crachá).</small>
          </div>
        </div>

        <h4>Contato</h4>

        <div class="form-row">
            <div class="form-group col-12 col-md-12 col-lg-4">
              <input type="email" class="form-control" name="email" placeholder="E-mail" required="true" value="<?=$email?>">
              <small id="emailHelp" class="form-text text-muted">Informe seu e-mail principal para facilitar nosso contato e receber atualizações.</small>
            </div>

            <div class="form-group col-12 col-md-6 col-lg-4">
              <input type="date" class="form-control" name="dataNascimento" placeholder="Data de Nascimento" required="true" value="<?=$dataNascimento?>">
              <small id="dataNascimentoHelp" class="form-text text-muted">Informe sua data de nascimento no formato dd/mm/aaaa</small>
            </div>

            <div class="form-group col-12 col-md-6 col-lg-4">
              <input type="phone" class="form-control" name="telefone" placeholder="Telefone" required="true" value="<?=$telefone?>">
              <small id="telefoneHelp" class="form-text text-muted">Informe seu telefone de contato com o DDD. De preferência para o celular caso use Whatsapp.</small>
            </div>
        </div>  
          
        <h4>Endereço</h4>
          
        <div class="form-row">    
          <div class="form-group col-12 col-md-4">
              <input type="text" class="form-control" name="cep" placeholder="CEP" value="<?=$cep?>">
              <small id="cepHelp" class="form-text text-muted">Informe seu CEP.</small>
          </div>
        </div>
        <div class="form-row">
            <div class="form-group col-12 col-md-12">
              <input type="text" class="form-control" name="endereco" placeholder="Seu endereço (Rua, Avenida, etc), número" required="true" value="<?=$endereco?>">
            </div>

            <div class="form-group col-12 col-md-6">
              <input type="text" class="form-control" name="bairro" placeholder="Bairro" required="true" value="<?=$bairro?>">
            </div>
            
            <div class="form-group col-12 col-md-6">
              <input type="text" class="form-control" name="complemento" placeholder="Complemento" value="<?=$complemento?>">
            </div>

            <div class="form-group col-12 col-md-8">
              <input type="text" class="form-control" name="cidade" placeholder="Cidade" required="true" value="<?=$cidade?>">
            </div>

            <div class="form-group col-12 col-md-4">
            <select  class="form-control" name="estado" required="true"value="<?=$estado?>">
                  <option value="" disabled="true">--</option>
                  <option value="">Selecione</option>
                  <option value="AC">Acre</option>
                  <option value="AL">Alagoas</option>
                  <option value="AP">Amapá</option>
                  <option value="AM">Amazonas</option>
                  <option value="BA">Bahia</option>
                  <option value="CE">Ceará</option>
                  <option value="DF">Distrito Federal</option>
                  <option value="ES">Espirito Santo</option>
                  <option value="GO">Goiás</option>
                  <option value="MA">Maranhão</option>
                  <option value="MS">Mato Grosso do Sul</option>
                  <option value="MT">Mato Grosso</option>
                  <option value="MG">Minas Gerais</option>
                  <option value="PA">Pará</option>
                  <option value="PB">Paraíba</option>
                  <option value="PR">Paraná</option>
                  <option value="PE">Pernambuco</option>
                  <option value="PI">Piauí</option>
                  <option value="RJ">Rio de Janeiro</option>
                  <option value="RN">Rio Grande do Norte</option>
                  <option value="RS">Rio Grande do Sul</option>
                  <option value="RO">Rondônia</option>
                  <option value="RR">Roraima</option>
                  <option value="SC">Santa Catarina</option>
                  <option value="SP">São Paulo</option>
                  <option value="SE">Sergipe</option>
                  <option value="TO">Tocantins</option>
                  <option value="ZZ">Fora do Brasil</option>
              </select>
            </div>
        </div>  

        <h4>Perfil</h4>
        <div class="form-row">
              <div class="form-group col-12 col-sm-6">
              <label for="perfil">Eu sou</label>
              <select class="form-control" name="perfil" required="true"  value="<?=$perfil?>">
                  <option value="" disabled="true">Selecione uma opção</option>
                  <option>Estudante de Graduação</option>
                  <option>Estudante de Pós Graduação</option>
                  <option>Professor/Pesquisador</option>
                  <option>Profissional</option>
              </select>
            </div>

            <div class="form-group col-12 col-sm-6">
              <label for="graduacao">Graduando em/Graduado em</label>
              <select class="form-control" name="graduacao" required="true" value="<?=$graduacao?>">
                  <option value="" disabled="true">Selecione uma opção</option>
                  <option>Engenharia da Computação</option>
                  <option>Ciência da Computação</option>
                  <option>Sistemas de Informação</option>
                  <option>Tecnologia (Desenvolvimento/Segurança/Redes)</option>
                  <option>Outra área tecnológica correlata</option>
                  <option>Outra área </option>
              </select>
            </div>
            <div class="form-group col-12">
              <input type="instituicao" class="form-control" name="instituicao" placeholder="Instituição/Empresa" required="true" value="<?=$instituicao?>">
              <small id="instituicaoHelp" class="form-text text-muted">Informe a instituição de ensino (professor/estudante) ou a empresa (profissional).</small>
            </div>
          </div>
    
         <h4>Minicursos</h4>
        <div class="form-row">
          <?php minicursosRenderListSelect(); ?>
        </div>

          <div class="form-group form-check form-row custom-control custom-checkbox mb-3">
            <input type="checkbox" class="custom-control-input" id="checkConfirma" name="checkConfirma">
            <label class="custom-control-label h6 text-secondary" for="checkConfirma">Eu li e concordo com as <a href="nav.php?page=regras" target="_blank">regras do evento</a> e que a taxa de inscrição não será reembolsada em caso da minha desistência.</label>
          </div>


          <div class="spacer-50"></div>


          <div class="text-center">
            <button type="submit" class="btn btn-primary btn-lg">Confirmar Inscrição</button>
          </div>
      
          <?=$messages?>

      </form>
      </div>
      <div class="spacer-50"></div>
    </div>
  </main>
</section>


<script>



  function prepareForm(){
  //   $('#dataNascimento').datepicker({
  //     language: 'pt-BR',
  //     autoclose: true,
  //     todayHighlight: true
  // });
  }
</script>

<?php if (strlen($messages) > 0){ ?>

  <div class="modal fade" id="errorModal" tabindex="-1" role="dialog" aria-labelledby="errorModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document" >
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="errorModalLabel">Foram encontrados os erros a seguir</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <?=$messages?>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
      </div>
    </div>
  </div>
</div>

<script>$('#errorModal').modal('show');</script>
<?php } ?>