function lancerRecherche(){
  var query = $("#srchFld").val();
  var data ='data=' + query;
  $("#content").empty();

  $.ajax({	type: "POST",
        url: "ajax/rechercheLivres.php",
        data: data, // On passe les informations saisies à l'écran
        success: function(data, textStatus, jqXHR) {
          console.log(JSON.parse(data));
          var result = JSON.parse(data) ;
          displayResultDB(result);
          displayResultContent(result);
        },
        error: function() {
          alert('Erreur dans la requete au serveur.');
        }
  });

}


function displayResultContent(data){
  var toPrint = '<h4> Autres livres existants </h4> <ul class="thumbnails">';
  if (data.livresdep.length == 0) {
    toPrint += "<p>Pas de livre correspondant à votre recherche</p>";
  }
  else {
    for (var i=0; i < data.livresdep.length; i++) {
      //structure
      toPrint += '<li class="span3">';
      toPrint += '<div class="thumbnail">';
      //?
      toPrint += "<a href=\"product.html?id="+data.livresdep[i].titre+"\">";
      // titre
      toPrint += "<h5>"+data.livresdep[i].titre+"</h5>";
      // auteur
      toPrint += "<p>"+data.livresdep[i].auteur+"</p>";
      // l'image
      toPrint += "<img src=\""+data.livresdep[i].image+"\" alt=\"\"/></a>";

      toPrint += '<div class="caption">';

      toPrint += '<h4 style="text-align:center"><a class="btn" href="product.html?id='+data.livresdep[i].titre+'">';
      toPrint += '<i class="icon-zoom-in"></i></a> <a class="btn" href="#">Ajouter <i class="icon-shopping-cart"></i></a>';
      if(data.livresdep[i].val != null){
        toPrint += '<a class="btn btn-primary" href="#">'+data.livresdep[i].val+'</a></h4>';
      } else {
        toPrint +='</h4>';
      }
    toPrint += "</div></div></li>";
    }
  }
  $("#content").append(toPrint);
}


function displayResultDB(data){

  var toPrint = '<h4> Livres disponibles </h4> <ul class="thumbnails">';
  if (data.livresdep.length == 0) {
    toPrint += "<p>Pas de livre disponible correspondant à votre recherche</p>";
  }
  else {
    for (var i=0; i < data.livres.length; i++) {
      //structure
      toPrint += '<li class="span3">';
      toPrint += '<div class="thumbnail">';
      //?
      toPrint += "<a href=\"product.html?id="+data.livres[i].titre+"\">";
      // titre
      toPrint += "<h5>"+data.livres[i].titre+"</h5>";
      // auteur
      toPrint += "<p>"+data.livres[i].auteur+"</p>";
      // l'image
      toPrint += "<img src=\""+data.livres[i].image+"\" alt=\"\"/></a>";

      toPrint += '<div class="caption">';

      toPrint += '<h4 style="text-align:center"><a class="btn" href="product.html?id='+data.livres[i].titre+'">';
      toPrint += '<i class="icon-zoom-in"></i></a> <a class="btn" href="#">Ajouter <i class="icon-shopping-cart"></i></a>';
      if(data.livres[i].val != null){
        toPrint += '<a class="btn btn-primary" href="#">'+data.livres[i].val+'</a></h4>';
      } else {
        toPrint +='</h4>';
      }
      toPrint += "</div></div></li>";
      }
    }
  $("#content").append(toPrint);
}




function wantMore(id){
  var data ='data=' + id;

  $.ajax({	type: "POST",
        url: "ajax/getMoreInfo.php",
        data: data, // On passe les informations saisies à l'écran
        success: function(data, textStatus, jqXHR) {
          var result = JSON.parse(data) ;
          console.log(result);
          displayResultLatPanel(result);
        },
        error: function() {
          alert('Erreur dans la requete au serveur.');
        }
  });
}

function displayResultLatPanel(data){
    $("#sidebar").empty();
    //toPrint += "<img src=\""+data.livres[i].url+"\" alt=\"\"/></a>";
    var toPrint = '<h4>Résultat détaillé</h4>';
    toPrint +='<div class="thumbnail">';
    toPrint += '<div class="caption">';
    toPrint += '<h5>'+data.livres[0].nom+'</h5>';
    toPrint += '<h4>'+data.livres[0].auteur+'</h4>';
    toPrint += '<p>'+data.livres[0].resume+'</p>';

    toPrint += '</div></div>';

    $("#sidebar").append(toPrint);


}