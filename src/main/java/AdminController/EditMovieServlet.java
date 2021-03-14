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

@WebServlet("/EditMovieServlet")
public class EditMovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String movieId = request.getParameter("movieId");
		Movie movie = new Movie();

		if(movieId != null && !(movieId.equals(""))){
			try {
				movie = new MyDao().selectOne(Integer.parseInt(movieId));
			} catch (Exception e) {
				request.getSession().setAttribute("exception",e.getMessage());
			}
			request.getSession().setAttribute("movie", movie);
			response.sendRedirect("admin/EditMovie.jsp");
		}else{
			request.getSession().setAttribute("message", "Error !!!! Please select one Category!!!!!!");
			response.sendRedirect("admin/AdminHome.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int movieId = Integer.parseInt(request.getParameter("movie_id"));
		String movieName= request.getParameter("movie_name");
		String moviePrice = request.getParameter("movie_price");
		String movieYear = request.getParameter("movie_year");
		Movie movie = new Movie();
		HttpSession adminSession = request.getSession(false);

		boolean status = false;
		PrintWriter out = response.getWriter();
		if(movieName != null && moviePrice != null && movieYear != null && movieId != 0){
			movie.setMovieId(movieId);
			movie.setMovieName(movieName);
			movie.setMoviePrice(Double.parseDouble(moviePrice));
			movie.setMovieYear(Integer.parseInt(movieYear));
			try {
				status = new MyDao().update(movie);
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
