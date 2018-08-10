<html>
<?php
switch($_GET['button'])
{
case 'Admin login':{
include('adminlogin.html');
break;
}
case 'User login':{
include('userlogin.html');
break;
}
case 'create new':{
include('create acc.html');
break;
}
}
?>
</html>