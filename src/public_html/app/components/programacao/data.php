<?php

function getProgramacao(){
  $sql = "select * from programacao";
  return fromDatabase($sql);
}