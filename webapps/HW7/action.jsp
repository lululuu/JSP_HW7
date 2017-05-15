<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.49.205" />
  <jsp:setProperty property="port" name="database" value="3306" />
  <jsp:setProperty property="db" name="database" value="4104029039" />
  <jsp:setProperty property="user" name="database" value="4104029039" />
  <jsp:setProperty property="password" name="database" value="Ss4104029039!" />
</jsp:useBean>
<%
  database.connectDB();
  database.query("select * from account;");
  ResultSet rs = database.getRS();

  String username = request.getParameter("username");
  String email = request.getParameter("email");
  String password = request.getParameter("password");
  String password2 = request.getParameter("password2");
  String telphone = request.getParameter("telphone");
  String name = request.getParameter("name");
  String passwd = request.getParameter("passwd");
  String namet="",passwordt="",emailt="",telphonet="";
  int x=0,y=0,num=0;
if(username !=null && password !=null && email !=null && password2 !=null && telphone !=null){
  if(!password.equals(password2)){
    x++;%>
    <script language="javascript">
    alert("Two passwords are not the same.");
    history.go(-1);
    </script><%
  }
  if(rs!=null){
    while(rs.next()){
      if(username.equals(rs.getString("name"))){%>
        <script language="javascript">
        alert("The username has been taken.");
        history.go(-1);
        </script>
        <%
        x++;
      }
    }
  }
  if(x==0){
    database.insertData(username,email,password,telphone);%>
    <script language="javascript">
    alert("Register sucessfully. Please log in now.");
    history.go(-1);
    </script><%
  }
}
if(rs!=null){
  while(rs.next()){
    if(name.equals(rs.getString("name"))){
      if(passwd.equals(rs.getString("password"))){
        y=0;
        namet=rs.getString("name");
        passwordt=rs.getString("password");
        emailt=rs.getString("email");
        telphonet=rs.getString("telphone");%>
        <script language="javascript">
        alert("LOGIN SUCCESSFULLY.");
        </script><%
        break;
      }else{
        %>
        <script language="javascript">
        alert("The password is wrong.");
        history.go(-1);
        </script>
        <%
        break;
      }
    }else{
      y++;
    }
  }
}

if(y!=0){%>
  <script language="javascript">
  alert("The username does not exist.");
  history.go(-1);
  </script>
 <%
}%>

<!DOCTYPE html>
<html>
<title>USERS' INFO</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size:16px;}
.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1}
table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    background-color: #FF8888;
    color: white;
}
</style>

<body>
<nav class="w3-sidebar w3-red w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
  <div class="w3-container">
    <h3 class="w3-padding-64"><b>USERS'<br>INFORMATION</b></h3>
  </div>
  <div class="w3-bar-block">
    <a href="#showcase" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">DATA</a>
    <a href="#services" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">SEARCH</a>
  </div>
</nav>

<div class="w3-main" style="margin-left:340px;margin-right:40px">
  <div class="w3-container" style="margin-top:80px" id="showcase">
    <h1 class="w3-jumbo"><b>USERS' INFORMATION</b></h1><br><br>
    <h1 class="w3-xxxlarge w3-text-red"><b>DATA</b></h1>
    <hr style="width:50px;border:5px solid red" class="w3-round">

    <table>
  <tr>
    <th style="width:10%">Username</th>
    <th style="width:10%">Password</th>
    <th style="width:10%">Telephone</th>
    <th style="width:30%">Email</th>
  </tr>
  <%
  rs.first();
  %>
  <tr>
    <td><%=rs.getString("name")%></td>
    <td><%=rs.getString("password")%></td>
    <td><%=rs.getString("telphone")%></td>
    <td><%=rs.getString("email")%></td>
  </tr>
  <%
    while(rs.next()){
  %>
  <tr>
    <td><%=rs.getString("name")%></td>
    <td><%=rs.getString("password")%></td>
    <td><%=rs.getString("telphone")%></td>
    <td><%=rs.getString("email")%></td>
  </tr>
  <%}%>
</table>
  </div>
  <br>
    <form action="result.jsp" method="post">
  <div class="w3-container" id="services" style="margin-top:75px">
    <h1 class="w3-xxxlarge w3-text-red"><b>SEARCH</b></h1>
    <hr style="width:50px;border:5px solid red" class="w3-round">
      <h4>Username</h4>
      <input type="text" name="result">　　
      <input type="submit" value="SEARCH"/>

      <br><br><br>
  </div>
</form>
</div>
</body>
</html>
