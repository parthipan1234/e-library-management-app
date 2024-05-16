<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.util.Date"%>
    <%@ page import ="dao.DbManipulation"%>
    <%@ page import ="dto.UserSignUp"%>
    <%@ page import ="java.util.List"%>
    <%@ page import ="java.util.Base64"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>History</title>
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
min-height: 100vh;
width: 100%;
display: flex;
background-color:#dff9fb;
flex-direction: column;
justify-content: flex-start;
}
.data{
display:flex;
justify-content: center;
width: 100%;
 
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
td img{
height: 70px;
width: 70px;
border-radius: 100%; 
}
.container h1{
color: blue;
margin-top: 10px;
text-align: center;
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
</style>
</head>
<body>
<% DbManipulation db=new DbManipulation();%>
<%List<UserSignUp>list=db.getUsers(); %>
  <% Date date=new Date();%>
  <div class=container>
 
   
        <div class="logo">
          <h1> <span>E-</span>Library Management </h1>
          <i class="fa-solid fa-list"></i>
          <div class="nav">
          <a href="adminmain.jsp">Home</a>
          <a href="addbooks.jsp">Add Books</a>
          
          <a href="history.jsp">History</a>
          <a href="adminlogin.jsp">Logout</a>
           
          </div>
          </div>
           <h1> Users</h1>
   <div class="data">
         <table>
         <tr>
         <th>s.no</th>
         <th>User Name</th>
         <th>User Email</th>
         <th>User Password</th>
         <th>User Department</th>
         <th>User Profile</th>
          <th>Last Login</th>
         </tr>
          <% if(list!=null){
        	  int k=0;
          for(UserSignUp user:list){
            
        	  k=k+1;
        	  List<String>time=(List<String>)request.getSession().getAttribute("time");
          %>
         <tr>
         <td><%=k%></td>
         <td><%=user.getUserName() %></td>
         <td><%=user.getUserEmail() %></td>
         <td><%=user.getUserPassword()%></td>
         <td><%=user.getUserDepartment()%></td>
         <td> <img alt="profile" src="data:image/jpeg;base64,<%= new String(Base64.getEncoder().encode(user.getImage())) %>"/></td>
         <td><% if(time!=null){
        	 for(String tim:time){
        		 %><%=tim %>
        	 <%
        	 }
         }%></td>
         </tr>
    
         <%}
          }
          %>
         </table> 
          </div>        
          </div>
  
</body>
</html>