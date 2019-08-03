<?php
use PDO;
class Database {

  private $configuration;

  function __construct($configuration) {
    $this->configuration = $configuration;
  }

  private function connect() {
    $cfg = $this->configuration;
  	$pdo = new \PDO("mysql:host=$cfg->host;dbname=$cfg->database;charset=utf8", $cfg->user, $cfg->password);
  	$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  	$pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);
  	return $pdo;
  }

  public function create($table, $fields) {
    if (!is_array($fields)) {
  		$fields = (array) $fields;
  	}
  	$sql = "insert into {$table}";
  	$sql .= "(" . implode(',', array_keys($fields)) . ")";
  	$sql .= " values(" . ":" . implode(',:', array_keys($fields)) . ")";
  	$pdo = $this->connect();
  	$insert = $pdo->prepare($sql);
  	return $insert->execute($fields);
  }

  public function all($table) {
  	$pdo = $this->connect();
  	$sql = "select * from {$table}";
  	$list = $pdo->query($sql);
  	$list->execute();
	  return $list->fetchAll();
  }

  public function update($table, $fields, $where) {
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
  	$pdo = $this->connect();
  	$update = $pdo->prepare($sql);
  	$update->execute($data);
  	return $update->rowCount();
  }

  public function find($table, $field, $value) {
  	$pdo = $this->connect();
  	$value = filter_var($value, FILTER_SANITIZE_NUMBER_INT);
  	$sql = "select * from {$table} where {$field} = :{$field}";
  	$find = $pdo->prepare($sql);
  	$find->bindValue($field, $value);
  	$find->execute();
  	return $find->fetchAll();
  }

  public function delete($table, $field, $value) {
  	$pdo = $this->connect();
  	$sql = "delete from {$table} where {$field} = :{$field}";
  	$delete = $pdo->prepare($sql);
  	$delete->bindValue($field, $value);
  	return $delete->execute();
  }
}
