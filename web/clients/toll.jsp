<%-- 
    Document   : toll
    Created on : 4-Sep-2017, 7:14:46 AM
    Author     : El Jefe
--%>

<%@page import="java.util.Date" %>
<%@page import="client.ClientRetrieve"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"> 
<head>
<title>Toll | Chillonline</title>
<link rel="shortcut icon" type="image/png" href="../chilli.png"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="utf-8" /> 
<!-- <link rel="stylesheet" type="text/css" href="boards.css" /> -->
<style type="text/css">
    
    
    @font-face {
    font-family: 'Pacifico'; /*a name to be used later*/
    src: url('Pacifico.ttf'); /*URL to font*/
  }

  header
  {
    background-color: #FFF;
    background: -webkit-gradient(linear, left top, left bottom, from(#000), to(#bababa));
   background: -webkit-linear-gradient(top, #000, #bababa);
   background: -moz-linear-gradient(top, #000, #bababa);
   background: -ms-linear-gradient(top, #000, #bababa);
   background: -o-linear-gradient(top, #000, #bababa);
    margin-left: 0;
    margin-right: 0;
    margin-top: 0;
    height: 50px;
    color: #000;
    box-shadow: 0px 2px 5px #AAA;
    text-indent: 30px;
  }
  
  .head
  {
      width: 90%;
      height: 50px;
      margin-left: auto;
      margin-right: auto;
      margin-top: 0;
  }
  
  body
  {
    margin: 0;
    background-color: #EEE;
    font-family: sans-serif;
  }
  
  nav ul
  {
    list-style-type: none;
    overflow: auto;
    margin-right: 0;
    margin-top: 0;
    margin-bottom: 0;
    margin-left: 0;
  }

  nav ul li
  {
    float: right;
  }

  nav ul li .a:link, nav ul li .a:visited
  {
    display: block;
    background-color: #fff;
    background: -webkit-gradient(linear, left top, left bottom, from(#000), to(#bababa));
    background: -webkit-linear-gradient(top, #000, #bababa);
    background: -moz-linear-gradient(top, #000, #bababa);
    background: -ms-linear-gradient(top, #000, #bababa);
    background: -o-linear-gradient(top, #000, #bababa);
    opacity: 1.0;
    text-align: right;
    padding-top: 18px;
    padding-bottom: 18px;
    padding-left: 20px;
    padding-right: 20px;
    text-decoration: none;
    color: #fff;
    font-family: /*"Josefin Slab", Arial, Helvetica, Pacifico, Rockwell,*/ sans-serif;
    font-size: 12px;
  }

  nav ul li .a:hover, nav ul li .a:active
  {
    color: #e63;
    opacity: 1.0;
  }
  
  .chillonline
  {
      font-family: sans-serif, 'Pacifico';
      font-size: 17px;
      color: #fff;
      text-decoration: none;
      float: left;
  }
      
  .sept
  {
    background-color: #FFF;
    margin-right: 0;
    margin-top: 0;
    margin-left: 500px;
    height: 505px;
    color: #000;
    opacity: 0.7;
    box-shadow: 0px 2px 5px #AAA;
  }
  
  .sept2
  {
    background-color: #c00;
    margin-right: 0;
    margin-top: 0;
    width: 70%;
    height: 200px;
    color: #000;
    float: right;
  }
  
  nav
  
  {
      
    margin-right: 0px;
    float: right;
      
  }
  
  footer
  {
    background-color: #FFF;
    margin-left: 0;
    margin-right: 0;
    margin-bottom: 0;
    height: 300px;
    box-shadow: 0px 2px 5px #AAA;
    opacity: 0.7;
    margin-top: 100px;
    font-size: 12px;
  }
  
  .logos
  {
      background-color: #333;
      margin-left: 10px;
      margin-right: 10px;
      height: 200px;
      box-shadow: 0px 2px 5px #AAA;
      opacity: 0.8;
      margin-top: -500px;
  }
  
  #logos
  {
      height: 50%;
      opacity: 1.0;
  }
  
  .button {
   border-top: 1px solid #d4003c;
   background: #780000;
   background: -webkit-gradient(linear, left top, left bottom, from(#b00000), to(#780000));
   background: -webkit-linear-gradient(top, #b00000, #780000);
   background: -moz-linear-gradient(top, #b00000, #780000);
   background: -ms-linear-gradient(top, #b00000, #780000);
   background: -o-linear-gradient(top, #b00000, #780000);
   padding: 7.5px 25px;
   -webkit-border-radius: 5px;
   -moz-border-radius: 5px;
   border-radius: 5px;
   -webkit-box-shadow: rgba(0,0,0,1) 0 1px 0;
   -moz-box-shadow: rgba(0,0,0,1) 0 1px 0;
   box-shadow: rgba(0,0,0,1) 0 1px 0;
   text-shadow: rgba(0,0,0,.4) 0 1px 0;
   color: white;
   font-size: 17px;
   font-family: 'Lucida Grande', Helvetica, Arial, Sans-Serif;
   text-decoration: none;
   vertical-align: middle;
   }
.button:hover {
   border-top-color: #c90000;
   background: #c90000;
   color: #f2efef;
   }
.button:active {
   border-top-color: #a30a11;
   background: #a30a11;
   }
   
   .button2 {
   border-top: 1px solid #55b506;
   background: #2a4d02;
   background: -webkit-gradient(linear, left top, left bottom, from(#539c00), to(#2a4d02));
   background: -webkit-linear-gradient(top, #539c00, #2a4d02);
   background: -moz-linear-gradient(top, #539c00, #2a4d02);
   background: -ms-linear-gradient(top, #539c00, #2a4d02);
   background: -o-linear-gradient(top, #539c00, #2a4d02);
   padding: 7.5px 25px;
   -webkit-border-radius: 5px;
   -moz-border-radius: 5px;
   border-radius: 5px;
   -webkit-box-shadow: rgba(0,0,0,1) 0 1px 0;
   -moz-box-shadow: rgba(0,0,0,1) 0 1px 0;
   box-shadow: rgba(0,0,0,1) 0 1px 0;
   text-shadow: rgba(0,0,0,.4) 0 1px 0;
   color: white;
   font-size: 13px;
   font-family: Sans-Serif;
   text-decoration: none;
   vertical-align: middle;
   width: 90%;
   margin-right: 5%;
   margin-left: 5%;
   margin-top: 5px;
   }
.button2:hover {
   border-top-color: #2c7d04;
   background: #2c7d04;
   color: #f2efef;
   }
.button2:active {
   border-top-color: #2c3d00;
   background: #2c3d00;
   }
  
  .rimground
  {
    width: 100px;
    height: 150px;
    opacity: 1.0;
    margin-top: 5px;
    margin-bottom: 5px;
    margin-left: 5px;
    margin-right: 5px;
    float: left;
    text-align: center;
    color: #FFF;
    font-family: sans-serif;
    font-size: 10px;
  }
    
  .bol
  {
      float: left;
      margin-top: 10px;
      margin-left: 0px;
      width: 150px;
  }
  
  #container
  {
      background-color: #fff;
      margin-left: auto;
      margin-right: auto;
      margin-top: 0px;
      margin-bottom: 100px;
      width: 90%;
      height: 2600px;
      border-bottom-left-radius: 1px;
      border-bottom-right-radius: 1px;
  }

.moviediv
{
    margin: 25px auto 25px auto;
    height: 300px;
    background-color: #e63;
}

.seriediv
{
    margin: 25px auto 25px auto;
    height: 300px;
    background-color: #e63;
}

.grey
{
    margin: 25px auto 25px auto;
    height: 50px;
    background-color: #eee;
}

.musicdiv
{
    margin: 25px auto 25px auto;
    height: 300px;
    background-color: #e63;
}

.gamediv
{
    margin: 25px auto 25px auto;
    height: 300px;
    background-color: #e63;
}

  .divers
  {
      margin-left: 0;
      margin-right: 0;
      margin-top: 0;
      height: 500px;
  }
  
  .right
  {
      margin-left: 0;
      margin-top: 0px;
      height: 200px;
      width: 30%;
      background-color: #e63;
      float: left;
  }
  
  .createaccount
  {
      color: #FFF;
      width: 400px;
      margin-left: auto;
      margin-right: auto;
      text-align: center;
  }
  
  .titles
  {
      width: 410px;
      height: 300px;
      margin-top: 20px;
      margin-left: 65px;
  }
  
  .names
  {
    width: 700px;
    height: 30px;
    padding: 4px;
    margin: 5px 10px 5px auto;
    border-radius: 1px;
    font-size: 15px;
    border: none;
  }
  
  .boxes
  {
      width: 200px;
      height: 300px;
      margin-top: 20px;
      margin-left: 20px;
      background-color: #e45;
  }

.copyright
{
    margin-left: auto;
    margin-right: auto;
    text-align: center;
    width: 1000px;
}

.click-agreement
{
    color: #fff;
    font-size: 9px;
}

.disclaimer
{
    margin-left: auto;
    margin-right: auto;
    text-align: center;
    width: 1000px;
    font-size: 7px;
    text-decoration: none;
}

.footnotes
{
    float: left;
    font-size: 12px;
    height: 230px;
    width: 200px;
    text-align: left;
}

.notes
{
    text-decoration: none;
    color: #000;
}

.notes:hover
{
    color: #e63;
}
  
  #epic
  {
      margin-left: 0px;
  }
  
.board
{
    background-color: #f50;
    width: 350px;
    height: 350px;
    box-shadow: 0 2px 5px #AAA;
    float: left;
    margin-left: 20px;
    margin-top: 20px;
}

.board h3
{
    margin-left: auto;
    margin-right: auto;
    text-decoration: none;
    color: #fff;
}

.headtext
  {
      font-size: 25px;
      margin-top: 50px;
      margin-left: auto;
      margin-right: auto;
      margin-bottom: 0px;
      width: 790px;
  }
  
  .myboard
  {
      background-color: #fff;
      color: #aaa;
      font-size: 20px;
      margin-top: 30px;
      margin-left: auto;
      margin-right: auto;
      margin-bottom: 0px;
      width: 90%;
      height: 50px;
  }
  
  .whitentext
  {
      color: #FFF;
      font-size: 12px;
  }
  
  .board-add
  {
      width: 6%;
      height: 20px;
      float: left;
      font-size: 15px;
      padding-top: 15px;
      padding-left: 2%;
      padding-right: 2%;
      padding-bottom: 15px;
  }
  
  .board-type
  {
      width: 86%;
      height: 30px;
      float: left;
      font-size: 25px;
      padding-top: 10px;
      padding-left: 2%;
      padding-right: 2%;
      padding-bottom: 10px;
  }
  
  .board-info
  {
      width: 92%;
      height: 150px;
      padding-top: 10px;
      padding-left: 4%;
      padding-right: 4%;
      padding-bottom: 10px;
  }
  
  .board-pic
  {
      background-image: url(../image5.jpg);
      background-size: cover;
      width: 350px;
      height: 200px;
  }

  #my-account
  {
      display: none;
      overflow: no-content;
      position: fixed;
      width: 190px;
      height: 250px;
      background-color: #FFF;
      border: 2px solid #f00;
      box-shadow: 0 1px 4px #333;
  }
  
  nav ul li .a:hover ~#my-account
  {
      display: block;
  }
  
  #my-account:hover
  {
      display: block;
  }
  
  .action-container
  {
      width: 160px;
      height: 35px;
      background-color: #f40;
      padding-top: 15px;
      padding-left: 15px;
      padding-right: 15px;
      float: right;
  }
  
  .action
  {
      color: #fff;
      font-size: 13px;
      text-decoration: none;
  }
  
  .subheader
  {
      margin-top: 0;
      height: 34px;
      margin-left: 0;
      margin-right: 0;
      background-color: #f50;
  }
  
  .flexsearch--wrapper {
	height: auto;
	width: auto;
	max-width: 100%;
	overflow: hidden;
	background: transparent;
	margin: 0;
	position: static;
}
	
.flexsearch--form {
	overflow: hidden;
	position: relative;
}
	
.flexsearch--input-wrapper {
	padding: 0 66px 0 0; /* Right padding for submit button width */
	overflow: hidden;
}
.flexsearch--input {
  width: 100%;
}
/***********************
 * Configurable Styles *
 ***********************/
.flexsearch {
  margin: 0 0px 0 10px; /* Padding for other horizontal elements */
  width: 70%;
  float: left;
}
.flexsearch--input {
  -webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
 	height: 30px;
  padding: 0 46px 0 10px;
	border-color: #f50;
  border-radius: 25px; /* (height/2) + border-width */
  border-style: solid;
	border-width: 2px;
  margin-top: 0px;
  color: #333;
  font-family: 'Helvetica', sans-serif;
	font-size: 16px;
	-webkit-appearance: none;
	-moz-appearance: none;
}
	
.flexsearch--submit {
  position: absolute;
	right: 0;
	top: 0;
	display: block;
	width: 40px;
	height: 40px;
  padding: 0;
  border: none;
	margin-top: 5px; /* margin-top + border-width */
  margin-right: 5px; /* border-width */
	background: transparent;
  color: #888;
  font-family: 'Helvetica', sans-serif;
  font-size: 40px;
  line-height: 30px;
}
.flexsearch--input:focus {
  outline: none;
  border-color: #333;
}
.flexsearch--input:focus.flexsearch--submit {
 	color: #333; 
}
.flexsearch--submit:hover {
  color: #333;
  cursor: pointer;
}
::-webkit-input-placeholder {
	color: #888;  
}
  .search-button
  {
      height: 30px;
      margin-top: 2px;
      border-bottom-right-radius: 15px;
      border-top-right-radius: 15px;
      border-top: 1px solid #55b506;
   background: #2a4d02;
   background: -webkit-gradient(linear, left top, left bottom, from(#539c00), to(#2a4d02));
   background: -webkit-linear-gradient(top, #539c00, #2a4d02);
   background: -moz-linear-gradient(top, #539c00, #2a4d02);
   background: -ms-linear-gradient(top, #539c00, #2a4d02);
   background: -o-linear-gradient(top, #539c00, #2a4d02);
   -webkit-box-shadow: rgba(0,0,0,1) 0 1px 0;
   -moz-box-shadow: rgba(0,0,0,1) 0 1px 0;
   box-shadow: rgba(0,0,0,1) 0 1px 0;
   text-shadow: rgba(0,0,0,.4) 0 1px 0;
   color: white;
   font-size: 12px;
   font-family: Sans-Serif;
   text-decoration: none;
   vertical-align: middle;
  }
  
  .search-dept
  {
      height: 30px;
      margin-top: 2px;
  }
  
  .skew
  {
      height: 40px;
      width: 70%;
      margin-left: auto;
      margin-right: auto;
  }

  #add-board-button
  {
      margin-top: -15px;
  }
  
  .class-area
  {
      width: 96%;
      height: 2500px;
      background-color: #f3f3f3;
      padding-top: 20px;
      margin-left: auto;
      margin-right: auto;
      border-bottom-left-radius: 1px;
      border-bottom-right-radius: 1px;
  }
  
  .board-class
  {
      width: 18%;
      height: 300px;
      background-color: #fff;
      margin-top: 20px;
      margin-left: 1.6%;
      margin-right: 0%;
      border-radius: 10px;
      float: left;
  }
  
  .board-headings
  {
      width: 100%;
      height: 120px;
      background-color: #f50;
      text-align: center;
      color: #FFF;
  }
  
  .benefits
  {
      font-size: 12px;
  }
  
  .form-place
  {
      width: 80%;
      height: 1700px;
      margin-top: 350px;
      margin-left: 10%;
      margin-right: 10%;
  }
  
  #logout-button-form
  {
      display: none;
  }
  

  
</style>

<script type="text/javascript">
  

    function submitLogoutForm()
        
    {
        document.forms["logout-button-form"].submit(); 
    }

  
</script>

</head>

<body>
    
    
    
    <%
        
        if (session.getAttribute("account-number") == null)
        
        {
            response.sendRedirect("../signin.jsp");
        }
        
        long accountNumber = Long.parseLong((String) session.getAttribute("account-number"));
        
        
        %>
        
        
        
        <form name="logout-button-form" id="logout-button-form" action="../Logout">
            
            <button>Logout</button>
            
        </form>
        
  
  <header>
      
    
      <div class="head">
        
          <a href=""><img class="bol" src="../chillon.png" alt="bol"></a>
        
            <nav>
                
                <ul>
                    <li>
                        
                        <a class="a" href="">My Account</a>
                        
                        <div id="my-account">

                            <div class="action-container"><a class="action" href="../carriers/terminal.jsp">My Channels</a></div>
                            <div class="action-container"><a class="action" href="../distributors/uploads.jsp">My Distributions</a></div>
                            <div class="action-container"><a class="action" href="account-home.jsp">My Account Settings</a></div>
                            <div class="action-container"><a class="action" href="account-billing.jsp">My Account Billing</a></div>
                            <div class="action-container"><a class="action" href="javascript: submitLogoutForm()">Log Out</a></div>

                        </div>
                    
                    </li>    
                    <li><a class="a" href="../clients/job-boards.jsp" >Job Boards</a></li>
                    <li><a class="a" href="../clients/course-boards.jsp" >Course Boards</a></li>
                    <li><a class="a" href="../clients/leisure-boards.jsp">Leisure Boards</a></li>
                    <li><a class="a" href="../clients/home.jsp" >Home</a></li>
                </ul>
                    
            </nav>
        
      </div>
      
    
  </header>
    
        
        <script type="text/javascript"></script>
        
        <div class="headtext"><p>Create a board to work and stream with your fellow course members.</p></div>
    
        <div class="myboard"><div class="board-type">Boarding class options &gt; &gt; </div></div>
                
        <div id="container">
                    
            <div class="class-area">
                
                <div class="board-class">
                    <div class="board-headings"><br><h3>Class 1</h3>
                        <span class="board-price">FREE</span></div>
                    <div class="benefits">
                    <span><i class="material-icons" style="font-size:28px;color:green">done</i>Work and friend connections</span><br>
                    <span><i class="material-icons" style="font-size:28px;color:green">done</i>PDF posts and chat messaging</span><br>
                    <span><i class="material-icons" style="font-size:28px;color:green">done</i>Unlimited multimedia streaming</span><br>
                    <span><i class="material-icons" style="font-size:28px;color:green">done</i>Up to 10 members per board</span><br>
                    </div>
                    
                </div>
                
                <div class="board-class">
                    <div class="board-headings"><br><h3>Class 2</h3>
                        <span class="board-price">USD$9.99 per month</span></div>
                    <div class="benefits">
                    <span><i class="material-icons" style="font-size:28px;color:green">done</i>Work and friend connections</span><br>
                    <span><i class="material-icons" style="font-size:28px;color:green">done</i>PDF posts and chat messaging</span><br>
                    <span><i class="material-icons" style="font-size:28px;color:green">done</i>Unlimited multimedia streaming</span><br>
                    <span><i class="material-icons" style="font-size:28px;color:green">done</i>Up to 60 members per board</span><br>
                    </div>
                    
                </div>
                <div class="board-class">
                    <div class="board-headings"><br><h3>Class 3</h3>
                        <span class="board-price">USD$14.99 per month</span></div>
                    <div class="benefits">
                    <span><i class="material-icons" style="font-size:28px;color:green">done</i>Work and friend connections</span><br>
                    <span><i class="material-icons" style="font-size:28px;color:green">done</i>PDF posts and chat messaging</span><br>
                    <span><i class="material-icons" style="font-size:28px;color:green">done</i>Unlimited multimedia streaming</span><br>
                    <span><i class="material-icons" style="font-size:28px;color:green">done</i>Up to 200 members per board</span><br>
                    </div>
                    
                </div>
                <div class="board-class">
                    <div class="board-headings"><br><h3>Class 4</h3>
                        <span class="board-price">USD$24.99 per month</span></div>
                    <div class="benefits">
                    <span><i class="material-icons" style="font-size:28px;color:green">done</i>Work and friend connections</span><br>
                    <span><i class="material-icons" style="font-size:28px;color:green">done</i>PDF posts and chat messaging</span><br>
                    <span><i class="material-icons" style="font-size:28px;color:green">done</i>Unlimited multimedia streaming</span><br>
                    <span><i class="material-icons" style="font-size:28px;color:green">done</i>Up to 1000 members per board</span><br>
                    </div>
                    
                </div>
                
                <div class="board-class">
                    <div class="board-headings"><br><h3>Class 5</h3>
                        <span class="board-price">USD$49.99 per month</span></div>
                    <div class="benefits">
                    <span><i class="material-icons" style="font-size:28px;color:green">done</i>Work and friend connections</span><br>
                    <span><i class="material-icons" style="font-size:28px;color:green">done</i>PDF posts and chat messaging</span><br>
                    <span><i class="material-icons" style="font-size:28px;color:green">done</i>Unlimited multimedia streaming</span><br>
                    <span><i class="material-icons" style="font-size:28px;color:green">done</i>Unlimited members per board</span><br>
                    </div>
                    
                </div>
                
                <div class="form-place">
                    
                    <form method="post" enctype="multipart/form-data" action="../BoardUpload">
                        
                        <br><br>
                    
                    <input hidden type="text" id="account-number" name="account-number" value="<%= accountNumber %>">
                    
                    
                    
                <div><h3>Enter your board's name or title.</h3></div>
                <div>Board Name*: <br><input required type="text" class="names" id="board_title" name="board-name" placeholder="Board name"></div><br>
                
                <div><h3>Please select the purpose that best describes your board's intended content*.</h3></div>
                <input required type="radio" id="leisure" name="purpose" value="leisure"/> &nbsp; &nbsp; 
                <label for='leisure'>Leisure &nbsp; &nbsp; </label><br><br>
                <input required type="radio" id="course" name="purpose" value="course"/> &nbsp; &nbsp; 
                <label for='course'>Course &nbsp; &nbsp; </label><br><br>
                 <input required type="radio" id="job" name="purpose" value="job"/> &nbsp; &nbsp; 
                 <label for='job'>Job &nbsp; &nbsp; &nbsp; &nbsp; </label><br><br>
                
                <div><h3>Enter the board disclaimer information below.</h3></div>
                <div>*This board is for 
                    <input required type="text" class="names" id="member-type" name="member-type" placeholder="member type (e.g. members, students, attendees, employees)"> of 
                    <input required type="text" class="names" id="team-name" name="team-name" placeholder="team name">
                </div><br>
                
                <div><h3>Enter the team's affiliate or parent organization (if applicable).</h3></div>
                <div>Organization Name*: <br><input type="text" class="names" id="organization-name" name="organization-name" placeholder="Organization name">
                </div><br>
                
                <div><h3>Choose a logo for your team or organization (if applicable).</h3></div>
                <div><input type="file" id="board_logo" name="board-logo" accept="image/gif,image/jpg,image/jpeg,image/png"><label>(.jpg, .jpeg, .png, .gif)</label></div><br>
                
                <div><h3>Enter the board's city of operation.</h3></div>
                <div>Board City*: <br><input required type="text" class="names" id="board_city" name="board-city" placeholder="City"></div><br>
                
                <div><h3>Enter the board's state or province of operation.</h3></div>
                <div>Board State or Province*: <br><input required type="text" class="names" id="board_province" name="board-province" placeholder="State or province"></div><br>
                
                <div><h3>Enter the board's country of operation.</h3></div>
                <div>Board Country*: <br><input required type="text" class="names" id="board_country" name="board-country" placeholder="Country"></div><br>
                
                
                <div><h3>Choose a banner for your board (if applicable).</h3></div>
                <div><input type="file" id="board_poster" name="board-poster" accept="image/gif,image/jpg,image/jpeg,image/png"><label>(.jpg, .jpeg, .png, .gif)</label></div><br>
                
                <div><h3>Select the board class that best fits your organization or group size.</h3></div>
                    
                <input required type="radio" id="class1" name="class" value="1"> &nbsp; &nbsp; <label for='class1'>Class 1 (maximum 10 members) &nbsp; &nbsp; &nbsp; &nbsp; </label><br><br>
                <input required type="radio" id="class2" name="class" value="2"> &nbsp; &nbsp; <label for='class2'>Class 2 (maximum 60 members) &nbsp; &nbsp; &nbsp; </label><br><br>
                <input required type="radio" id="class3" name="class" value="3"> &nbsp; &nbsp; <label for='class3'>Class 3 (maximum 200 members) &nbsp; &nbsp; </label><br><br>
                <input required type="radio" id="class4" name="class" value="4"> &nbsp; &nbsp; <label for='class4'>Class 4 (maximum 1000 members) &nbsp; </label><br><br>
                <input required type="radio" id="class5" name="class" value="5"> &nbsp; &nbsp; <label for='class5'>Class 5 (unlimited members) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </label>
                
                <br><br><br>
                <div><h3>What is the purpose of this board?</h3></div>
                <div>Board Description*:<br><br> <textarea required rows="10" cols="105" id="movie_description" style="font-family:sans-serif;" name="description" placeholder="Please write a short description."></textarea></div><br>
                
                <div><h3>Select your board's publicity level.</h3></div>
                    
                    
                <input required type="radio" id="private" name="mode" value="private"/> &nbsp; &nbsp; 
                <label for='private'>Private &nbsp; &nbsp; (only you can see your board, and whomever you invite) </label><br><br>
                 <!--   Community <input required type="radio" id="gender" name="mode" value="community"><br><br> -->
                 <input required type="radio" id="public" name="mode" value="public"/> &nbsp; &nbsp; 
                 <label for='public'>Public &nbsp; &nbsp; &nbsp; (anyone on the site can see, search for, and enter your board) &nbsp; </label><br><br><br><br>
                    
                    
                <div class=""><br><button class="button2">Create</button></div>
                
                </form>
                    
               </div>
                
                
                
            </div>
            
        </div>

  

</body>
</html>

