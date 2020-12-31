<?php
include "connect.php" ;
$sql  = "SELECT question,correctAnswer FROM questions INNER JOIN answers ON questions.id= answers.question_answer " ;  
$stmt = $con->prepare($sql);
$stmt->execute() ; 
$questions = $stmt->fetchAll(PDO::FETCH_ASSOC) ; 
echo json_encode($questions) ; 
?>
