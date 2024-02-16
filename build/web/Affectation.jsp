<%@page import="manager.LieuManager"%>
<%@page import="manager.EmployeManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Model.Lieu.Lieu"%>
<%@page import="java.util.List"%>
<%@page import="Model.Affecter.Affecter"%>
<%@page import="manager.AffecterManager"%>
<%@ page import="Model.Employe.Employe" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<!-- Add these links in the head section of your HTML -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/fontawesome.css" >



    <title>Affectation</title>
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
                <a href="#" class="list-group-item list-group-item-action " onclick="switchSection('employe')">Employé</a>
                <a href="#" class="list-group-item list-group-item-action" onclick="switchSection('lieu')">Lieu</a>
                <a href="#" class="list-group-item list-group-item-action active" >Affectation</a>
            </div>
        </div>
        <div class="col-md-10">
            <div class="content">
                <h2>Liste d' affectation</h2>
                                <button  onclick="addForm()"  class="add-button"><i class="fa fa-plus" aria-hidden="true"></i> Ajouter</button> 

                                <div class="search-container" >
                                <input type="text" id="searchInput" onchange="searchTable()" placeholder="Rechercher ...">
                                <button><i class="fa fa-search" aria-hidden="true"></i>Chercher</button>                     
                                </div>
                <br><br>
<%         Employe e = new Employe();
        Lieu l = new Lieu();

        AffecterManager am = new AffecterManager();
                EmployeManager em = new EmployeManager();
                LieuManager lm = new LieuManager();


//                List<Affecter> affList = (List<Affecter>)request.getAttribute("affecterArray");
                Affecter[] affList = (Affecter[])request.getAttribute("affecterArray");

%>
<table id="tableau" class="table table-bordered">
    <thead>
        <tr>
            <th>Employé</th>
            <th>Lieu</th>
            <th>Date</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <% for (Affecter aff : affList) { %>
            <% e = am.getEmpDetails(aff.getEmploye().getCodeemp()); %>
            <% l = am.getLieuDetails(aff.getLieu().getCodelieu()); %>
            <% SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy"); %>
            <% String formattedDate = dateFormat.format(aff.getDate()); %>
            <tr id="lieuRow-<%= e.getCodeemp() %>-<%= l.getCodelieu() %>">
                <td id="employeId-<%= e.getCodeemp() %>-<%= l.getCodelieu() %>">[ <%= e.getCodeemp() %> ] - <%= e.getNom() %> <%= e.getPrenom() %></td>
                <td id="lieuId-<%= e.getCodeemp() %>-<%= l.getCodelieu() %>"><%= l.getDesignation() %> <%= l.getProvince() %></td>
                <td id="affecterDate-<%= e.getCodeemp() %>-<%= l.getCodelieu() %>"><%= formattedDate %></td>
                <td>
                    <button  class="btn btn-warning" onclick="confirmEdit('<%= e.getCodeemp() %>','<%= l.getCodelieu() %>')">Modifier</button>
                    <button  class="btn btn-danger" onclick="confirmDelete('<%= e.getCodeemp() %>','<%= l.getCodelieu() %>')">Supprimer</button>
                </td>
            </tr>
        <% } %>
    </tbody>
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
                            <h3 class="modal-title" id="scrollmodalLabel">Ajouter une affectation</h3>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                            </button>
                    </div>
                    <div class="modal-body">
                        <div class="card-body card-block">
                            <form method="post" id="ajout_affecter_form">
                                <% Employe[] employes = em.listerEmploye();   %>
                                <label for="selectEmployee">Selectioner un Employee</label>
                                <select name="employe" class="form-control" aria-label="Default select Employee" id="selectEmployee">
                                    <% for (Employe listEmp : employes) { %>
                                    <option value='<%= listEmp.getCodeemp()%>'>
                            <%= '#'+listEmp.getCodeemp() + " - " + listEmp.getNom() + " " + listEmp.getPrenom() + " [ " + listEmp.getPoste() + " ]"%>
                                    </option>
                                    <% } %>
                                </select>    
                                <% Lieu[] lieux = lm.listerLieu();   %>
                                <p></p>

                                <label for="selectPlace">Choisir un lieu</label>
                                <select class="form-control" name="lieu" aria-label="Default select Place" id="selectLieu">
                                    <% for (Lieu li : lieux) { %>
                                    <option value="<%= li.getCodelieu() %>">
                                        <%= '#'+li.getCodelieu() + " - " + li.getDesignation()+ ", " + li.getProvince()%>
                                    </option>
                                    <% } %>
                                </select>                    
<!--                                 <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-user"></i>
                                        </div>
                                        <input type="text" name="codeemp" placeholder="Code employe..." class="form-control" id="employe-add" required>
                                    </div>
                                </div>                          
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-bookmark"></i>
                                        </div>
                                        <input type="text" name="codelieu" placeholder="Code lieu..." class="form-control" id="codelieu-add" required >
                                        <input type="text" name="codeemp_hita" placeholder="Numéro employé..." class="form-control" id="numemployer_hita" required  >
                                    </div>
                                </div>-->
                
                                <div class="form-group">
                                    <label for="selectDate">Choisir un date</label>                                       
                                    <div class="input-group">                                        
                                        <div class="input-group-addon">
                                            <i class="fa fa-user"></i>
                                        </div>
                                        <input type="date" name="date"  class="form-control" id="date-add" required>
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
                    <h3 class="modal-title" id="scrollmodalLabel">Modifier une affectation</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                    </button>
            </div>
            <div class="modal-body">
               <div class="card-body card-block">
                   <form method="post" id="modifier_affecter_form">
                       <div class="form-group">
                           <div class="input-group">
                               <div class="input-group-addon">
                                   <i class="fa fa-bookmark"></i>
                               </div>
                               <input type="text" name="codeemp" placeholder="Numéro employe" class="form-control" id="emp-id-modif" required disabled>
                               <input type="text" name="codeemp" placeholder="Numéro employe" class="form-control" id="numemp_cache" style="display:none">
                           </div>
                       </div>                       
                       <div class="form-group">
                           <div class="input-group">
                               <div class="input-group-addon">
                                   <i class="fa fa-bookmark"></i>
                               </div>
                               <input type="text" name="codelieu" placeholder="Numéro lieu" class="form-control" id="lieu-id-modif" required disabled>
                               <input type="text" name="codelieu" placeholder="Numéro lieu" class="form-control" id="numlieu_cache" style="display:none">
                           </div>
                       </div>
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-user"></i>
                                </div>
                                <input type="date" name="date"  class="form-control" id="date-modif" required>
                            </div>
                        </div>
<!--                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-user"></i>
                                </div>
                                <input type="text" name="province" placeholder="Province..." class="form-control" id="province-modif" required>
                            </div>
                        </div>-->

      
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

<!-- JavaScript at the end of your body section -->
<script src="./js/sweetalerts.js"></script>

<script>

           function switchSection(section) {
        // You can implement section switching logic here
                            // Récupérer l'URL actuelle
                var currentURL = window.location.href;
                var newURL;
                // Remplacer la partie "Lieu" par "Employe"
                if(section === "employe"){
                     newURL = currentURL.replace("Affecter", "Employe");
                }

                else if(section === "lieu"){
                     newURL = currentURL.replace("Affecter", "Lieu");

            }

// Naviguer vers la nouvelle URL
window.location.href = newURL;
        console.log(section);
    }
function searchTable() {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("searchInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("tableau");
    tr = table.getElementsByTagName("tr");

    // Parcours de chaque ligne et masquage des lignes qui ne correspondent pas à la recherche
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[0]; // Première colonne du tableau
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
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
                console.log("2: " + $("#ajout_affecter_form").serialize());

                var currentTimestamp = new Date().getTime();
                var currentTime = new Date(currentTimestamp);
                var hours = currentTime.getHours();
                var minutes = currentTime.getMinutes();
                var seconds = currentTime.getSeconds();

                // Create a formatted time string
                var formattedTime = hours + ':' + (minutes < 10 ? '0' : '') + minutes + ':' + (seconds < 10 ? '0' : '') + seconds;
                
//                codeEmp = document.getElementById("selectEmployee").value;
//                codeLieu = document.getElementById("selectLieu").value;
                var dateInput =  document.getElementById("date-add").value;
                var codelieu = $('#selectLieu').val();
                var codeemp = $('#selectEmployee').val();
//                var dat = document.getElementById("date-add").value;
                dateAdd = dateInput +" "+formattedTime;
                if(dateInput === ""){
                    swal("Formulaire incomplete!", "Choisissez  une date!", "warning");
                }
                else if(document.getElementById("lieuRow-"+codeemp+"-"+codelieu)){
                    swal("Affectation existant!", "Cette affectation existe deja!", "warning");                    
                }
                else {
                console.log(dateAdd);
                var newData = { 
                    employe: codeemp,
                    lieu: codelieu,
                    date: dateAdd
                     };
//                     console.log("new : "+JSON.stringify(newData));
          // Perform AJAX request to delete the person
          $.ajax({
            type: 'POST',
    //        url: '/personneList/delete?id=' + personId,
            url: '${pageContext.request.contextPath}/Affecter/add',
//            data : $("#ajout_affecter_form").serialize(),
            data : newData,
            dataType: "json", // Corrected dataType
    //        data: { id: personId },
            success: function(response) {
                    console.log("3");
//                    codeEmpToAdd = document.getElementById("selectEmployee").value;
                    swal("Affectation reussi!", "L'affectation est bien reussie!", "success");
                    var dateform = dateInput.split("-");

                    var newRow = '<tr id="lieuRow-' + codeemp + '-' + codelieu + '">' +
                    '<td id="employeId-' + codeemp + '-' + codelieu +'">[ '+codeemp + " ] -" + response.nom+ " " + response.prenom + '</td>' +
                    '<td id="lieuId-' + codeemp + '-' + codelieu + '">' + response.designation+  " " + response.province +'</td>' +                    

                    '<td id="affecterDate-' + codeemp + '-' + codelieu + '">' + dateform[2]+"/"+dateform[1]+"/"+dateform[0] + '</td>' +
                    '<td>' +
                    '<a href="#" onclick="confirmEdit(\'' + codeemp + '\',\'' + codelieu + '\')">Modifier</a>' +
                    '&nbsp;&nbsp;&nbsp;&nbsp;' +
                    '<a href="#" onclick="confirmDelete(\'' + codeemp + '\',\'' + codelieu + '\')">Supprimer</a>' +
                    '</td>' +
                    '</tr>';
//                $('table').prepend(newRow);
                $('table tr:first').after(newRow);
          $('#addModal').modal('hide');

            },
            error: function(error) {
              // Handle error
              console.error('Error Adding affectation', error);
            }
          });
                    
                    
                }
                

          // Hide the modal after the request is sent
        });
      }
    
   
    
   function confirmEdit(personId,lieuId) {
    // Show Bootstrap modal
    $('#editModal').modal('show');
    console.log("1");
    $('#emp-id-modif').val(personId);
    $('#numemp_cache').val(personId);
    $('#lieu-id-modif').val(lieuId);
    $('#numlieu_cache').val(lieuId);
    var last_date = $('#affecterDate-' + personId + '-' + lieuId).text();
    var d = last_date.split("/");
     $('#date-modif').val(d[2] + "-" + d[1] + "-" + d[0]);
//    $('#date-modif').val($('#affecterDate-' + personId + '-' + lieuId).text());


//    // Set person ID in the modal's delete button
    $('#btn_valider').off('click').on('click', function() {
            console.log("2");
                var currentTimestamp = new Date().getTime();
                var currentTime = new Date(currentTimestamp);
                var hours = currentTime.getHours();
                var minutes = currentTime.getMinutes();
                var seconds = currentTime.getSeconds();

                // Create a formatted time string
                var formattedTime = hours + ':' + (minutes < 10 ? '0' : '') + minutes + ':' + (seconds < 10 ? '0' : '') + seconds;
                
                var codeEmp = document.getElementById("numemp_cache").value;
                var codeLieu = document.getElementById("numlieu_cache").value;
                var dateModif = document.getElementById("date-modif").value+" "+formattedTime;
                var newData = { 
                    codeemp: codeEmp,
                    codelieu : codeLieu,
                    date: dateModif
                     };

                     console.log("new : "+JSON.stringify(newData));
      // Perform AJAX request to delete the person
      $.ajax({
        type: 'POST',
            url: '${pageContext.request.contextPath}/Affecter/update',
//            data : $("#modifier_affecter_form").serialize(),
        data: newData,
        success: function(response) {
                console.log("3");

          // Handle success, e.g., refresh the page
//          location.reload();
//          $('#lieuId-' + personId + '-' + lieuId).text( $('#lieu-id-modif').val());
//          $('#employeId-' + personId + '-' + lieuId).text( $('#emp-id-modif').val());
            var new_date = $('#date-modif').val().split("-");
          $('#affecterDate-' + personId + '-' + lieuId).text(new_date[2]+"/"+new_date[1]+"/" +new_date[0]);
        swal("Modification  reussi!", "La modification de l'affectation est bien reussie!", "success");
          

        },
        error: function(error) {
          // Handle error
          console.error('Error editing affecter', error);
        }
      });

      // Hide the modal after the request is sent
      $('#editModal').modal('hide');
    });
  }   
 
    
    
    
  function confirmDelete(personId,lieuId) {
    // Show Bootstrap modal

    $('#deleteModal').modal('show');
    

    // Set person ID in the modal's delete button
    $('#deleteModalBtn').off('click').on('click', function() {
            console.log("2");

      // Perform AJAX request to delete the person
      $.ajax({
        type: 'GET',
//        url: '/personneList/delete?id=' + personId,
        url: '${pageContext.request.contextPath}/Affecter/delete?codeemp=' + personId +'&codelieu='+ lieuId,

//        data: { id: personId },
        success: function(response) {
                console.log("3");

          // Handle success, e.g., refresh the page
//          location.reload();  
          $('#lieuRow-' + personId + '-' + lieuId).remove();
        swal("Suppression  reussi!", "La suppression de l'affectation est bien reussie!", "success");          
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
