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
@WebServlet("/remove")
public class DeleteBook extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		DbManipulation db=new DbManipulation();
		try {
			int row=db.deleteBookFromDb(id);
			List<Books>list=db.getBooks();
			if(row>0) {
			resp.sendRedirect("adminmain.jsp");
			req.getSession().setAttribute("books",list);
			}
			} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
