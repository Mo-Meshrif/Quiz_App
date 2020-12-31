<?php
include "connect.php" ;
$sql  = "SELECT correctAnswer FROM answers " ;  
$stmt = $con->prepare($sql);
$stmt->execute() ; 
$questions = $stmt->fetchAll(PDO::FETCH_ASSOC) ; 
echo json_encode($questions) ; 
?>
