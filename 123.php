<html>
<?php
<html>
<?php
switch($_GET['button'])
{
case 'View all Colleges':{
include('view.php');
break;
}
case 'College Predictor':{
include('collpredict.php');
break;
}
case 'Compare Colleges':{
include('compcoll.php');
break;
}
case 'College Reviews':{
include('collreview.php');
break;
}

}
?>
</html>