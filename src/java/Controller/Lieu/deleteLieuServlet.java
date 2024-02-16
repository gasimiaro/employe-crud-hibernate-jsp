
package Controller.Employe;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import java.sql.SQLException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Lieu.Lieu;
//import java.util.ArrayList;
import manager.LieuManager;

@WebServlet("/Lieu/delete")
public class deleteLieuServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       
    LieuManager lm = new LieuManager();

		String id = request.getParameter("id");
		lm.supprimerLieu(id);
                response.sendRedirect(request.getContextPath() + "/Lieu");
        

    }
    
    	
}
