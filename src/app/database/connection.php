<?php
function getConnection(){
  //***** Database configuration *************************************************
  $dbvendor = 'mysql';
  $username = 'root';
  $password = '';
  $database = 'site_2019';
  $host = 'localhost';
  //******************************************************************************
  $connection = new PDO("$dbvendor:host=$host;dbname=$database;charset=utf8",  $username, $password);
  return $connection;
}


function fromDatabase($sql){
  $array = array();
  foreach (getConnection()->query($sql) as $row) {
    $array[] = $row;
  }
  return $array;
}


function oneFromDatabase($sql){
  $stmt = getConnection()->prepare($sql);
  $stmt->execute(); 
  return $stmt->fetch();
}