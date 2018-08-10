<html>
<?php
$aname=$_REQUEST["aname"];
$aid=$_REQUEST["aid"];
$apsw=$_REQUEST["apsw"];
$con=mysqli_connect("localhost:3306","root","");
mysqli_select_db($con,"colldb");
if(mysqli_num_rows(mysqli_query($con,"select * from alogin where admin_name='$aname' and id=$aid and password='$apsw'"))==1)
{
	include('amenu.html');
}
else
{
	echo "<center>";
 	echo "</br></br></br></br></br></br></br></br></br></br></br></br></br></br>";
	echo "<font size=15px color=\"red\">WARNING!<br> USER ALREADY EXISTS</font>";
	echo "<br><br><br><br>";
 	echo "<form action=\"http://localhost/coll/adminlogin.html\">";
 	echo "<input type=\"submit\" name=\"button\" value=\"GO BACK\">";
 	echo "</form>";
 	echo "</center>";
}
?>
</html>