package notedProject;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;

import java.lang.System.*;

/**
 * Servlet implementation class ValidateLogin
 */
@WebServlet("/ValidateLogin")
public class ValidateLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidateLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password =request.getParameter("password") ;
		String forward = "";
		request.setAttribute("username", username);
		request.setAttribute("password", password);
		
		InputStream jsonPath = (InputStream) getServletContext().getResourceAsStream("/database.json");
		String path = getServletContext().getRealPath("/database.json");
		LoadDatabase loadDatabase = new LoadDatabase(jsonPath, path);
		loadDatabase.writeData();
		HttpSession session = request.getSession();
		session.setAttribute("database", loadDatabase);
		
		LoadDatabase database = (LoadDatabase) request.getSession(false).getAttribute("database");
		boolean check = true;
		boolean logincheck = database.CheckLogin(username, password);
		
		User u = database.getUser(username);
		String url = u.getPicURL();
		request.setAttribute("url", url);
		System.out.println("picture"+url);
		
		if(logincheck) {
			System.out.println("true");
		}
		else {
			System.out.println("false");
		}
		if (username == "") {
    			request.setAttribute("name_err", "Please enter Username");
    			forward = "/login.jsp";
    			check = false;
		}
		if (password == "") {
    			request.setAttribute("password_err", "Please enter Password");
    			forward = "/login.jsp";
    			check = false;
		}
		if (username != "" && password != "" && !logincheck) {
			forward = "/login.jsp";
			request.setAttribute("login_err", "Login failed");
			check = false;
		}
		if (check) {
			session.setAttribute("currentUser", username.toLowerCase());
			
			System.out.println("CHECK");
			
			// Direct to empty search result page 
			String query = "intitle:";
			
			try {
//				BookResult bResult = new BookResult();
//				Volumes volumes = bResult.getSearchResult(query);
				
				//output result
				String page = "/joinGame.jsp?username="+username+"&url="+url;
				forward = "/joinGame.jsp?username="+username+"&url="+url;
//				session.setAttribute("result", volumes);
				
//				System.out.println(volumes.getTotalItems());					
				RequestDispatcher dispatcher = request.getRequestDispatcher(page);
				
				if (dispatcher != null){
					dispatcher.forward(request, response);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.err.println(e.getMessage());
			}
		}
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(forward);
		dispatch.forward(request,response);
	}

}
