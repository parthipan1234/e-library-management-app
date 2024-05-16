package controler;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DbManipulation;
import dto.Books;
import dto.UserSignUp;
@WebServlet("/adminlogin")
public class AdminLoginServer extends HttpServlet{
    @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
   	String name=req.getParameter("email");
   	String pass=req.getParameter("password");
   	 DbManipulation db=new DbManipulation();
   	 try {
			if(db.checkAdmin(name, pass))
			{
				List<Books>books=db.getBooks();
				UserSignUp user=db.getData(pass);
				req.getSession().setAttribute("books", books);
				req.getSession().setAttribute("user", user);
				resp.sendRedirect("adminmain.jsp");
				req.getSession().setAttribute("adminerror", "");

			}
			else
			{
				resp.sendRedirect("adminlogin.jsp");
				req.getSession().setAttribute("adminerror", "Admin only can login here...!");
				
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   }

}
