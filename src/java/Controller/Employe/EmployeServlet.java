
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

@WebServlet("/Employe")
public class EmployeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                EmployeManager pm = new EmployeManager();
//        List<Personne> personnes = pm.listerPersonnes();
    Employe[] EmployeArray = pm.listerEmploye();

        request.setAttribute("employeArray", EmployeArray);

        // Forward to JSP
        getServletContext().getRequestDispatcher("/Employe.jsp").forward(request, response);
        
    
    }
    

        

}
