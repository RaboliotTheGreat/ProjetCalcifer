<?php
require_once("./DAO.class.php");
$result = array() ;               //Création du tableau à envoyer
$result["status"] = "success";    //Initialisation du premier élément avec "sucess"
$data = $_POST["data"];
if(isset($data)){
  $requete = "SELECT titre,auteur,resume,image FROM livre L WHERE ISBN=\"$data\"" ;

  $livreBD = $db->query($requete); //Récupération des informations
  if ($livres) {
    $result["livre"] = array();
    $result["livre"]["titre"] = $livreBD["TITRE"];
    $result["livre"]["auteur"] = $livreBD["AUTEUR"];
    $result["livre"]["resume"] = $livreBD["RESUME"];
    $result["livre"]["image"] = $livreBD["IMAGE"];
  }
}
echo json_encode($result); //Encodage puis envoie.
?>
