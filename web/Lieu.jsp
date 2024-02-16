<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<!-- Add these links in the head section of your HTML -->
<!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">-->
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/fontawesome.css" >

    <title>Lieu</title>
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
                <a href="#" class="list-group-item list-group-item-action " onclick="switchSection('employe')">Employé</a>
                <a href="#" class="list-group-item list-group-item-action active" >Lieu</a>
                <a href="#" class="list-group-item list-group-item-action" onclick="switchSection('affectation')">Affectation</a>
            </div>
        </div>
        <div class="col-md-10">
            <div class="content">
            <button  onclick="addForm()"  class="add-button"><i class="fa fa-plus" aria-hidden="true"></i> Ajouter</button>

                    <h2>Liste de lieu</h2>

            <table class="table table-bordered">
                        <tr>
                            <th>ID</th>
                            <th>Designation</th>
                            <th>Province</th>
                            <th>Action</th>

                        </tr>
                        <c:forEach var="lieu" items="${lieuArray}">
                      <tr id="lieuRow${lieu.codelieu}">
                                <td id="lieuId-${lieu.codelieu}">${lieu.codelieu}</td>
                                <td id="lieuDesignation-${lieu.codelieu}">${lieu.designation}</td>
                                <td id="lieuProvince-${lieu.codelieu}">${lieu.province}</td>
                                <td>
                                    <button  class="btn btn-warning" onclick="confirmEdit('${lieu.codelieu}')">Modifier</button>
<!--                                    &nbsp;&nbsp;&nbsp;&nbsp;-->
                                    <button  class="btn btn-danger" onclick="confirmDelete('${lieu.codelieu}')">Supprimer</button>

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
                                    <h3 class="modal-title" id="scrollmodalLabel">Ajouter un lieu</h3>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                    </button>
                            </div>
                            <div class="modal-body">
        <div class="card-body card-block">
            <form method="post" id="ajout_lieu_form">
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-bookmark"></i>
                        </div>
                        <input type="text" name="codelieu" placeholder="Code lieu..." class="form-control" id="codelieu-add" required >
<!--                        <input type="text" name="codeemp_hita" placeholder="Numéro employé..." class="form-control" id="numemployer_hita" required  >-->
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-user"></i>
                        </div>
                        <input type="text" name="designation" placeholder="Designation..." class="form-control" id="designation-add" required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-user"></i>
                        </div>
                        <input type="text" name="province" placeholder="Province..." class="form-control" id="province-add" required>
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
                    <h3 class="modal-title" id="scrollmodalLabel">Modifier un lieu</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                    </button>
            </div>
            <div class="modal-body">
               <div class="card-body card-block">
                   <form method="post" id="modifier_lieu_form">
                       <div class="form-group">
                           <div class="input-group">
                               <div class="input-group-addon">
                                   <i class="fa fa-bookmark"></i>
                               </div>
                               <input type="text" name="id-modif" placeholder="Numéro lieu" class="form-control" id="id-modif" required disabled>
                               <input type="text" name="id-modif" placeholder="Numéro lieu" class="form-control" id="numlieu_cache" style="display:none">
                           </div>
                       </div>
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-user"></i>
                                </div>
                                <input type="text" name="designation" placeholder="Designation..." class="form-control" id="designation-modif" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-user"></i>
                                </div>
                                <input type="text" name="province" placeholder="Province..." class="form-control" id="province-modif" required>
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
<script src="./js/sweetalerts.js"></script>


<!-- JavaScript at the end of your body section -->

<!-- JavaScript at the end of your body section -->
<script>
       function switchSection(section) {
        // You can implement section switching logic here
            // Récupérer l'URL actuelle
var currentURL = window.location.href;
var newURL = currentURL;
// Remplacer la partie "Lieu" par "Employe"
if(section === "employe"){
     newURL = currentURL.replace("Lieu", "Employe");
}

else if(section === "affectation"){
     newURL = currentURL.replace("Lieu", "Affecter");

}

// Naviguer vers la nouvelle URL
window.location.href = newURL;
        console.log(section);
    }
    

     function addForm() {
    $('#addModal').modal('show');
          $('#btn_ajouter').off('click').on('click', function() {
                console.log("2: " + $("#ajout_lieu_form").serialize());
                    var id = $('#codelieu-add').val();
                    var designation = $('#designation-add').val();
                    var province = $('#province-add').val();

                    if(!id | !designation | !province){
                        swal("Formulaire incomplete!", "Completer tous les champs!", "warning");                        
                    }
                    else if(document.getElementById("lieuRow"+id)){
                      swal("Lieu existant!", "Ce lieu existe deja!", "warning");                                            
                    }
                    else{
          // Perform AJAX request to delete the person
                        $.ajax({
                          type: 'POST',
                  //        url: '/personneList/delete?id=' + personId,
                          url: '${pageContext.request.contextPath}/Lieu/add',
                          data : $("#ajout_lieu_form").serialize(),
                  //        data: { id: personId },
                          success: function(response) {

                              var newRow = '<tr id="lieuRow' + id + '">' +
                                  '<td id="lieuId-' + id + '">' + id+ '</td>' +
                                  '<td id="lieuDesignation-' + id + '">' + designation+ '</td>' +
                                  '<td id="lieuProvince-' + id + '">' + province + '</td>' +
                                  '<td>' +
                                  '<a href="#" onclick="confirmEdit(\'' + id + '\')">Modifier</a>' +
                                  '&nbsp;&nbsp;&nbsp;&nbsp;' +
                                  '<a href="#" onclick="confirmDelete(' + id + ')">Supprimer</a>' +
                                  '</td>' +
                                  '</tr>';
              //                $('table').prepend(newRow);
                              $('table tr:first').after(newRow);
                              $('#addModal').modal('hide');
                                swal("Ajout reussi!", "L'ajout du lieu est bien reussie!", "success");

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
    $('#numlieu_cache').val(personId);
    $('#designation-modif').val($('#lieuDesignation-' + personId).text());
    $('#province-modif').val($('#lieuProvince-' + personId).text());


//    // Set person ID in the modal's delete button
    $('#btn_valider').off('click').on('click', function() {
            console.log("2");

      // Perform AJAX request to delete the person
      $.ajax({
        type: 'POST',
            url: '${pageContext.request.contextPath}/Lieu/update',
            data : $("#modifier_lieu_form").serialize(),
//        data: { id: personId },
        success: function(response) {
                console.log("3");

          // Handle success, e.g., refresh the page
//          location.reload();
          $('#lieuId-' + personId).text( $('#id-modif').val());
          $('#lieuDesignation-' + personId).text( $('#designation-modif').val());
          $('#lieuProvince-' + personId).text( $('#province-modif').val());

        },
        error: function(error) {
          // Handle error
          console.error('Error editing lieu', error);
        }
      });

      // Hide the modal after the request is sent
      $('#editModal').modal('hide');
    });
  }   
 
    
    
    
  function confirmDelete(personId) {
    // Show Bootstrap modal

    $('#deleteModal').modal('show');
    

    // Set person ID in the modal's delete button
    $('#deleteModalBtn').off('click').on('click', function() {
            console.log("2");

      // Perform AJAX request to delete the person
      $.ajax({
        type: 'GET',
//        url: '/personneList/delete?id=' + personId,
        url: '${pageContext.request.contextPath}/Lieu/delete?id=' + personId,

//        data: { id: personId },
        success: function(response) {
                console.log("3");

          // Handle success, e.g., refresh the page
//          location.reload();
          $('#lieuRow' + personId).remove();

        },
        error: function(error) {
          // Handle error
          console.error('Error deleting lieu', error);
        }
      });

      // Hide the modal after the request is sent
      $('#deleteModal').modal('hide');
    });
  }
</script>

</body>
</html>
