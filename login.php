<!DOCTYPE html>
<html>
  <head>
    <title>Egzamin</title>
    <meta charset="utf-8">
  </head>
  <body>
    <form action="login.php">
      Login: <input type="text" name="login"><br>
      Hasło: <input type="password" name="passwd"><br>
      <input type="submit" value="Zaloguj">
    <form>
      <?php
      if(isset($_REQUEST['login'])) {
        $login = $_REQUEST['login'];
        $passwd = $_REQUEST['passwd'];
        if($login == 'jkowalski' && $passwd == 'haslo1') {
          session_start();
          $_SESSION['zalogowany'] = true;
          header('Location: index.php');
        } else echo '<h3>Błędny login lub hasło</h3>';
      }
      ?>
  </body>
</html>
