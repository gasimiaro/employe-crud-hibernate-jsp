
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

@WebServlet("/Lieu/add")
public class addLieuServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                String id = request.getParameter("codelieu");
                String designation = request.getParameter("designation");
		String province = request.getParameter("province");
                LieuManager lm = new LieuManager();
		lm.ajouterLieu(id,designation,province);
                response.sendRedirect(request.getContextPath() + "/Lieu");
        

    }
    
    	
}
