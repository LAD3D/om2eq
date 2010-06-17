<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title>om2eq</title>
</head>

<body>
  <?php

$path_to_om2eq = "/home/sergio/om2eq/bin/om2eq";

if($_FILES['my-oh-my']['size'] < 50000) {
  echo "<p id=\"processed_output\">";
  exec($path_to_om2eq . " --no-irb " . $_FILES['my_oh_my']['tmp_name'], $output
  = array());

  foreach($output as $line) {
    echo $line. "<br/>";
  }
  echo "</p>";
}

?>

  <form action="" enctype="multipart/form-data" method="post">
    <input name="my-oh-my" size="75" type="file"/>
    <input value="Process" type="submit"/>
  </form>
</body>

</html>
