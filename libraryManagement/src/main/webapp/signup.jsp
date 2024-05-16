<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">

<style type="text/css">
*{
padding: 0;
margin: 0;
font-family:Roboto;
}

.headings{
color: #130f40;
width: 50%;
}
.container{
height: 100vh;
width: 100%;
gap:10px;
background-color:#dff9fb;
display:flex;

flex-direction: column;
justify-content:space-around;
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

}
.droped{
text-align: right;

}
.label-form{
font-size: 17px;
margin-top: 5px ;
marin-left:30px;
padding-left: 30px;
color: #535c68;
}
input,select{
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
.terms .term{
text-align:center; 
font-size:17px;  
margin-bottom:10px; 
 }
.terms p+p{
font-size:17px; 
}
.copy{
background-color:#130f40;
color: #fff;
text-align: center;
word-spacing:10px;
border-radius: 8px;   
width: 52.5%;
}
.copy a{
color: #fff;
margin:5px 0px; 
}
a{
color:blue;
}
.btn:hover{
 background-color:#130f40;
}
</style>
</head>
<body>
     <div class="container">
     <div class="headings">
	<h1>Create Your Account</h1>
	<p>Please provide your credentials below.</p>
	</div>
      <form action="signup" class="signup-form" method="post" enctype="multipart/form-data">
          <label class="label-form" for="username">Name</label>
          <input type="text" name="username" id="username" placeholder="User Name">
          
          <label class="label-form" for="email">Email</label>
          <input type="email" name="email" id="email" placeholder="User Email">
          
          <label class="label-form" for="password">Password</label>
          <input type="password" name="password" id="password" placeholder="password">
           
          <select >
		<option>Password Requirements </option>
		<option disabled="disabled">&#8709; At least 8 characters long</option>
		<option disabled="disabled">&#8709; At least 1 lowercase letter</option>
		<option disabled="disabled">&#8709; At least 1 capital letter</option>
		<option disabled="disabled">&#8709; At least 1 non-alphabetical character</option>
		</select>
          
          <label for="drop" class="droped">Show Password	<input type="checkbox"  id="drop" onclick="myFunction()" ></label>
          
          <label class="label-form" for="dept">Department</label>
          <select id="dept" name="userdept">
           <option value="BCA">BCA</option>
           <option value="BSC CS">BSc CS</option>
           <option value="BBA">BBA</option>
           <option value="MBA">MBA</option>
           <option value="MCA">MCA</option>
           <option value="MSC">MSc</option>
           <option value="BCom">BCom</option>
           <option value="MCOM">MCom</option>
           <option value="BSc Cemistry">BSc Chemistry</option>
           <option value="BE CSE">BE CSE</option>
           <option value="BTech">BTech</option>
           <option value="ME CS">ME CS</option>
           <option value="BE Mtech">BE Mech</option>
           <option value="BA Tamil">BA Tamil</option>
           <option value="BA English">BA English</option>
           <option value="BA History">BA History</option>
           <option value="BABL">BABL</option>
           <option value="Bsc Physics">BSc Physics</option>
           <option value="BSc Maths">BSc Maths</option>
           <option value="ECE">ECE</option>
           <option value="EEE">EEE</option>
          </select>
          
          <label class="label-form" for="image">Profile</label>
          <input type="file" name="image" id="image" placeholder="User Name">
          
          <button class="btn" type="submit">SignUp</button>
      </form>
      <div class="terms">
	<p class="term">Already have an account? <a href="login.jsp">Login</a></p>
	<p>This site is protected by reCAPTCHA and the google <a href="#">Privacy Policy </a> and <a href="#">Terms Of Service</a> apply</p>
	</div>
	<div class="copy">
	<p>Important Information</p>
	<a href="#">Cookie Policy.</a><span>|</span> <a href="#">Privacy Policy.</a>
	<p>&#169; 2024-Till Now.     </p>
	</div>
     </div>
</body>
<script type="text/javascript">

function myFunction() {
	  var x = document.getElementById("password");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	}


</script>
</html>