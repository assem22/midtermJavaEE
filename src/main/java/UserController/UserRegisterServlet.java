package UserController;

import Model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String formUsername = request.getParameter("form-username");
		String formPassword = request.getParameter("form-password");
		String formEmail = request.getParameter("form-email");

		if(formUsername != null && formPassword != null && formEmail != null){
			try{
				User newUser = new User();
				newUser.setUsername(formUsername);
				newUser.setUser_password(formPassword);
				newUser.setEmail(formEmail);

//				boolean isUserRegistered = AdminDbDAO.addNewUser(newUser);
				boolean isUserRegistered = true;
				
				response.setContentType("text/html");
				if(isUserRegistered){
					out.print("<h3>You are Registered Successfully!!!!!!</h3>");
					out.print("<a href='Login.jsp'>Go To Login Page</a>");
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				out.close();
			}
		}else{
			response.sendRedirect("registration.jsp");
		}
	}
}
