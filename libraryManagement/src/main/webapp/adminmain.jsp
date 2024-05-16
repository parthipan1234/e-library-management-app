<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="dto.UserSignUp"%>
    <%@ page import="dto.Books"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
:root {
	--first-color: white;
	--bg-color: #080808;
	--second-bg-color: #001005;
	--main-color: #00ff51;
}
.container{
min-height: 100vh;
width: 100%;
display: flex;
background-color:#dff9fb;
flex-direction: column;
justify-content: flex-start;
}
i{
font-size: 20px;
color: blue;
display: none;
}
.logo{
display: flex;
flex-direction: row;
justify-content: space-between;
align-items: center;
width: 100%;
padding: 10px 50px;
background-color:#dfe6e9;
backdrop-filter:blur(10px);
}
span {
	color:orange;
}
.logo h1{
cursor:pointer;
color: blue;
transition:0.3s ease;
}
.logo h1:hover{
transform:scale(1.2);

}
.nav{
display: flex;
flex-direction: row;
width:600px;
justify-content: space-between;
font-size: 20px;
}
.nav a{
color:navy;
transition:0.3s ease;
border-bottom: 3px solid transparent; 
}
.nav a:hover {
	border-bottom: 3px solid var(--main-color);
	
}

.data{
display:flex;
justify-content: center;
width: 100%;
min-height:500px; 
padding: 5px 10px;
}
table{
border-collapse: collapse;
width: 80%;
}
.data table,td,th{
border: 1px solid #888;
padding: 5px 10px;
text-align: center;
}
table{
margin-top:40px; 
}
th,td{
padding: 10px 20px;
letter-spacing: 1px;
font-weight: 600;
}
tr:hover{
background-color: #ccc;
}
th{
font-size: 23px;
font-weight: 600;
color: orange;
}

.home a:hover {
	border-bottom:3px solid var(--main-color); 
}
td a{
color: blue;
font-weight: 500;
}
</style>
</head>
<body>
   
      <% List<Books>list=(List<Books>)request.getSession().getAttribute("books");%>
       <% Books books=(Books)request.getSession().getAttribute("book");%>
    <div class="container">
    
        <div class="logo">
          <h1> <span>E-</span>Library Management </h1>
          <i class="fa-solid fa-list"></i>
          <div class="nav">
          <a href="home.jsp">Home</a>
          <a href="addbooks.jsp">Add Books</a>
          
          <a href="history.jsp">History</a>
          <a href="adminlogin.jsp">Logout</a>
           
          </div>
         
          
        </div>
        <div class="data">
         <table>
         <tr>
         <th>s.no</th>
         <th>BookName</th>
         <th>Author Name</th>
         <th>Edit</th>
         <th>Delete</th>
         
         </tr>
          <% if(list!=null){
          for(Books book:list){
          %>
         <tr>
         <td><%=book.getBookid() %></td>
         <td><%=book.getBookName() %></td>
         <td><%=book.getKeyWords() %></td>
         <td><a href="#">Edit</a></td>
         <td><a href="remove?id=<%=book.getBookid() %>">Delete</a></td>
         </tr>
    
         <%}}
          %>
         </table> 
          </div>        
    </div>

</body>
</html>