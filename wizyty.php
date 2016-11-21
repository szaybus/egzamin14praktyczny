<?php include 'check.php'; ?>
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
        //print_r($db);
        $q = "SELECT wizyta.termin, pacjent.imie, pacjent.nazwisko,
                    lekarz.imie, lekarz.nazwisko FROM wizyta
        INNER JOIN pacjent ON wizyta.pacjent=pacjent.ID_pacjent
        INNER JOIN lekarz ON wizyta.lekarz=lekarz.ID_lekarz;";
        $result = $db->query($q);
        echo '<table>';
        echo '<tr><td>Termin</td><td>Imie i nazwisko pacjenta</td>
              <td>Imie i nazwisko lekarza</td></tr>';
        while ($row = $result->fetch_row()) {
          echo '<tr>';
          echo "<td>$row[0]</td><td>$row[1] $row[2]</td>
                <td>$row[3] $row[4]</td>";
          echo '</tr>';
        }
        echo '</table>';
        ?>
      </section>
    </div>
  </body>
</html>
