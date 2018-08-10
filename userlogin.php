<html>
<?php
$aname=$_REQUEST["uname"];
$apsw=$_REQUEST["psw"];
$con=mysqli_connect("localhost:3306","root","");
mysqli_select_db($con,"colldb");
if(mysqli_num_rows(mysqli_query($con,"select * from ulogin where uname='$uname' and pass='$psw'"))==1)
{
	include('menu.html');
}
else
{
	echo "<center>";
 	echo "</br></br></br></br></br></br></br></br></br></br></br></br></br></br>";
	echo "<font size=15px color=\"red\">WARNING!<br> USER ALREADY EXISTS</font>";
	echo "<br><br><br><br>";
 	echo "<form action=\"http://localhost/coll/userlogin.html\">";
 	echo "<input type=\"submit\" name=\"button\" value=\"GO BACK\">";
 	echo "</form>";
 	echo "</center>";
}
?>
</html>