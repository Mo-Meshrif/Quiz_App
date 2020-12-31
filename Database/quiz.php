<?php
include "connect.php" ;
$questionsCatogory =$_POST['catogory'];
$questionLevel =$_POST['level']; 
$sql  = "SELECT * FROM questions INNER JOIN answers ON questions.id= answers.question_answer WHERE questionLevel='$questionLevel' AND questionsCatogory='$questionsCatogory' " ;  
$stmt = $con->prepare($sql);
$stmt->execute() ; 
$questions = $stmt->fetchAll(PDO::FETCH_ASSOC) ; 
echo json_encode($questions) ; 
?>
