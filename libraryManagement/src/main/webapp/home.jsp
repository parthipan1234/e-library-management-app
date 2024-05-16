<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
<style>
body {
	height: 70vh;
	width: 97%;
	font-family: Roboto;
    background-color:#c7ecee;
}
.admin{
width:140px;
}
.main-div {
	
	display: flex;
	flex-direction: row;
	justify-content:right;
	align-items:center;

	padding: 5px 20px;
	gap:40px;
	font-size: 22px;
}
.main-div a{
background-color:darkgreen ;
color:white;
padding: 6px 12px; 
border :none;
text-decoration: none;
border-radius: 4px;
}
.main-div a:hover{
background-color:green; 
}
.head{
text-align: center;
color:#0c2461;
text-decoration: underline 1px wavy #fff; 
font-size: 40px;
margin-right:200px;
width: 350px;
transition:0.3s ease; 
}
.head:hover{
transform:scale(1.2);
}
.head:first-letter {
	font-size: 80px;
	color: red;
	text-decoration: none;
}
.content{
text-align:justify;
padding:1px 40px; 
font-size: large;
word-spacing:15px;
letter-spacing:2px;
color: #0c2461;  
}
.image{
display: flex;
align-items: center;
justify-content: center;
gap:20px;
}
img{
height:300px;
width:300px;
border-radius: 5px;
box-shadow: 3px 5px 15px  15px green;
transition:0.3s ease; 
}
img:hover{
transform:scale(1.1);
}
</style>
</head>
<body>

	<div class="main-div">
	<div class="head">E - Library Management</div>
        <a href="home.jsp">Home</a>
		<a href="login.jsp">UserLogin</a>
		<a href="signup.jsp">SignUp</a>
		<a class="admin" href="adminlogin.jsp">Admin Login</a>		 
		<a href="about.jsp">About</a>
	</div>
	<div class="content">
	<p>
	 An E-Library Management System is a software application that helps in managing the operations of a library, such as adding book information, displaying book information, listing all books of a given author, and counting the number of books in the library. The system allows users to input, store, and retrieve information about books and authors in an electronic format, making it easier to access and manage the library's resources. The system can be implemented using various programming languages, including C++, C, Java, and Python.</p>
	</div>
	<div class="image">
	<img alt="blog" src="data:image/jpeg;base64,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">
	</div>
</body>
</html>