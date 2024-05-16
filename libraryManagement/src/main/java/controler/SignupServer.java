package controler;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.DbManipulation;
import dto.UserLogin;
import dto.UserSignUp;
@WebServlet("/signup")
@MultipartConfig(maxFileSize = 20*1024*1024)
public class SignupServer extends HttpServlet {
     @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String name =req.getParameter("username");
    	String email =req.getParameter("email");
    	String password =req.getParameter("password");
    	String department =req.getParameter("userdept");
    	Part part=req.getPart("image");
    	byte []image=part.getInputStream().readAllBytes();
    	
    	
    	DbManipulation db=new DbManipulation();
    	UserSignUp user=new UserSignUp();
    	user.setUserName(name);
    	user.setUserEmail(email);
    	user.setUserPassword(password);
    	user.setUserDepartment(department);
    	user.setImage(image);
        UserLogin login=new UserLogin(email,password);
    	try {
			int row=db.SaveUser(user);
			int row2=db.saveLoginUSer(login);
			if(row>0 && row2>0)
			{
				req.getSession().setAttribute("sign",user);
				resp.sendRedirect("login.jsp");
			}
			else {
				resp.sendRedirect("signup.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
    	
    }
}
