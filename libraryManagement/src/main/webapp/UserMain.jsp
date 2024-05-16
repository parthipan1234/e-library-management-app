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
color: #636e72;
transition:0.3s ease;
border-bottom: 3px solid transparent; 
}
.nav a:checked{
border-bottom: 3px solid var(--main-color);
}
.nav a:hover {
	border-bottom: 3px solid var(--main-color);
	
}

.profile img{
height: 70px;
width: 70px;
border-radius: 100%;
border: 3px solid blue;
padding: 2px;
background-color: #fff;
}
.data{
margin:20px;
display: grid;
grid-template-columns:repeat(4,1fr);
gap:30px;
padding:0px  10px;
}
.data .data1{
padding-top: 20px;
width: 300px;
height: 300px;
margin-top: 30px;
border: 1px solid #888;
background-color:#fff ;
box-shadow: 0 0 25px blue;
border-radius: 8px;
display:flex;
align-items:center;
flex-direction:column;
justify-content:space-between;
cursor:pointer;
transition:0.3s ease-in-out;
}
.data .data1:hover{
transform:scale(1.1);
}
.data .data1 img{
width: 150px;
height: 150px;
border-top-left-radius:9px;
border-top-right-radius:9px;
border-bottom-left-radius:none;
border-bottom-right-radius:none;
margin: 2px auto;
}
.data .data1 .buto{
width: 93%;
padding: 5px 10px;
border-radius: 7px;
cursor:pointer;
font-size: 19px;
color: white;
background-color:blue;
border: none;
margin: 5px 10px;
box-shadow: 3px 10px 16px black;
}
.data .data1 h2{
color: orange;
margin: 5px 10px;
text-align: center;

}
.data .data1 h2+h2{
    font-size:15px;
    color: #888; 
}
.home a{
color: blue;
transition:0.3s ease;
font-weight: 600;
}
.home a:hover {
	border-bottom:3px solid var(--main-color); 
}
.show{
border: 1px solid #fff;
border-radius: 100%;
padding: 5px;
width: 30px;
height: 20px;
background-color: #fff;
}
.buto{
text-align: center;
}
.data1 a{
color:red;
}
</style>
</head>
<body>
     <% List<Books> boo=(List<Books>)request.getSession().getAttribute("addbook");%>
    <% UserSignUp user=(UserSignUp)request.getSession().getAttribute("user");%>
      <% List<Books>list=(List<Books>)request.getSession().getAttribute("books");%>
      <% List<String> time=(List<String>)request.getSession().getAttribute("time");
          Date date=new Date();
        time.add(date.getHours()+": "+date.getMinutes()+": "+date.getSeconds());
        request.getSession().setAttribute("time", time);
      %>
    <div class="container">
        <div class="logo">
          <h1> <span>E-</span>Library Management </h1>
          <i class="fa-solid fa-list"></i>
          <div class="nav">
          <a href="home.jsp">Home</a>
          <a href="showcart.jsp">Show Carts <span class="show"><% if(boo!=null){%><%=boo.size() %><% }%></span> </a>
          <a href="about.jsp">Developer-Profile</a>
          <a href="login.jsp">Logout</a>
           
          </div>
         
          <div class="home">
          <div class="profile" >
           <img alt="profile" src="data:image/jpeg;base64,<%= new String(Base64.getEncoder().encode(user.getImage())) %>"/>
         
          </div>
         <a href="editprofile.jsp">Edit Profile</a>
           </div>
        </div>
        <div class="data">
          <% if(list!=null){
          for(Books book:list){
          %>
         
         <div class="data1">
            <img alt="profile" src="data:image/jpeg;base64,<%= new String(Base64.getEncoder().encode(book.getBookFile())) %>"/>
             <h2><%=book.getBookName() %></h2>
             <h2>Author : <%= book.getKeyWords() %></h2>
              <a href="buy"><%=book.getBookid()+1 %>$ Buy</a>
           <a href="addtocart?id=<%= book.getBookid() %>"class="buto" onclick="count()">Add to cart</a>
         </div>
        
         <%}} %> 
          </div>        
    </div>
     <script type="text/javascript">
     let sp=document.querySelector(".show");
     let buto=document.querySelector(".buto");
     let k=0;
     function count(){
     k=k+1;
     buto.setAttribute("disabled","disabled");
     sp.textContent=k;
     }
     </script>
</body>
</html>