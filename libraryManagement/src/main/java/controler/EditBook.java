package controler;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.DbManipulation;
import dto.Books;

@WebServlet("/edit")
public class EditBook extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	String bookName=req.getParameter("title");
    	String keywords=req.getParameter("key");
    	
       
        DbManipulation db =new DbManipulation();
        Books books=new Books();
       
        books.setBookName(bookName);
        books.setKeyWords(keywords);
         try {
			int row=db.updateBook(books);
			if(row>0)
			{
				List<Books>list=db.getBooks();
				req.getSession().setAttribute("books", list);
				resp.sendRedirect("adminmain.jsp");
			}
			else {
				resp.sendRedirect("adminmain.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
