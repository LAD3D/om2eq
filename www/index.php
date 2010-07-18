<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title>om2eq</title>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <style type="text/css" media="screen" href="style.css"/>
</head>

<body>

  <div id="page">
  <?php

     $path_to_om2eq = "/home/sergio/om2eq/bin/om2eq";

     if($_FILES['my-oh-my']['size'] < 50000) {
        echo "<p id=\"processed_output\">";

        $res = move_uploaded_file($_FILES['my-oh-my']['tmp_name'], "/home/sergio/tmp/".$_FILES['my-oh-my']['name']);
        system("/home/sergio/om2eq/bin/om2eq --no-irb --separator '<br>' /home/sergio/tmp/" . $_FILES['my-oh-my']['name']);//, $output = array());
        echo "</p>";
     }

   ?>

  <form action="" enctype="multipart/form-data" method="post">
    <input name="my-oh-my" size="75" type="file"/>
    <input value="Process" type="submit"/>
  </form>

  </div>
</body>

</html>
