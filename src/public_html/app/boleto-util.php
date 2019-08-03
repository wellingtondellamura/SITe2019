<?php
    function getTitulo($convenio, $prefixo, $numero) {
        $diff = 17 - (strlen($convenio) + strlen($prefixo) + strlen($numero));
        if ($diff < 0) {
            die("Parâmetros inválidos para gerar o número de título.");
            return null;
        }
        $pad = "";
        for ($i = 0; $i < $diff; $i++) {
            $pad .= "0";
        }
        return $convenio . $prefixo . $pad . $numero;
    }

    function sanitize_text($text) {
        $text = str_replace(".", "",$text);
        $text = str_replace("-", "",$text);
        $text = preg_replace(array("/(á|à|ã|â|ä)/","/(Á|À|Ã|Â|Ä)/","/(é|è|ê|ë)/","/(É|È|Ê|Ë)/","/(í|ì|î|ï)/","/(Í|Ì|Î|Ï)/","/(ó|ò|õ|ô|ö)/","/(Ó|Ò|Õ|Ô|Ö)/","/(ú|ù|û|ü)/","/(Ú|Ù|Û|Ü)/","/(ñ)/","/(Ñ)/","/(ç)/","/(Ç)/"),explode(" ","a A e E i I o O u U n N c C"),$text);
        return strtoupper($text);
    }


    function registrar_titulo($nosso_numero, $data_vencimento, $valor, $inscricao_id){
        $boleto['nosso_numero'] = $nosso_numero;
        $boleto['data_vencimento'] = $data_vencimento;
        $boleto['valor'] = $valor;
        $boleto['inscricao_id'] = $inscricao_id;
        return database_create("titulo", $boleto);
    }