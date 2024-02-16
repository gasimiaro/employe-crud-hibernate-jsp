
package Controller.Affecter;
import Model.Affecter.AffecterId;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import java.sql.SQLException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Employe.Employe;
import Model.Lieu.Lieu;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import manager.AffecterManager;
//import java.util.ArrayList;

@WebServlet("/Affecter/update")
public class editAffecterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String codeemp = request.getParameter("codeemp");
            String codelieu = request.getParameter("codelieu");
            String dat = request.getParameter("date");
//            AffecterId id = new AffecterId(codeemp,codelieu);
//            Employe emp = new Employe();
//            
//            Lieu lieu = new Lieu();
            AffecterManager am = new AffecterManager();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date dateForma = dateFormat.parse(dat);
            
            am.modifierAffecter(codeemp,codelieu,dateForma);
            response.sendRedirect(request.getContextPath() + "/Affecter");
        } catch (ParseException ex) {
            Logger.getLogger(editAffecterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        

    }
    
    	
}
