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
//import java.util.ArrayList;
import manager.AffecterManager;

@WebServlet("/Affecter")
public class AffecterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                AffecterManager am = new AffecterManager();
//        List<Affecter> AffecterArray = am.listerAffecter();
    Affecter[] AffecterArray = am.listerAffecter();

        request.setAttribute("affecterArray", AffecterArray);

        // Forward to JSP
        getServletContext().getRequestDispatcher("/Affectation.jsp").forward(request, response);
        
    
    }
    

        

}
