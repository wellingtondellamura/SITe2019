<?php
function dd($dump) {
	var_dump($dump);
	die();
}

function request() {
	$request = $_SERVER['REQUEST_METHOD'];
   if ($request == 'POST') {
		return $_POST;
	}
	return $_GET;
}

function sanitize_unsafe($value) {
   $search = array("\\",  "\x00", "\n",  "\r",  "'",  '"', "\x1a");
   $replace = array("\\\\","\\0","\\n", "\\r", "\'", '\"', "\\Z");
   return str_replace($search, $replace, $value);
}

function fromPost($var){
    if (isset($_POST[$var]))
      return sanitize_unsafe($_POST[$var]);
}

function fromGet($var){
   if (isset($_GET[$var]))
      return sanitize_unsafe($_GET[$var]);
}

function isValid($var) {
   return !empty(trim($var));
}

function getHtml($tag, $value="", $attr=""){
    return "<$tag $attr>$value</$tag>";
}

function toSession($key, $value){
   session_start();
   $_SESSION[$key] = $value;
 }

 function getUser(){
   session_start();
   if (!isset($_SESSION) ||!isset($_SESSION["autenticado"])){
     return null;
   }
   return $_SESSION["autenticado"];
 }

 function fromSession($param){
  $value = "";
  if (!isset($_SESSION))
    session_start();
  if (isset($_SESSION[$param])){
    $value = $_SESSION[$param];
    unset($_SESSION[$param]);
  }
  return $value;
}


function fromSessionPersistent($param){
  $value = "";
  if (!isset($_SESSION))
    session_start();
  if (isset($_SESSION[$param])){
    $value = $_SESSION[$param];
  }
  return $value;
}


function addEllipsis($text, $size){
   
   if (strlen($text) > $size+3){
      $text = substr($text, 0, $size-3)."...";
   }
   return $text;
}
