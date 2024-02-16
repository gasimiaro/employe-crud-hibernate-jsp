
package Controller.Affecter;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import java.sql.SQLException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Affecter.Affecter;
import Model.Affecter.AffecterId;
import Model.Employe.Employe;
import Model.Lieu.Lieu;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
//import java.util.ArrayList;
import manager.AffecterManager;

@WebServlet("/Affecter/add")
public class addAffecterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String codeemp = request.getParameter("employe");
            String codelieu = request.getParameter("lieu");
            String dat = request.getParameter("date");
            
            AffecterManager am = new AffecterManager();
            Employe emp = new Employe();
            
            Lieu lieu = new Lieu();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date dateForma = dateFormat.parse(dat);
            
            AffecterId id = new AffecterId(codeemp,codelieu);
            am.ajouterAffecter(id,emp,lieu,dateForma);
            Employe employee = am.getEmpDetails(codeemp);
            Lieu location = am.getLieuDetails(codelieu);
            
            // Construct JSON response
            String jsonResponse = "{ \"nom\": \"" + employee.getNom() + "\", "
                    + "\"prenom\": \"" + employee.getPrenom() + "\", "
                    + "\"designation\": \"" + location.getDesignation() + "\", "
                    + "\"province\": \"" + location.getProvince() + "\" }";

            response.setContentType("application/json");
            // Write JSON response back to the client
            response.getWriter().write(jsonResponse);
            
//            response.sendRedirect(request.getContextPath() + "/Affecter");
        } catch (ParseException ex) {
            Logger.getLogger(addAffecterServlet.class.getName()).log(Level.SEVERE, null, ex);
            // Send an error response to the client
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\": \"Invalid date format\"}");
        } catch (Exception e) {
            Logger.getLogger(addAffecterServlet.class.getName()).log(Level.SEVERE, null, e);
            // Send an error response to the client
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"Internal Server Error\"}");
        }
    }
    }
    
    	

