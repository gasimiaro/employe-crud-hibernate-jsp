
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
import manager.AffecterManager;
//import java.util.ArrayList;
import manager.EmployeManager;

@WebServlet("/Affecter/delete")
public class deleteAffecterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       
    AffecterManager am = new AffecterManager();

		String codeemp = request.getParameter("codeemp");
		String codelieu = request.getParameter("codelieu");
                
		am.supprimerAffecter(codeemp,codelieu);
                response.sendRedirect(request.getContextPath() + "/Affecter");
        

    }
    
    	
}
