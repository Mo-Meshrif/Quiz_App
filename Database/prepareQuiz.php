<?php
include "connect.php" ;
$questionsCatogory =$_POST['catogory'];
$sql  = "SELECT * FROM questions  WHERE questionsCatogory='$questionsCatogory' " ;  
$stmt = $con->prepare($sql);
$stmt->execute() ; 
$questions = $stmt->fetchAll(PDO::FETCH_ASSOC) ; 
echo json_encode($questions) ; 
?>
