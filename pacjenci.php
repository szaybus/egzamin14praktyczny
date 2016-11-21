<?php include 'check.php';?>
<!DOCTYPE html>
<html>
  <head>
    <title>Egzamin</title>
    <meta charset="utf-8">
    <style>
    div#pageMain header nav ul li {
      display: inline;
    }
    td {
      border:1px solid #ccc;
      border-collapse: collapse;
    }
    </style>
    <script>
    function validate() {
      var inputValue = document.getElementById('pesel').value;
      var inputLength = inputValue.length;
      if(inputLength == 11 && !isNaN(inputValue)) {
        document.getElementById('submit').disabled = false;
      } else {
        document.getElementById('submit').disabled = true;
      }
    }
    </script>
  </head>
  <body>
    <div id="pageMain" style="width: 960px; margin: 0 auto;">
      <header style="width:100%;">
        <nav style="text-align: center">
          <ul>
            <li><a href="pacjenci.php">Pacjenci</a></li>
            <li><a href="lekarze.php">Lekarze</a></li>
            <li><a href="wizyty.php">Wizyty</a></li>
            <li><a href="wyloguj.php">Wyloguj</a></li>
          </ul>
        </nav>
      </header>
      <section style="width:100%;">
        <?php
        $db = new mysqli('localhost','root','','egzamin');
        $db->set_charset('utf8');
        if(isset($_REQUEST['imie'])) {
          $imie = $_REQUEST['imie'];
          $nazwisko = $_REQUEST['nazwisko'];
          $pesel = $_REQUEST['pesel'];

          $q = "INSERT INTO pacjent (imie, nazwisko, pesel) VALUES ('$imie',
          '$nazwisko','$pesel')";
          $db->query($q);
        }
        //print_r($db);
        $q = "SELECT * FROM pacjent;";
        $result = $db->query($q);
        echo '<table>';
        while ($row = $result->fetch_row()) {
          echo '<tr>';
          echo "<td>$row[0]</td><td>$row[1]</td><td>$row[2]</td><td>$row[3]</td>";
          echo '</tr>';
        }
        echo '</table>';



        ?>
        <form action="pacjenci.php">
          Imię: <input type="text" name="imie">
          Nazwisko: <input type="text" name="nazwisko">
          Pesel: <input type="text" name="pesel" id="pesel" oninput="validate();">
          <input type="submit" value="Dodaj pacjenta" id="submit" disabled="true">
        </form>
      </section>
    </div>
  </body>
</html>
