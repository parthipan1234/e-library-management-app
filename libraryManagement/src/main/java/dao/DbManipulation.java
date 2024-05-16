package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Blob;
import javax.sql.rowset.serial.SerialBlob;
import java.util.*;


import dto.Books;
import dto.UserLogin;
import dto.UserSignUp;

public class DbManipulation {
	
      private static Connection getConnection() throws ClassNotFoundException, SQLException
      {
    	  Class.forName("com.mysql.cj.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/e_library_management?user=root&password=root");
        return con;
      }
      public int SaveUser(UserSignUp user) throws ClassNotFoundException, SQLException 
      {
    	Connection con=getConnection();  
        PreparedStatement pst=con.prepareStatement("insert into usersignup values(?,?,?,?,?)");
        //pst.setInt(1, user.getUserId());
        pst.setString(1, user.getUserName());
        pst.setString(2, user.getUserEmail());
        pst.setString(3, user.getUserPassword());
        pst.setString(4, user.getUserDepartment());
         Blob  blob=new SerialBlob(user.getImage());
         pst.setBlob(5, blob);
         int row=pst.executeUpdate();
        return row;
      }
      public int saveLoginUSer(UserLogin login) throws ClassNotFoundException, SQLException
      {
    	  Connection con =getConnection();
    	  PreparedStatement pst=con.prepareStatement("insert into userlogin values(?,?,?)");
    	  pst.setInt(1, login.getUserId());
    	  pst.setString(2,login.getUserEmail());
    	  pst.setString(3,login.getUserPassword());
         int row=pst.executeUpdate();
      return row;
      }
      public boolean checkUser(String email,String pass) throws ClassNotFoundException, SQLException
      {
    	  Connection con=getConnection();
    	  PreparedStatement pst=con.prepareStatement("select * from userlogin where useremail=?");
          pst.setString(1, email);
          ResultSet rs=pst.executeQuery();
          while (rs.next()) {
		       if(rs.getString(2).equals(email))
		       {
		    	   if(rs.getString(3).equals(pass)) {
		    		   return true;
		    	   }
		    	   
		       }
		}
          return false;
      }
      public UserSignUp getData(String pass) throws SQLException, ClassNotFoundException
      {
    	  Connection con =getConnection();
    	  PreparedStatement pst=con.prepareStatement("select * from usersignup where userpassword=?");
    	  pst.setString(1, pass);
    	  ResultSet rs=pst.executeQuery();
    	 
    	  while(rs.next())
    	  {
    		  Blob blob=rs.getBlob(6);
    		  byte[] image=blob.getBytes(1, (int)blob.length());
    		  UserSignUp  sign=new UserSignUp(rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),image);
    	    return sign;
    	  }
    	  return null;
      }
      public List<UserSignUp> getUsers() throws SQLException, ClassNotFoundException
      {
    	  Connection con =getConnection();
    	  PreparedStatement pst=con.prepareStatement("select * from usersignup ");
  
    	  ResultSet rs=pst.executeQuery();
    	 List<UserSignUp>list=new ArrayList<>();
    	  while(rs.next())
    	  {
    		  Blob blob=rs.getBlob(6);
    		  byte[] image=blob.getBytes(1, (int)blob.length());
    		  UserSignUp  sign=new UserSignUp(rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),image);
    	    list.add(sign); 
    	  }
    	  return list;
      }
      public int saveBooks(Books book) throws ClassNotFoundException, SQLException {
    	  Connection con=getConnection();
    	  PreparedStatement pst=con.prepareStatement("insert into uploadbooks values(?,?,?,?)");
          pst.setInt(1, book.getBookid());     
          pst.setString(2,book.getBookName());
          pst.setString(3,book.getKeyWords());
          
          Blob blob=new SerialBlob(book.getBookFile());
          
          pst.setBlob(4,blob);
          int row=pst.executeUpdate();
          return row;
      }
      public List<Books> getBooks() throws ClassNotFoundException, SQLException {
    	  Connection con=getConnection();
    	  PreparedStatement pst=con.prepareStatement("select * from uploadbooks");
    	  ResultSet rs=pst.executeQuery();
    	  List<Books>list=new ArrayList<>();
    	  while(rs.next()) {
    		  
    		Blob blob=rs.getBlob(4);
    		byte [] file=blob.getBytes(1, (int)blob.length());
    	  Books book=new Books(rs.getInt(1),rs.getString(2),rs.getString(3),file);
    	  list.add(book);
    	  
    	  }
    	  return list;
      }
      public boolean checkAdmin(String email,String pass) throws ClassNotFoundException, SQLException {
    	  Connection con=getConnection();
    	  PreparedStatement pst=con.prepareStatement("select * from admin where adminemail=?");
    	  pst.setString(1, email);
    	  ResultSet rs=pst.executeQuery();
    	  if(rs.next())
    	  {
    		  if(email.equals(rs.getString(2)))
    		  {
    			  if(pass.equals(rs.getString(3)))
    			  {
    				  return true;
    			  }
    		  }
    	  }
    	  return false;
       }
      public Books getBookById(int id) throws ClassNotFoundException, SQLException
      {
    	  Connection con=getConnection();
    	  PreparedStatement pst=con.prepareStatement("select * from uploadbooks where bookid=?");
    	  pst.setInt(1, id);
    	   ResultSet rs= pst.executeQuery();
    	   if(rs.next())
    	   {
    		   Blob blob=rs.getBlob(4);
    		   byte []file=blob.getBytes(1,(int) blob.length());
    		   Books book=new Books(rs.getInt(1),rs.getString(2),rs.getString(3),file);
    		   return book;
    	   }
    	  return null;
      }
      public boolean deleteBookFromCart(int id,List<Books> books){
    	  for(Books book:books)
    	  {
    		  if(book.getBookid()==id)
    		  {
    			  books.remove(book); 
    			  return true;
    		  }
    	  }
    	  return false;
      }
      
      public int deleteBookFromDb(int id) throws SQLException, ClassNotFoundException{
    	   Connection con=getConnection();
    	   PreparedStatement pst=con.prepareStatement("delete from uploadbooks where bookid=?");
    		 pst.setInt(1, id);
    		 int row=pst.executeUpdate();
    	  return row;
      }
     public int updateBook(Books book) throws SQLException, ClassNotFoundException
     {
    	 Connection con=getConnection();
    	 PreparedStatement pst=con.prepareStatement("update uploadbooks set bookname=?,bookkeywords=? where bookid=?");
    	pst.setString(1, book.getBookName()); 
    	pst.setString(2, book.getKeyWords());
        pst.setInt(3, book.getBookid());
    	int row=pst.executeUpdate();
    	 return row;
     }
     
}

