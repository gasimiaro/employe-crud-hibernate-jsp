<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<!-- Add these links in the head section of your HTML -->
<!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">-->
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/fontawesome.css" >

    <title>Employe</title>
    <style>
        *{
            margin: 0;
            padding: 0;
            font-size: 20px;
            
        }        
        .nav h2{
            text-align: center;
            background-color: #b3b7bb;
            padding: 20px;
            width: 100vw;
        }
        #searchInput{
            border-radius: 15px;
            border: none;
            box-shadow: 1px 2px 5px #444;
            padding: 5px;
        }
        .list-group{
            text-align: center;
        }
        .active{
            background-color: #b3b7bb !important;
            border: none;
        }
        table{
            width: max-content !important;
        }        
        .add-button {
            background-color: #11b971;
            padding: 5px;
            padding: 7px 12px;
            border-radius: 6px;
            color: #fff;
            border: none;
            font-weight: 500;
        }
        .search-container{
            display: inline-block;
            margin-left: 200px;
        }
    </style>

</head>
<body>
<div class="nav">
    <h2>G E S T I O N  D ' A F F E C T A T I O N</h2>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2 bg-light sidebar">
            <div class="list-group">
                <a href="#" class="list-group-item list-group-item-action active" >Employé</a>
                <a href="#" class="list-group-item list-group-item-action" onclick="switchSection('lieu')">Lieu</a>
                <a href="#" class="list-group-item list-group-item-action" onclick="switchSection('affectation')">Affectation</a>
            </div>
        </div>
        <div class="col-md-10">
            <div class="content">
                <h2>Liste des Employés</h2> <br>
                <button  onclick="addForm()"  class="add-button"><i class="fa fa-plus" aria-hidden="true"></i> Ajouter</button> 
                <div class="search-container" >
                <input type="text" id="searchInput" onchange="searchTable()" placeholder="Rechercher ...">
                <button><i class="fa fa-search" aria-hidden="true"></i>Chercher</button>                     
                </div>
<br><br>

<table id="tableau" class="table table-bordered">
                    <tr>
                        <th>ID</th>
                        <th>Nom</th>
                        <th>Prenom</th>
                        <th>Poste</th>
                        <th>Action</th>
                    </tr>
                    <c:forEach var="employe" items="${employeArray}">
                        <tr id="personneRow${employe.codeemp}">
                            <td id="personneId-${employe.codeemp}">${employe.codeemp}</td>
                            <td id="personneName-${employe.codeemp}">${employe.nom}</td>
                            <td id="personneFirstName-${employe.codeemp}">${employe.prenom}</td>
                            <td id="personneEmail-${employe.codeemp}">${employe.poste}</td>
                            <td>
                                <button  class="btn btn-warning" onclick="confirmEdit('${employe.codeemp}')">Modifier</button>
<!--                                &nbsp;&nbsp;&nbsp;&nbsp;-->
                                <button  class="btn btn-danger" onclick="confirmDelete('${employe.codeemp}')">Supprimer</button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Add this modal at the end of your body section -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteModalLabel">Supression</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Etes-vous sûr de vouloir supprimer?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
        <a id="deleteModalBtn" class="btn btn-danger">Delete</a>
      </div>
    </div>
  </div>
</div>

<!-- Fenetre Modale ajout -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="scrollmodalLabel" aria-hidden="true" >
            <div class="modal-dialog modal-ms" role="document">
                    <div class="modal-content">
                            <div class="modal-header">
                                    <h3 class="modal-title" id="scrollmodalLabel">Ajouter un employé</h3>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                    </button>
                            </div>
                            <div class="modal-body">
        <div class="card-body card-block">
            <form method="post" id="ajout_employe_form">
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-bookmark"></i>
                        </div>
                        <input type="text" name="codeemp" placeholder="Numéro employé..." class="form-control" id="codeemp-add" required >
<!--                        <input type="text" name="codeemp_hita" placeholder="Numéro employé..." class="form-control" id="numemployer_hita" required  >-->
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-user"></i>
                        </div>
                        <input type="text" name="nom" placeholder="Nom..." class="form-control" id="nom-add" required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-user"></i>
                        </div>
                        <input type="text" name="prenom" placeholder="Prénom..." class="form-control" id="prenom-add" required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-user"></i>
                        </div>
                        <input type="text" name="poste" placeholder="Poste..." class="form-control" id="poste-add" required>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Annuler</button>
                    <button type="button" class="btn btn-success" id="btn_ajouter">Ajouter</button>
                </div>
            </form>
        </div>
                            </div>	
                    </div>
            </div>
</div>


<!-- Fenêtre Modale modification-->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="scrollmodalLabel" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-ms" role="document">
        <div class="modal-content">
            <div class="modal-header">
                    <h3 class="modal-title" id="scrollmodalLabel">Modifier un employé</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                    </button>
            </div>
            <div class="modal-body">
               <div class="card-body card-block">
                   <form method="post" id="modifier_employer_form">
                       <div class="form-group">
                           <div class="input-group">
                               <div class="input-group-addon">
                                   <i class="fa fa-bookmark"></i>
                               </div>
                               <input type="text" name="id-modif" placeholder="Numéro employé" class="form-control" id="id-modif" required disabled>
                               <input type="text" name="id-modif" placeholder="Numéro employé" class="form-control" id="numemployer_cache" style="display:none">
                           </div>
                       </div>
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-user"></i>
                                </div>
                                <input type="text" name="nom" placeholder="Nom..." class="form-control" id="nom-modif" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-user"></i>
                                </div>
                                <input type="text" name="prenom" placeholder="Prénom..." class="form-control" id="prenom-modif" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-user"></i>
                                </div>
                                <input type="text" name="poste" placeholder="Poste..." class="form-control" id="poste-modif" required>
                            </div>
                        </div>
      
                       <div class="modal-footer">
                           <button type="button" class="btn btn-danger" data-dismiss="modal">Annuler</button>
                           <button type="button" class="btn btn-success" id="btn_valider" data-dismiss="modal">Valider</button>
                       </div>
                   </form>
               </div>
            </div>	
        </div>
    </div>
</div>

<!--<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>-->
<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>-->
<!--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>-->
<script src="./js/jquery.js"></script>
<script src="./js/popper.js"></script>
<script src="./js/bootstrap.js"></script>

<!-- JavaScript at the end of your body section -->
<script>
//  function confirmDelete(personId) {
//    // Show Bootstrap modal
//    $('#deleteModal').modal('show');
//
//    // Set person ID in the modal's delete button href
//    $('#deleteModalBtn').attr('href', 'delete?id=' + personId);
//  }
</script>
<script src="./js/sweetalerts.js"></script>

<!-- JavaScript at the end of your body section -->
<script>


    function switchSection(section) {
        // You can implement section switching logic here
            // Récupérer l'URL actuelle
var currentURL = window.location.href;

// Remplacer la partie "Lieu" par "Employe"
if(section === "employe"){
    var newURL = currentURL.replace("Employe", "Employe");
}
else if(section === "lieu"){
    var newURL = currentURL.replace("Employe", "Lieu");

}
else if(section === "affectation"){
    var newURL = currentURL.replace("Employe", "Affecter");

}

// Naviguer vers la nouvelle URL
window.location.href = newURL;
        console.log(section);
    }
    var     search = document.getElementById("searchInput");
        search.addEventListener('change',chercher);
        
        function chercher(){
            console.log("cherchero");
        }
    
function searchTable() {
    var input, filter, table, tr, td1, td2, i, txtValue1, txtValue2;
    input = document.getElementById("searchInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("tableau");
    tr = table.getElementsByTagName("tr");

    // Parcours de chaque ligne et masquage des lignes qui ne correspondent pas à la recherche
    for (i = 0; i < tr.length; i++) {
        td1 = tr[i].getElementsByTagName("td")[0]; // Première colonne du tableau
        td2 = tr[i].getElementsByTagName("td")[1]; // Deuxième colonne du tableau
        if (td1 && td2) {
            txtValue1 = td1.textContent || td1.innerText;
            txtValue2 = td2.textContent || td2.innerText;
            if (txtValue1.toUpperCase().indexOf(filter) > -1 || txtValue2.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = ""; // Affiche la ligne si elle correspond à la recherche
            } else {
                tr[i].style.display = "none"; // Masque la ligne sinon
            }
        }
    }
}


    
     function addForm() {
    $('#addModal').modal('show');
          $('#btn_ajouter').off('click').on('click', function() {
                console.log("2: " + $("#ajout_employe_form").serialize());
                    var id = $('#codeemp-add').val();
                    var nom = $('#nom-add').val();
                    var prenom = $('#prenom-add').val();
                    var poste = $('#poste-add').val();
                    if(!id | !nom | !prenom | !poste){
                        swal("Formulaire incomplete!", "Completer tous les champs!", "warning");                        
                    }
                    else if(document.getElementById("personneRow"+id)){
                      swal("Employé existant!", "Cette employé existe deja!", "warning");                                            
                    }
                    else{
                              // Perform AJAX request to delete the person
                            $.ajax({
                              type: 'POST',
                      //        url: '/personneList/delete?id=' + personId,
                              url: '${pageContext.request.contextPath}/Employe/add',
                              data : $("#ajout_employe_form").serialize(),
                      //        data: { id: personId },
                              success: function(response) {

                                  var newRow = '<tr id="personneRow' + id + '">' +
                                      '<td id="personneId-' + id + '">' + id+ '</td>' +
                                      '<td id="personneName-' + id + '">' + nom+ '</td>' +
                                      '<td id="personneFirstName-' + id + '">' + prenom + '</td>' +
                                      '<td id="personneEmail-' + id + '">' + poste + '</td>' +
                                      '<td>' +
                                      '<a href="#" onclick="confirmEdit(\'' + id + '\')">Modifier</a>' +
                                      '&nbsp;&nbsp;&nbsp;&nbsp;' +
                                      '<a href="#" onclick="confirmDelete(' + id + ')">Supprimer</a>' +
                                      '</td>' +
                                      '</tr>';
                  //                $('table').prepend(newRow);
                                  $('table tr:first').after(newRow);
                                  $('#addModal').modal('hide');
                                swal("Ajout reussi!", "L'ajout de l'employé est bien reussie!", "success");

                              },
                              error: function(error) {
                                // Handle error
                                console.error('Error Adding person:', error);
                              }
                            });

                    }

          // Hide the modal after the request is sent
        });
      }
    
   
    
   function confirmEdit(personId) {
    // Show Bootstrap modal
    $('#editModal').modal('show');
    console.log("1");
    $('#id-modif').val(personId);
    $('#numemployer_cache').val(personId);
    $('#nom-modif').val($('#personneName-' + personId).text());
    $('#prenom-modif').val($('#personneFirstName-' + personId).text());
    $('#poste-modif').val($('#personneEmail-' + personId).text());


//    // Set person ID in the modal's delete button
    $('#btn_valider').off('click').on('click', function() {
        var newName = document.getElementById("nom-modif").value;
        var newFName = document.getElementById("prenom-modif").value;
        var newPoste = document.getElementById("poste-modif").value;
            if(!newName | !newFName | !newPoste){
                swal("Formulaire incomplete!", "Completer tous les champs!", "warning");                                        
            }
            else{
                      // Perform AJAX request to delete the person
                    $.ajax({
                      type: 'POST',
                          url: '${pageContext.request.contextPath}/Employe/update',
                          data : $("#modifier_employer_form").serialize(),
              //        data: { id: personId },
                      success: function(response) {

                        $('#personneId-' + personId).text( $('#id-modif').val());
                        $('#personneName-' + personId).text( $('#nom-modif').val());
                        $('#personneFirstName-' + personId).text( $('#prenom-modif').val());
                        $('#personneEmail-' + personId).text( $('#poste-modif').val());
                        swal("Modification  reussi!", "La modification de l'employé est bien reussi!", "success");

                      },
                      error: function(error) {
                        // Handle error
                        console.error('Error editing person:', error);
                      }
                    });
            }


      // Hide the modal after the request is sent
      $('#editModal').modal('hide');
    });
  }   
 
    
    
    
  function confirmDelete(personId) {
    // Show Bootstrap modal
        console.log("personId : " + personId);

    $('#deleteModal').modal('show');
    

    // Set person ID in the modal's delete button
    $('#deleteModalBtn').off('click').on('click', function() {
            console.log("2");

      // Perform AJAX request to delete the person
      $.ajax({
        type: 'GET',
//        url: '/personneList/delete?id=' + personId,
        url: '${pageContext.request.contextPath}/Employe/delete?id=' + personId,

//        data: { id: personId },
        success: function(response) {
                console.log("3");

          // Handle success, e.g., refresh the page
//          location.reload();
          $('#personneRow' + personId).remove();
        swal("Suppression  reussi!", "La suppression de l'employé est bien reussie!", "success");          

        },
        error: function(error) {
          // Handle error
          console.error('Error deleting person:', error);
        }
      });

      // Hide the modal after the request is sent
      $('#deleteModal').modal('hide');
    });
  }
</script>

</body>
</html>
