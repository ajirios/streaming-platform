<%-- 
    Document   : course-boards
    Created on : 14-Oct-2017, 12:17:39 PM
    Author     : El Jefe
--%>

<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="log.*" %>
<%@page import="client.ClientRetrieve"%>
<%@page import="account.boards.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"> 
<head>
<title>Course Boards | Chillonline</title>
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
    background-color: #f7f7f7;
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
   padding-top: 3px;
   padding-bottom: 3px;
   -webkit-border-radius: 15px;
   -moz-border-radius: 15px;
   border-radius: 15px;
   -webkit-box-shadow: rgba(0,0,0,1) 0 1px 0;
   -moz-box-shadow: rgba(0,0,0,1) 0 1px 0;
   box-shadow: rgba(0,0,0,1) 0 1px 0;
   text-shadow: rgba(0,0,0,.4) 0 1px 0;
   color: white;
   font-size: 10px;
   font-family: Sans-Serif;
   text-decoration: none;
   text-align: center;
   vertical-align: middle;
   margin-right: 0px;
   margin-top: 5px;
   width: 150px;
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
  
  .chillonline
  {
      font-family: sans-serif, 'Pacifico';
      font-size: 12px;
      color: #fff;
      text-decoration: none;
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
  
  #my-boards-container
  {
      background-color: #fff;
      margin-left: auto;
      margin-right: auto;
      margin-top: 0px;
      margin-bottom: 100px;
      width: 1140px;
      height: 1200px;
      box-shadow: 0 -1px 0px #AAA;
  }
  
  #invitations-container
  {
      background-color: #fff;
      margin-left: auto;
      margin-right: auto;
      margin-top: 0px;
      margin-bottom: 100px;
      width: 1140px;
      height: 1200px;
      box-shadow: 0 -1px 0px #AAA;
  }
  
  #searches-container
  {
      background-color: #fff;
      margin-left: auto;
      margin-right: auto;
      margin-top: 0px;
      margin-bottom: 100px;
      width: 1140px;
      height: 1200px;
      box-shadow: 0 -1px 0px #AAA;
  }
  
  #popular-boards-container
  {
      background-color: #fff;
      margin-left: auto;
      margin-right: auto;
      margin-top: 0px;
      margin-bottom: 100px;
      width: 1140px;
      height: 1200px;
      box-shadow: 0 -1px 0px #AAA;
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
    width: 300px;
    height: 30px;
    padding: 4px;
    margin: 5px 100px 5px auto;
    border-radius: 10px;
    font-size: 15px;
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
    margin-top: 10px;
    margin-bottom: 10px;
    margin-left: auto;
    margin-right: auto;
    text-decoration: none;
    color: #fff;
}

.board h6
{
    margin-top: 0px;
    margin-bottom: 7px;
    margin-left: auto;
    margin-right: auto;
    text-decoration: none;
    color: #fff;
}

.board span
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
      width: 1000px;
  }

.headtext p
  {
      text-align: center;
      color: #aaa;
  }
  
  .myboard
  {
      background-color: #fff;
      color: #aaa;
      font-size: 20px;
      box-shadow: 0 1px 0px #AAA;
      margin-top: 30px;
      margin-left: auto;
      margin-right: auto;
      margin-bottom: 0px;
      width: 1140px;
      height: 50px;
  }
  
  #myinvitationsboard
  {
      background-color: #fff;
      color: #aaa;
      font-size: 20px;
      box-shadow: 0 1px 0px #AAA;
      margin-top: 30px;
      margin-left: auto;
      margin-right: auto;
      margin-bottom: 0px;
      width: 1140px;
      height: 50px;
  }
  
  #mysearchesboard
  {
      background-color: #fff;
      color: #aaa;
      font-size: 20px;
      box-shadow: 0 1px 0px #AAA;
      margin-top: 30px;
      margin-left: auto;
      margin-right: auto;
      margin-bottom: 0px;
      width: 1140px;
      height: 50px;
  }
  
  .whitentext
  {
      color: #FFF;
      font-size: 12px;
  }
  
  .board-add
  {
      width: 18%;
      height: 20px;
      float: left;
      font-size: 15px;
      padding-top: 15px;
      padding-left: 2%;
      padding-right: 0%;
      padding-bottom: 15px;
  }
  
  .board-type
  {
      width: 76%;
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
      padding-top: 5px;
      padding-left: 4%;
      padding-right: 4%;
      padding-bottom: 5px;
  }
  
  .board-pic
  {
      background-image: url(../image1.jpg);
      background-size: cover;
      width: 350px;
      height: 200px;
  }
  
  #board-pic
  {
      background-image: url(../image1.jpg);
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
  width: 46%;
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
      width: 960px;
      margin-left: auto;
      margin-right: auto;
  }

  #add-board-button
  {
      margin-top: -15px;
  }
  
  #logout-button-form
  {
      display: none;
  }
  
  #create-text-div
  {
      width: 130px;
      height: 15px;
      padding-top: 2px;
      padding-bottom: 20px;
      text-decoration: none;
      font-size: 15px;
      color: #f40;
      float: left;
  }
  
  #create-icon-div
  {
      width: 55px;
      height: 50px;
      text-decoration: none;
      float: left;
  }
  
  #create-div
  {
      width: 185px;
      height: 50px;
      float: right;
  }
  
  .board-info h3
  {
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
  }
  
  .board-info h6
  {
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
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
        
        
        
        %>
        
        
        
        <%
            
            String searchName = null;
            long sessionAccountNumber = -1;
            ClientRetrieve sessionClient = null;
            
            sessionAccountNumber = Long.parseLong((String) session.getAttribute("account-number"));
            
            
            if (sessionAccountNumber != -1)
                
            {
                sessionClient = new ClientRetrieve(sessionAccountNumber);
                
                if (request.getParameter("search-name") != null)
                    
                {
                    searchName = request.getParameter("search-name");
                }
                
            }
            
            

        
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
                    <!--
                    <li><a class="a" href="../clients/giveaways.jsp" >Store Giveaways</a></li>
                    <li><a class="a" href="../clients/store.jsp" >Store</a></li>
                    <li><a class="a" href="../clients/packages.jsp" >Packages</a></li>
                    -->
                    <li><a class="a" href="../clients/job-boards.jsp" >Job Boards</a></li>
                    <li><a class="a" href="../clients/course-boards.jsp" >Course Boards</a></li>
                    <li><a class="a" href="../clients/leisure-boards.jsp">Leisure Boards</a></li>
                    <li><a class="a" href="../clients/home.jsp" >Home</a></li>
                </ul>
                    
            </nav>
        
      </div>
      
      <div class="subheader">
          
          <div class="skew">
              
          <form class="flexsearch--form" method="post" action="boards.jsp">
          <div class="flexsearch">
		<div class="flexsearch--wrapper">
			
				<div class="flexsearch--input-wrapper">
					<input class="flexsearch--input" type="search" name="search-name" placeholder="Search board name by field">
				</div>
			
			
		</div>
              </div>
              
              
              <select name="field" class="search-dept">
                <option value="">Custom</option>
                <option value="Aboriginal Business Studies">Aboriginal Business Studies</option>
                <option value="Aboriginal Governance">Aboriginal Governance</option>
                <option value="Accounting">Accounting</option>
                <option value="Actuarial Mathematics - Business">Actuarial Mathematics - Business</option>
                <option value="Actuarial Mathematics - Science">Actuarial Mathematics - Science</option>
                <option value="Agribusiness">Agribusiness</option>
                <option value="Agriculture">Agriculture </option>
                <option value="Agriculture Diploma">Agriculture Diploma</option>
                <option value="Agroecology">Agroecology</option>
                <option value="Agronomy">Agronomy</option>
                <option value="American Sign Language/English Interpretation">American Sign Language/English Interpretation</option>
                <option value="Animal Systems">Animal Systems</option>
                <option value="Anthropology">Anthropology</option>
                <option value="Applied Mathematics">Applied Mathematics</option>
                <option value="Architecture">Architecture (Masters)</option>
                <option value="Art">Art </option>
                <option value="Art History">Art History</option>
                <option value="Asian Studies">Asian Studies</option>
                <option value="Astronomy">Astronomy</option>
                <option value="Athletic Therapy">Athletic Therapy</option>
                <option value="Biochemistry">Biochemistry</option>
                <option value="Biological Sciences">Biological Sciences</option>
                <option value="Biosystems Engineering">Biosystems Engineering</option>
                <option value="Biotechnology">Biotechnology</option>
                <option value="Business">Business</option>
                <option value="Canadian Studies">Canadian Studies</option>
                <option value="Catholic Studies">Catholic Studies</option>
                <option value="Central and East European Studies">Central &amp; East European Studies</option>
                <option value="Ceramics">Ceramics</option>
                <option value="Chemistry">Chemistry</option>
                <option value="City Planning">City Planning (Masters)</option>
                <option value="Civil Engineering">Civil Engineering</option>
                <option value="Classical Studies">Classical Studies</option>
                <option value="Classics">Classics</option>
                <option value="Commerce">Commerce</option>
                <option value="Computer Engineering">Computer Engineering</option>
                <option value="Computer Science">Computer Science</option>
                <option value="Cree">Cree</option>
                <option value="Criminology">Criminology</option>
                <option value="Dental Hygiene">Dental Hygiene</option>
                <option value="Dentistry">Dentistry</option>
                <option value="Pre-Dentistry">Pre-Dentistry</option>
                <option value="Drama">Drama</option>
                <option value="Drawing">Drawing</option>
                <option value="Economics">Economics</option>
                <option value="Education - Bachelor of Education">Education - Bachelor of Education </option>
                <option value="Education - Post Baccalaureate">Education - Post Baccalaureate</option>
                <option value="Electrical Engineering">Electrical Engineering</option>
                <option value="Engineering">Engineering </option>
                <option value="English">English</option>
                <option value="Entomology">Entomology</option>
                <option value="Entrepreneurship/Small Business">Entrepreneurship/Small Business</option>
                <option value="Environmental Design - Architecture">Environmental Design - Architecture</option>
                <option value="Environmental Science">Environmental Science</option>
                <option value="Environmental Studies">Environmental Studies</option>
                <option value="Family Social Sciences">Family Social Sciences</option>
                <option value="Film Studies">Film Studies</option>
                <option value="Finance">Finance</option>
                <option value="Fine Arts">Fine Arts </option>
                <option value="Food Science">Food Science</option>
                <option value="French">French</option>
                <option value="Genetics">Genetics</option>
                <option value="Geography">Geography</option>
                <option value="Geological Sciences">Geological Sciences</option>
                <option value="Geology">Geology</option>
                <option value="Geophysics">Geophysics</option>
                <option value="German">German</option>
                <option value="Global Political Economy">Global Political Economy</option>
                <option value="Graphic Design">Graphic Design</option>
                <option value="Greek">Greek</option>
                <option value="Health Sciences">Health Sciences</option>
                <option value="Health Studies">Health Studies</option>
                <option value="History">History</option>
                <option value="Human Nutritional Sciences">Human Nutritional Sciences</option>
                <option value="Human Resource Management / Industrial Relations">Human Resource Management / Industrial Relations</option>
                <option value="Icelandic">Icelandic</option>
                <option value="Interior Design">Interior Design (Masters)</option>
                <option value="International Business">International Business</option>
                <option value="Italian">Italian</option>
                <option value="Jazz Studies">Jazz Studies</option>
                <option value="Judaic Studies">Judaic Studies</option>
                <option value="Kinesiology">Kinesiology</option>
                <option value="Labour Studies">Labour Studies</option>
                <option value="Landscape Architecture (Masters)">Landscape Architecture (Masters)</option>
                <option value="Latin">Latin</option>
                <option value="Latin American Studies">Latin American Studies</option>
                <option value="Law">Law</option>
                <option value="Leadership and Organizations">Leadership and Organizations</option>
                <option value="Linguistics">Linguistics</option>
                <option value="Logistics and Supply Chain Management">Logistics and Supply Chain Management</option>
                <option value="Management">Management </option>
                <option value="Management Information Systems">Management Information Systems</option>
                <option value="Marketing">Marketing</option>
                <option value="Mathematics">Mathematics</option>
                <option value="Mechanical Engineering">Mechanical Engineering</option>
                <option value="Medicine">Medicine</option>
                <option value="Pre-Medicine">Pre-Medicine</option>
                <option value="Medieval and Renaissance Studies">Medieval and Renaissance Studies</option>
                <option value="Microbiology">Microbiology</option>
                <option value="Music">Music</option>
                <option value="Music Composition">Music Composition</option>
                <option value="Music Education">Music Education</option>
                <option value="Music History">Music History</option>
                <option value="Music Performance">Music Performance</option>
                <option value="Native Studies">Native Studies</option>
                <option value="Nursing">Nursing</option>
                <option value="Occupational Therapy (Masters)">Occupational Therapy (Masters)</option>
                <option value="Ojibway">Ojibway</option>
                <option value="Operations Management/Research">Operations Management/Research</option>
                <option value="Painting">Painting</option>
                <option value="Pharmacy">Pharmacy</option>
                <option value="Pre-Pharmacy">Pre-Pharmacy</option>
                <option value="Philosophy">Philosophy</option>
                <option value="Photography">Photography</option>
                <option value="Physical Education">Physical Education</option>
                <option value="Physical Geography">Physical Geography</option>
                <option value="Physical Therapy">Physical Therapy (Masters)</option>
                <option value="Physics">Physics</option>
                <option value="Plant Biotechnology">Plant Biotechnology</option>
                <option value="Polish">Polish</option>
                <option value="Political Studies">Political Studies</option>
                <option value="Pre-Dentistry">Pre-Dentistry</option>
                <option value="Pre-Medicine">Pre-Medicine</option>
                <option value="Pre-Pharmacy">Pre-Pharmacy</option>
                <option value="Pre-Veterinary Medicine">Pre-Veterinary Medicine </option>
                <option value="Print Media">Print Media</option>
                <option value="Psychology - Arts">Psychology - Arts</option>
                <option value="Psychology - Science">Psychology - Science</option>
                <option value="Recreation Management and Community Development">Recreation Management and Community Development</option>
                <option value="Religion">Religion</option>
                <option value="Respiratory Therapy">Respiratory Therapy</option>
                <option value="Russian">Russian</option>
                <option value="Science">Science</option>
                <option value="Sculpture">Sculpture</option>
                <option value="Social Work">Social Work</option>
                <option value="Sociology">Sociology</option>
                <option value="Soil Science">Soil Science</option>
                <option value="Spanish">Spanish</option>
                <option value="Statistics">Statistics</option>
                <option value="Textile Sciences">Textile Sciences</option>
                <option value="Theatre">Theatre</option>
                <option value="Ukrainian">Ukrainian</option>
                <option value="Ukrainian Canadian Heritage Studies">Ukrainian Canadian Heritage Studies</option>
                <option value="University 1">University 1</option>
                <option value="Video">Video</option>
                <option value="Women\'s and Gender Studies">Women's &amp; Gender Studies</option>
                <option value="Other">Other</option>
            </select>
              
              
              
              <input type="submit" value="Search" class="search-button">
                </form>
          
      </div>
          
      </div>
    
  </header>
        
    
<script>
        
        //$('body').on('contextmenu', 'img', function(e) {return false;});
        //$('body').on('contextmenu', 'video', function(e) {return false;});
        
        
    if (document.addEventListener) 
    { // IE >= 9; other browsers
        document.addEventListener('contextmenu', function(e) 
        
        {
            //alert("You've tried to open context menu"); //here you draw your own menu
            e.preventDefault();
        }, false);
    } 
    
    else 
    
    { // IE < 9
        document.attachEvent('oncontextmenu', function() 
        
        {
            //alert("You've tried to open context menu");
            window.event.returnValue = false;
        });
    }
        
        
</script>
        
        
          
<script type="text/javascript">
  


    
    function submitBoardIDRequestForm(boardID)
        
    {
        document.getElementById("board-id-request").value = boardID;
        document.forms["board-id-request-form"].submit();
    }
    
    function changeBoardsAreaLength(areaSize)
    
    {
        var stringAreaSize = areaSize.toString() + "px";
        document.getElementById('my-boards-container').style.height = stringAreaSize;
    }
    
    function changeBoardInvitationsAreaLength(areaSize)
    
    {
        var stringAreaSize = areaSize.toString() + "px";
        document.getElementById('invitations-container').style.height = stringAreaSize;
        
        if (areaSize < 200)
            
        {
            document.getElementById('invitations-container').style.display = "none";
            document.getElementById('myinvitationsboard').style.display = "none";
        }
        
    }
    
    function changeBoardSearchesAreaLength(areaSize)
    
    {
        var stringAreaSize = areaSize.toString() + "px";
        document.getElementById('searches-container').style.height = stringAreaSize;
        
        if (areaSize < 200)
            
        {
            document.getElementById('searches-container').style.display = "none";
            document.getElementById('mysearchesboard').style.display = "none";
        }
        
    }
    
    function changePopularBoardsAreaLength(areaSize)
    
    {
        var stringAreaSize = areaSize.toString() + "px";
        document.getElementById('popular-boards-container').style.height = stringAreaSize;
    }
    
    function submitPopularBoardJoinForm(boardID)
    
    {
        document.getElementById("popular-board-join-board-id").value = boardID;
        document.forms["popular-board-join-form"].submit(); 
    }
    
    function submitSearchBoardJoinForm(boardID)
    
    {
        document.getElementById("search-board-join-board-id").value = boardID;
        document.forms["search-board-join-form"].submit(); 
    }
    
    function submitBoardInvitationAcceptForm(boardID)
    
    {
        document.getElementById("board-invitation-accept-board-id").value = boardID;
        document.forms["board-invitation-accept-form"].submit(); 
    }
    
    function submitBoardInvitationDeclineForm(boardID)
    
    {
        document.getElementById("board-invitation-decline-board-id").value = boardID;
        document.forms["board-invitation-decline-form"].submit(); 
    }
    
    function submitBoardManagementForm(boardID)
    
    {
        document.getElementById("board-management-board-id").value = boardID;
        document.forms["board-management-form"].submit(); 
    }
    
    function submitBoardExitForm(boardID)
    
    {
        document.getElementById("board-exit-board-id").value = boardID;
        document.forms["board-exit-form"].submit(); 
    }
    

  
</script>

        
        
        <div class="headtext"><p>Welcome to our course and team management system. <br>Create boards for your courses or teams, or find one to join and learn from.</p></div>
    
                
                        
                
                <form hidden id="board-invitation-accept-form" method="post" action="../BoardInvitationAcceptServlet">
                    
                    <input type="text" id="board-invitation-accept-account-number" name="board-invitation-accept-account-number" value="<%= sessionAccountNumber %>" />
                    <input type="text" id="board-invitation-accept-board-id" name="board-invitation-accept-board-id" value="" />
                    <input type="submit" />
                    
                </form>
                
                        
                
                <form hidden id="board-invitation-decline-form" method="post" action="../BoardInvitationDeclineServlet">
                    
                    <input type="text" id="board-invitation-decline-account-number" name="board-invitation-decline-account-number" value="<%= sessionAccountNumber %>" />
                    <input type="text" id="board-invitation-decline-board-id" name="board-invitation-decline-board-id" value="" />
                    <input type="submit" />
                    
                </form>
                
                        
                
                <form hidden id="search-board-join-form" method="post" action="../SearchBoardJoinServlet">
                    
                    <input type="text" id="search-board-join-account-number" name="search-board-join-account-number" value="<%= sessionAccountNumber %>" />
                    <input type="text" id="search-board-join-board-id" name="search-board-join-board-id" value="" />
                    <input type="submit" />
                    
                </form>
                
                        
                
                <form hidden id="popular-board-join-form" method="post" action="../PopularBoardJoinServlet">
                    
                    <input type="text" id="popular-board-join-account-number" name="popular-board-join-account-number" value="<%= sessionAccountNumber %>" />
                    <input type="text" id="popular-board-join-board-id" name="popular-board-join-board-id" value="" />
                    <input type="submit" />
                    
                </form>
                
                        
                
                <form hidden id="board-exit-form" method="post" action="../BoardExitServlet">
                    
                    <input type="text" id="board-exit-board-id" name="board-exit-board-id" value="" />
                    <input type="text" id="account-number" name="account-number" value="<%= sessionAccountNumber %>" />
                    <input type="submit" />
                    
                </form>
                
                        
                
                <form hidden id="board-management-form" method="post" action="host.jsp">
                    
                    <input type="text" id="board-management-board-id" name="board-management-board-id" value="" />
                    <input type="submit" />
                    
                </form>
                
                        
                
                <form hidden id="board-id-request-form" method="post" action="board.jsp">
                    
                    <input type="text" id="board-id-request" name="board-id-request" />
                    <input type="submit" />
                    
                </form>
  
                        
  
        <div id="myinvitationsboard"><div class="board-type">Invitations</div></div>
        <div id="invitations-container">
            
            
            
                    <%
                        
                        BoardInvitationsList invitations = new BoardInvitationsList(sessionAccountNumber);
                        
                        
                        %>
                        
                        
                        
                        <iframe hidden src="" onload="changeBoardInvitationsAreaLength(<%= invitations.getBoardsAreaLength() %>)"></iframe>
                    
                        
                        
                    <%
                        
                        int count = 0;
                        
                        for (count = 0; (count < invitations.length()) && (invitations.getBoard(count) != null); count++)
                        
                        {
                        
                        %>
                        
                        
            
            <div class="board">
                    
                    <div class="board-pic">
                        
                        <%
                            if (invitations.getBoard(count).getBoardPoster() != null) {
                            
                            %> 
                        
                            <img id="board-pic" src="<%= invitations.getBoard(count).getBoardPoster() %>" alt="wallpaper" title="<%= invitations.getBoard(count).getBoardName() %>" />
                        
                        <%
                            
                            }
                            
                            else
                            
                            {
                            
                            %> 
                        
                            <img id="board-pic" src="../image1.jpg" alt="wallpaper" title="<%= invitations.getBoard(count).getBoardName() %>" />
                        
                        <%
                            
                            }
                            
                            %> 
                        
                    </div>
                    
               <div class="board-info">
            <h3><%= invitations.getBoard(count).getBoardName() %></h3>
            <h6 class="whitentext">Hosted by <%= invitations.getBoard(count).getCreatorName() %></h6>
            <span class="whitentext"><%= invitations.getBoard(count).getNumberOfMembers() %> Members</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  
                
                <%
                            
                            if (!invitations.getBoard(count).getPublicityMode().equalsIgnoreCase("public")) {
                            
                            %> 
                
                <i class="material-icons" style="font-size:20px;color:#fff">https</i>
                
                <%
                            
                            }
                            
                            %> 
                
                            
            <br><br>
             <button class="button2" onclick="submitBoardInvitationDeclineForm(<%= invitations.getBoard(count).getBoardID() %>)"><a class="chillonline">Decline</a></button>  &nbsp; 
             <button class="button2" onclick="submitBoardInvitationAcceptForm(<%= invitations.getBoard(count).getBoardID() %>)"><a class="chillonline">Accept</a></button>
               </div>
            </div>
                        
                        
                        
                        <%
                        
                        }
                        
                        %>
            
            
            
        </div>
  
                        
  
        <div id="mysearchesboard"><div class="board-type">Board search results</div></div>
        <div id="searches-container">
            
            
            
                    <%
                        if (searchName != null) 
                        
                        {
                            
                        BoardSearch searches = new BoardSearch(searchName);
                        
                        
                        %>
                        
                        
                        
                        <iframe hidden src="" onload="changeBoardSearchesAreaLength(<%= searches.getBoardsAreaLength() %>)"></iframe>
                    
                        
                        
                    <%
                        
                        
                        for (count = 0; (count < searches.length()) && (searches.getBoard(count) != null); count++)
                        
                        {
                        
                        %>
            
            <div class="board">
                    
                    <div class="board-pic">
                        
                        <%
                            if (searches.getBoard(count).getBoardPoster() != null) {
                            
                            %> 
                        
                            <img id="board-pic" src="<%= searches.getBoard(count).getBoardPoster() %>" alt="wallpaper" title="<%= searches.getBoard(count).getBoardName() %>" />
                        
                        <%
                            
                            }
                            
                            else
                            
                            {
                            
                            %> 
                        
                            <img id="board-pic" src="../image1.jpg" alt="wallpaper" title="<%= searches.getBoard(count).getBoardName() %>" />
                        
                        <%
                            
                            }
                            
                            %> 
                        
                    </div>
                            
               <div class="board-info">
            <h3><%= searches.getBoard(count).getBoardName() %></h3>
            <h6 class="whitentext">Hosted by <%= searches.getBoard(count).getCreatorName() %></h6>
            <span class="whitentext"><%= searches.getBoard(count).getNumberOfMembers() %> Members</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  
                
                <%
                            
                            if (!searches.getBoard(count).getPublicityMode().equalsIgnoreCase("public")) {
                            
                            %> 
                
                <i class="material-icons" style="font-size:20px;color:#fff">https</i>
                
                <%
                            
                            }
                            
                            %> 
            
            
               <br><br><button class="button2" onclick="submitSearchBoardJoinForm(<%= searches.getBoard(count).getBoardID() %>)"><a class="chillonline">Enter Board</a></button>
               </div>
            </div>
                        
                        <%
                        
                        }
                        
                    }
                    
                    else
                    
                    {
                        
                        %>
                        
                        
                        <iframe hidden src="" onload="changeBoardSearchesAreaLength(90)"></iframe>
                        
                        
            <%
                        
                    }
                        
                        %>
            
            
        </div>
                        
                        
                        
        <div class="myboard">
            <div class="board-type">My course boards</div>
            <div class="board-add">
                <a class="clickable-text" href="javascript:window.location.href='toll.jsp';" title="Create a Board" >
                    <div id="create-div"><div id="create-text-div"><b>CREATE BOARD</b></div><div id="create-icon-div"><i id="add-board-button" class="material-icons" style="font-size:50px;color:#f40">add_location</i></div></div>
                </a>
            </div>
        </div>
                
        <div id="my-boards-container">
            
            
            
                    <%
                        
                        CourseBoardList boards = new CourseBoardList(sessionAccountNumber);
                        
                        
                        %>
                        
                        
                        
                        <iframe hidden src="" onload="changeBoardsAreaLength(<%= boards.getBoardsAreaLength() %>)"></iframe>
                    
                        
                        
                    <%
                        
                        
                        for (count = 0; (count < boards.length()) && (boards.getBoard(count) != null); count++)
                        
                        {
                        
                        %>
                        
                        
            
            <div class="board">
                <a href="javascript:submitBoardIDRequestForm(<%= boards.getBoard(count).getBoardID() %>);">
                    <div class="board-pic">
                        
                        <%
                            if (boards.getBoard(count).getBoardPoster() != null) {
                            
                            %> 
                        
                        <img id="board-pic" src="<%= boards.getBoard(count).getBoardPoster() %>" alt="wallpaper" title="<%= boards.getBoard(count).getBoardName() %>" />
                        
                        <%
                            
                            }
                            
                            else
                            
                            {
                            
                            %> 
                        
                        <img id="board-pic" src="../image1.jpg" alt="wallpaper" title="<%= boards.getBoard(count).getBoardName() %>" />
                        
                        <%
                            
                            }
                            
                            %> 
                        
                    </div>
                </a>
               <div class="board-info">
                <h3><%= boards.getBoard(count).getBoardName() %></h3>
                <h6 class="whitentext">Hosted by <%= boards.getBoard(count).getCreatorName() %></h6>
                <span class="whitentext"><%= boards.getBoard(count).getNumberOfMembers() %> Members</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  
                
                <%
                            
                            if (!boards.getBoard(count).getPublicityMode().equalsIgnoreCase("public")) {
                            
                            %> 
                
                <i class="material-icons" style="font-size:20px;color:#fff">https</i>
                
                <%
                            
                            }
                            
                            %> 
            
            <br><br>
            
            <%
                            
                            if (boards.getBoard(count).getClientID() == sessionClient.getClientID()) {
                            
                            %> 
            
            <button class="button2" onclick="submitBoardManagementForm(<%= boards.getBoard(count).getBoardID() %>)"><a class="chillonline">Manage Board</a></button>
                
                <%
                            
                            }
                            
                            %> 
            
            <%
                            
                            if (boards.getBoard(count).getClientID() != sessionClient.getClientID()) {
                            
                            %> 
            
            <button class="button2" onclick="submitBoardExitForm(<%= boards.getBoard(count).getBoardID() %>)"><a class="chillonline">Exit Board</a></button>
                
                <%
                            
                            }
                            
                            %> 
                
                </div>
            </div>
               
               
                        
                        <%
                        
                        }
                        
                        %>
            
            
                        
        </div>

  
        <div class="myboard"><div class="board-type">Hot courses in all fields</div></div>
        <div id="popular-boards-container">
            
            
            
                    <%
                        
                        PopularCourseBoardsList popularBoards = new PopularCourseBoardsList(sessionAccountNumber);
                        
                        
                        %>
                        
                        
                        
                        <iframe hidden src="" onload="changePopularBoardsAreaLength(<%= popularBoards.getBoardsAreaLength() %>)"></iframe>
                    
                        
                        
                    <%
                        
                        
                        for (count = 0; (count < popularBoards.length()) && (popularBoards.getBoard(count) != null); count++)
                        
                        {
                        
                        %>
            
            <div class="board">
                    
                    <div class="board-pic">
                        
                        <%
                            if (popularBoards.getBoard(count).getBoardPoster() != null) {
                            
                            %> 
                        
                            <img id="board-pic" src="<%= popularBoards.getBoard(count).getBoardPoster() %>" alt="wallpaper" title="<%= popularBoards.getBoard(count).getBoardName() %>" />
                        
                        <%
                            
                            }
                            
                            else
                            
                            {
                            
                            %> 
                        
                            <img id="board-pic" src="../image1.jpg" alt="wallpaper" title="<%= popularBoards.getBoard(count).getBoardName() %>" />
                        
                        <%
                            
                            }
                            
                            %> 
                        
                    </div>
                            
               <div class="board-info">
            <h3><%= popularBoards.getBoard(count).getBoardName() %></h3>
            <h6 class="whitentext">Training provided by <%= popularBoards.getBoard(count).getCreatorName() %></h6>
            <span class="whitentext"><%= popularBoards.getBoard(count).getNumberOfMembers() %> Members</span> &nbsp; <span class="whitentext">200+ Tutorials</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  
            
            <br><br><button class="button2" onclick="submitPopularBoardJoinForm(<%= popularBoards.getBoard(count).getBoardID() %>)"><a class="chillonline">Board FREE</a></button>
               </div>
            </div>
                        
                        <%
                        
                        }
                        
                        %>
            
            
            
        </div>

        
  

</body>
</html>

