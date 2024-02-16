
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

@WebServlet("/Lieu")
public class LieuServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                LieuManager lm = new LieuManager();
//        List<Personne> personnes = pm.listerPersonnes();
    Lieu[] LieuArray = lm.listerLieu();

        request.setAttribute("lieuArray", LieuArray);

        // Forward to JSP
        getServletContext().getRequestDispatcher("/Lieu.jsp").forward(request, response);
        
        
        
        
//        String action = request.getServletPath();
//        System.out.println("action : "+action);
//		try {
//			switch (action) {
//			case "/new":
////				showNewForm(request, response);
//				break;
//			case "/insert":
////				insertUser(request, response);
//				break;
//			case "/delete":
//				deleteUser(request, response);
//				break;
//			case "/edit":
////				showEditForm(request, response);
//				break;
//			case "/update":
////				updateUser(request, response);
//				break;
//                        case "/":
////				updateUser(request, response);
//				break;
//			default:
//				listUser(request, response);
//				break;
//			}
//        
//                } catch (SQLException ex) {
//			throw new ServletException(ex);
//		}
        
//        PersonneManager pm = new PersonneManager();
////        List<Personne> personnes = pm.listerPersonnes();
//    Personne[] personneArray = pm.listerPersonnes();
//
//        request.setAttribute("personneArray", personneArray);
//
//        // Forward to JSP
//        getServletContext().getRequestDispatcher("/personneList.jsp").forward(request, response);
    }
    
    	private void listUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ServletException {
        
//        PersonneManager pm = new PersonneManager();
////        List<Personne> personnes = pm.listerPersonnes();
//    Personne[] personneArray = pm.listerPersonnes();
//
//        request.setAttribute("personneArray", personneArray);
//
//        // Forward to JSP
//        getServletContext().getRequestDispatcher("/personneList.jsp").forward(request, response);
	}
        

}
