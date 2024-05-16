package controler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DbManipulation;
import dto.Books;
@WebServlet("/delete")
public class Delete extends HttpServlet {
  @Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 int id=  Integer.parseInt(req.getParameter("id"));
	 DbManipulation db=new DbManipulation();
	 List<Books>list=(List<Books>)req.getSession().getAttribute("boo");
	 if(db.deleteBookFromCart(id,list)) {
	 resp.sendRedirect("showcart.jsp");
	 }
	 else
	 {
		 resp.sendRedirect("showcart.jsp");

	 }
}
}
