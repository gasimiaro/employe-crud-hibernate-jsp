
package Controller.Employe;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import java.sql.SQLException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Employe.Employe;
//import java.util.ArrayList;
import manager.EmployeManager;

@WebServlet("/Employe/update")
public class editEmployeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                String id = request.getParameter("id-modif");
                String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String poste = request.getParameter("poste");
                EmployeManager pm = new EmployeManager();
		pm.modifierEmploye(id,nom,prenom,poste);
                response.sendRedirect(request.getContextPath() + "/Employe");
        

    }
    
    	
}
