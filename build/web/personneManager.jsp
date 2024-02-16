<%-- 
    Document   : personneManager
    Created on : Jan 30, 2024, 4:09:08 PM
    Author     : G A S I M I  A R O
--%>

<%@ page import="java.util.List" %>
<%@ page import="bean.Personne" %>
<%@ page import="manager.PersonneManager" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="org.hibernate.Query" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="util.HibernateUtil" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    PersonneManager personneManager = new PersonneManager();
    String action = request.getParameter("action");

    if (action != null) {
        if (action.equals("ajouter")) {
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String tel = request.getParameter("tel");
            String email = request.getParameter("email");

            personneManager.ajouterPersonne(nom, prenom, tel, email);
        } else if (action.equals("modifier")) {
            int idPersonneAModifier = Integer.parseInt(request.getParameter("id"));
            Personne personneAModifier = personneManager.getPersonneById(idPersonneAModifier);
            request.setAttribute("personneAModifier", personneAModifier);
        } else if (action.equals("validerModifier")) {
            int idPersonneAModifier = Integer.parseInt(request.getParameter("id"));
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String tel = request.getParameter("tel");
            String email = request.getParameter("email");

            personneManager.validerModifierPersonne(idPersonneAModifier, nom, prenom, tel, email);
        } else if (action.equals("supprimer")) {
            int idPersonneASupprimer = Integer.parseInt(request.getParameter("id"));
            personneManager.supprimerPersonne(idPersonneASupprimer);
        }
    }

    // Récupérer la liste des personnes après toute modification
    List<Personne> personnes = personneManager.listerPersonnes();
    request.setAttribute("personnes", personnes);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Personne Manager</title>
</head>
<body>


<h2>Liste des Personnes</h2>

<c:forEach var="personne" items="${personnes}">
    <p>
        ID: ${personne.id} <br>
        Nom: ${personne.nom} <br>
        Prénom: ${personne.prenom} <br>
        Téléphone: ${personne.tel} <br>
        Email: ${personne.email} <br>
        <a href="PersonneManager.jsp?action=modifier&id=${personne.id}">Modifier</a>
        <a href="PersonneManager.jsp?action=supprimer&id=${personne.id}">Supprimer</a>
    </p>
    <hr>
</c:forEach>

<h2>Ajouter une Personne</h2>
<form action="PersonneManager.jsp?action=ajouter" method="post">
    Nom: <input type="text" name="nom" required><br>
    Prénom: <input type="text" name="prenom" required><br>
    Téléphone: <input type="text" name="tel" required><br>
    Email: <input type="text" name="email" required><br>
    <input type="submit" value="Ajouter">
</form>

<%-- Afficher le formulaire de modification si l'action est "modifier" --%>
<c:if test="${param.action eq 'modifier'}">
    <h2>Modifier une Personne</h2>
    <form action="PersonneManager.jsp?action=validerModifier&id=${param.id}" method="post">
        Nom: <input type="text" name="nom" value="${personneAModifier.nom}" required><br>
        Prénom: <input type="text" name="prenom" value="${personneAModifier.prenom}" required><br>
        Téléphone: <input type="text" name="tel" value="${personneAModifier.tel}" required><br>
        Email: <input type="text" name="email" value="${personneAModifier.email}" required><br>
        <input type="submit" value="Valider la Modification">
    </form>
</c:if>

</body>
</html>

