<?php
function getConnection(){
  //***** Database configuration *************************************************
  $dbvendor = 'mysql';
  $username = 'root';
  $password = 'msdd#04_v3st1bul@r';
  $database = 'site_2019';
  $host = 'localhost';
  //******************************************************************************
  $connection = new PDO("$dbvendor:host=$host;dbname=$database;charset=utf8",  $username, $password);
  $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  // $connection->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);
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

function database_create($table, $fields) {
  if (!is_array($fields)) {
    $fields = (array) $fields;
  }
  $sql = "insert into {$table}";
  $sql .= "(" . implode(',', array_keys($fields)) . ")";
  $sql .= " values(" . ":" . implode(',:', array_keys($fields)) . ")";
  $pdo = getConnection();
  $insert = $pdo->prepare($sql);
  try {
    $insert->execute($fields);
    return  $pdo->lastInsertId();
  } catch (PDOException $e){
    dd($e);
  }
  return 0;
}

function all($table) {
  $pdo =  getConnection();
  $sql = "select * from {$table}";
  $list = $pdo->query($sql);
  $list->execute();
  return $list->fetchAll();
}

function update($table, $fields, $where) {
  if (!is_array($fields)) {
    $fields = (array) $fields;
  }
  $data = array_map(function ($field) {
    return "{$field} = :{$field}";
  }, array_keys($fields));
  $sql = "update {$table} set ";
  $sql .= implode(',', $data);
  $sql .= " where {$where[0]} = :{$where[0]}";
  $data = array_merge($fields, [$where[0] => $where[1]]);
  $pdo =  getConnection();
  $update = $pdo->prepare($sql);
  $update->execute($data);
  return $update->rowCount();
}

function database_find_first($table, $field, $value){
  $lst = database_find($table, $field, $value);
  if (sizeof($lst)> 0){
    return $lst[0];
  }
  return null;
}


function database_find($table, $field, $value) {
  $pdo =  getConnection();
  //$value = filter_var($value, FILTER_SANITIZE_NUMBER_INT);
  $sql = "select * from {$table} where {$field} = :{$field}";
  $find = $pdo->prepare($sql);
  $find->bindValue($field, $value);
  $find->execute();
  //dd($value);
  //dd($find);
  return $find->fetchAll();
}

function delete($table, $field, $value) {
  $pdo =  getConnection();
  $sql = "delete from {$table} where {$field} = :{$field}";
  $delete = $pdo->prepare($sql);
  $delete->bindValue($field, $value);
  return $delete->execute();
}