<?php
  $data = fromSession('data');
  $messages = fromSession('messages');
  $cpf = isset($data['cpf'])?$data['cpf']:'';
  $email = isset($data['email'])?$data['email']:'';
?>

<section>
  <header>
    <h1>Visualizar Inscrição</h1>
  </header>
  <main>
    <div class="spacer-50"></div>
    <div class="container">
      <div class="row">
        <div class="card" style=" margin: 0 auto;">
        <div class="card-body">
        <form action="app/logic/inscricao/visualizar.php" method="post">
        <h4>Por favor, informe os dados para prosseguir</h4>
        <div class="row align-items-center ">
          <div class="form-group col-12 col-md-6">
              <input type="text" class="form-control" name="cpf" placeholder="CPF" required="true" value="<?=$cpf?>">
              <small id="cpfHelp" class="form-text text-muted">Informe seu CPF no formato 123.456.789-10.</small>
          </div>
          <div class="form-group col-12 col-md-6 ">
              <input type="email" class="form-control" name="email" placeholder="E-mail" required="true" value="<?=$email?>">
              <small id="dataNascimentoHelp" class="form-text text-muted">Informe o e-mail cadastrado</small>
          </div>         
        </div>  
            <div class="spacer-50"></div>


          <div class="text-center">
            <button type="submit" class="btn btn-primary btn-lg">Visualizar Inscrição</button>
          </div>
      </form>

        </div>

        </div>
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