<%@page import="java.io.FilterOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="dao.DbManipulation"%>
    <%@ page import="dto.Books"%>
    <%@ page import="java.util.*"%>
    <%@ page import ="javax.servlet.http.Part"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
<style type="text/css">
*{
 padding: 0;
  margin: 0;
  box-sizing: border-box;
  font-family: Roboto,sans-serif;
  outline: none;
  text-decoration: none;
}

.container{
height: 100vh;
width: 100%;
gap:40px;
background-color:#dff9fb;
display:flex;

flex-direction: column;
justify-content:center;
align-items: center;
}
.signup-form{
width:50.5%;
border:1px solid #888;
display: flex;
flex-direction: column;
justify-content:center;
padding-right:20px;
border-radius: 5px;
background-color: #fff;
color: #888;
gap:10px;
}
.form-label{
font-size: 17px;
margin-top: 10px ;
marin-left:30px;
padding-left: 30px;
color: #535c68;
}
input{
padding: 10px 20px;
border-radius: 4px;
outline:none;
width: auto;  
margin-left:  30px;
margin-top:5px;
border: 1px solid gray;
}
.btn{
 border: none;

background-color:#130f40; 
 color: white;
 font-size: 18px;
 border-radius: 5px;
 padding:7px 14px;
 margin: 10px  0px 10px 30px;
 cursor: pointer;  
}
.headings{
margin-top:60px;
color: #130f40;
width: 50%;
}
</style>
</head>
<body>
<% DbManipulation db=new DbManipulation();%>
<%String bookid=request.getParameter("id");
  int id=Integer.parseInt(bookid);
%>
  <%Books book=db.getBookById(id); %>
        <div class="container">
         <div class="headings">
         <h1>Welcome Back</h1>
         <p>Please provide Your  details</p>
         </div>
        <form action="edit" method="post"enctype="multipart/form-data" class="signup-form">
             
              <label for="id" class="form-label">Book Id</label>
           <input type="text" placeholder="Book Id" id="id" name="id" value="<%=book.getBookid() %>" disabled="disabled">
             
           <label for="title" class="form-label">Book Name</label>
           <input type="text" placeholder="Book Name" id="title" name="title" value="<%=book.getBookName() %>">
           
           <label for="key" class="form-label">Author Name</label>
           <input type="text" placeholder="Key words" id="key" name="key" value="<%=book.getKeyWords() %>">
           
            <label for="book" class="form-label">Upload Book</label>
           <input type="file"  id="book" name="book" value="<%=book.getBookFile()%>" disabled="disabled">
           
           <button type="submit" class="btn">Add Book</button>           
           </form>
           </div>
</body>
</html>