package controler;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import dao.DbManipulation;
import dto.Books;
@WebServlet("/addtocart")
public class AddToCart extends HttpServlet{
       @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      int id=Integer.parseInt(req.getParameter("id"));
      DbManipulation db=new DbManipulation();
      try {
    	  
		Books book= db.getBookById(id);
	
		if(book!=null) {
	    List<Books>books=(List<Books>)req.getSession().getAttribute("boo");
	    books.add(book);
		req.getSession().setAttribute("addbook", books);
		resp.sendRedirect("UserMain.jsp");
		}
		else
		{
			resp.sendRedirect("UserMain.jsp");
		}
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    }
}
