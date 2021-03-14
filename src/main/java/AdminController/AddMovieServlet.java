package AdminController;

import DAO.MyDao;
import Model.Movie;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/AddMovieServlet")
public class AddMovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Movie movie = new Movie();
		boolean status = false;
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		String movieName= request.getParameter("movie_name");
		String moviePrice = request.getParameter("movie_price");
		String movieYear = request.getParameter("movie_year");
		HttpSession adminSession = request.getSession(false);

		if(movieName != null && moviePrice != null && movieYear != null){
			movie.setMovieName(movieName);
			movie.setMoviePrice(Double.parseDouble(moviePrice));
			movie.setMovieYear(Integer.parseInt(movieYear));
			try {
				status = new MyDao().insert(movie);
			} catch (Exception e) {
				adminSession.setAttribute("exception",e);
				e.printStackTrace();
			}
			if(status){
				out.println("<script>alert('You Have Succesfully Added new Movie !!!')</script>");
				adminSession.setAttribute("message","You Have Succesfully Added new Movie !!!" );
				response.sendRedirect("admin/AdminHome.jsp");
			}else{
				out.println("<script>alert('Error !!! You Have Added duplicate Movie  !!!')</script>");
				adminSession.setAttribute("message","Error !!! You Have Added duplicate Movie !!!" );
				response.sendRedirect("admin/AdminHome.jsp");
			}
		}else{
			out.println("<script>alert('Write Movie Details Again !!!')</script>");
			response.sendRedirect("AdminLogin.jsp");
		}


	}

}
