package controler;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.DbManipulation;
import dto.Books;
@WebServlet("/book")
@MultipartConfig(maxFileSize = 30*1024*1024)
public class AddBook extends HttpServlet{
           @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        	int id=Integer.parseInt(req.getParameter("id"));
        	String bookName=req.getParameter("title");
        	String keywords=req.getParameter("key");
        	Part bookFile=req.getPart("book");
            byte [] book=bookFile.getInputStream().readAllBytes();
           
            DbManipulation db =new DbManipulation();
            Books books=new Books(id,bookName,keywords,book);
            try {
				   int k=db.saveBooks(books);
				   if(k>0)
				   {
					 List<Books>list=(List<Books>)req.getSession().getAttribute("books");
					
					     list.add(books);

						  req.getSession().setAttribute("books", list);
						  resp.sendRedirect("adminmain.jsp");
						  
				
				   }
				   else {
					   resp.sendRedirect("addbooks.jsp");
				   }
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
           
           }
}
