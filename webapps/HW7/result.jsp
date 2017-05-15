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
  String namet="",passwordt="",emailt="",telphonet="";
  String result = request.getParameter("result");
  int y=0;
if(rs!=null){
  while(rs.next()){
    if(result.equals(rs.getString("name"))){
        y=0;
        namet=rs.getString("name");
        passwordt=rs.getString("password");
        emailt=rs.getString("email");
        telphonet=rs.getString("telphone");
        break;
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
<head>
  <meta charset="UTF-8">
  <title>SEARCH RESULT</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
  <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
  <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
  <link rel="stylesheet" href="style.css">
</head>

<body>
<br><br>
<div class="container">
  <div class="card"></div>
  <div class="card">
    <h1 class="title">SEARCH RESULT</h1><br>
    <h1 class="title">INFORMATION</h1>
    <form>
      <div class="input-container">
        <label>username = <%=result%></label>
        <div class="bar"></div>
      </div><br><br><br><br>
      <div class="input-container">
        <label>password = <%=passwordt%></label>
        <div class="bar"></div>
      </div>
      <div class="input-container">
        <label>email=<%=emailt%></label>
        <div class="bar"></div>
      </div><br><br><br><br>
      <div class="input-container">
        <label>telphone = <%=telphonet%></label>
        <div class="bar"></div>
      </div>
    </form>
  </div><br><br>
  <input type="button" id="button" value="BACK" style="margin-left:100px;" onclick="back()"></input>
</div>
<script>
function back(){
  history.go(-1);
}
</script>
</body>
</html>
