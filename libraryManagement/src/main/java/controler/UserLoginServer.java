package controler;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DbManipulation;
import dto.Books;
import dto.UserSignUp;
@WebServlet("/login")
public class UserLoginServer extends HttpServlet{
     @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String name=req.getParameter("email");
    	String pass=req.getParameter("password");
    	 DbManipulation db=new DbManipulation();
    	 //Date date=new Date();
    	 try {
			if(db.checkUser(name, pass))
			{
				
				List<Books>books=db.getBooks();
				UserSignUp user=db.getData(pass);
				List<Books>boo=new ArrayList<>();
				req.getSession().setAttribute("boo", boo);
				req.getSession().setAttribute("books", books);
				req.getSession().setAttribute("user", user);
				resp.sendRedirect("UserMain.jsp");
				req.getSession().setAttribute("usererror", "");
				 List<String>time=new ArrayList<>();
				req.getSession().setAttribute("time", time); 
			}
			else
			{
				resp.sendRedirect("login.jsp");
				req.getSession().setAttribute("usererror", "We Can't able to Process. Please SignUp..!");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}



//<div class="tabbody">
//<table class="tab">
//    <tr>
//    <th>S.no</th>
//    <th>Book Name</th>
//    <th>Keywords</th>
//    <th>Book</th>
//    <th>To View</th>
//    <th>#</th>
//    </tr>
//    
//    <% if(list!=null){
//   	 for(Books book:list){
//   	%>
//   	<tr>
//   	<td><%=book.getBookid() %></td>
//   	<td><%= book.getBookName()%></td>
//   	<td><%= book.getKeyWords()%></td>
//   	<td><%= book.getBookFile()%></td>
//   	<td><a id="cart"href="#" >Add To Cart</a></td>
//   	<td><a href="#">Download Book</a></td>
//       
//       </tr>
//    <%} }%>
//    
//    
//</table>          
//</div>