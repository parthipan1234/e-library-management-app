package controler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dto.UserSignUp;


@WebServlet("/prof")
@MultipartConfig(maxFileSize = 10*1024*1024)
public class Profile extends HttpServlet{
    @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
   	Part part=req.getPart("image");
       byte []image=part.getInputStream().readAllBytes();
       UserSignUp user=(UserSignUp)req.getSession().getAttribute("user");
       user.setImage(image);
       resp.sendRedirect("UserMain.jsp");
    }

}
