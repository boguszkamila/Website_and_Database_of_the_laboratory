<!DOCTYPE html>

<html lang="pl">
    <head>
        <meta charset="UTF-8">
        <title>Sprzęt - dodatkowe informacje</title>

        <style>
            body {
                font-family: Arial, sans-serif;
                background-image: url('http://localhost/baza/zdj.jpg');
                background-repeat: no-repeat;
                background-size: cover;
                margin: 0;
                padding: 0;
            }
            p {
                padding: 15px;
            }
            table {
                border-collapse: collapse;
                width: 100%;
                margin: 15px 0;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                background-color: white;
            }
            th, td {
                padding: 15px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            th {
                background-color: #800080;
                color: white;
            }
            tr:hover {
                background-color:#f5f5f5;
            }
            td.wider-column {
                width: 200px;
            }
            a {
                display: inline-block;
                margin: 15px 0;
                color: #800080;
                text-decoration: none;
            }
            a:hover {
                color: #9932CC;
            }
            .back-button {
                display: inline-block;
                margin: 15px 0;
                padding: 10px 20px;
                background-color: #800080;
                color: white;
                text-decoration: none;
                border-radius: 5px;
            }

            .back-button:hover {
                background-color: #9932CC;
            }
            .empty-button{
                display: inline-block;
                margin: 15px 0;
                padding: 10px 20px;
                background-color: #800080;
                color: white;
                text-decoration: none;
                border-radius: 5px;
            }
            .empty-button:hover {
                background-color: #9932CC;
            }
        </style>
    </head>

    <body>
    <p>
        <br><a href="stronaglowna.php" class = "back-button">Wróć do poprzedniej strony</a>
    </p>
    <p>
        <br><b class = "empty-button">Informacje o sprzęcie</b>
        <?php
       
        
        $connection = new mysqli('localhost', 'root', '', 'nowa');

        if (mysqli_connect_errno()){
            echo 'Błąd połączenia z bazą';
            header("Refresh: 1; URL=stronalogowania.php");
            exit;
        }
        
       

        $sql = "SELECT s.idsprzet AS 'ID', s.name AS 'Nazwa urządzenia', s.opis AS 'Opis działania',
                        s.rok_produkcji AS 'Rok produkcji', s.producent AS 'Producent', concat(u.name,' ', u.surname) AS 'Opiekun sprzętu'
                FROM sprzet s
                JOIN users u ON s.users_idusers=u.idusers";

        $wynik= $connection -> query($sql);
    
        echo '<table>';
        echo '<tr>';
        $field_names = $wynik->fetch_fields();
        foreach ($field_names as $field) {
            echo '<th>' . $field->name . '</th>';
        }
        echo '</tr>';
        while ($row = $wynik->fetch_assoc()) {
            echo '<tr>';
            foreach ($row as $value) {
                echo '<td>' . $value . '</td>';
            }
            echo '</tr>';
        }
        echo '</table>';
        ?>
    </p>

    <p>
        <br><b class = "empty-button">Przeglądy techniczne</b>
        <?php
        $sql2 = "SELECT s.name AS 'Nazwa sprzętu', p.idpsrzed AS 'ID', p.data_przegladu AS 'Data przeglądu',
                        p.opis_przegladu AS 'Opis przegladu'
                        
                 FROM sprzet s
                 JOIN przeglady p ON s.idsprzet=p.idpsrzed";

        $wynik2 = $connection -> query($sql2);

        echo '<table>';
        echo '<tr>';
        $field_names = $wynik2->fetch_fields();
        foreach ($field_names as $field) {
            echo '<th>' . $field->name . '</th>';
        }
        echo '</tr>';
        while ($row = $wynik2->fetch_assoc()) {
            echo '<tr>';
            foreach ($row as $value) {
                echo '<td>' . $value . '</td>';
            }
            echo '</tr>';
        }
        echo '</table>';
        ?>
    </p>
    <p>
        <br><b class = "empty-button" >Metody</b>
        <?php
        $sql2 = "SELECT s.name AS 'Sprzet', m.idmetody AS 'ID', m.name AS 'Metoda', m.procedura AS 'Opis metody'
                FROM metody m
                JOIN metod_urzadzenia mu ON m.idmetody=mu.metody_idmetody
                JOIN sprzet s ON mu.sprzet_idsprzet=s.idsprzet
                ";

        $wynik2 = $connection -> query($sql2);

        echo '<table>';
        echo '<tr>';
        $field_names = $wynik2->fetch_fields();
        foreach ($field_names as $field) {
            echo '<th>' . $field->name . '</th>';
        }
        echo '</tr>';
        while ($row = $wynik2->fetch_assoc()) {
            echo '<tr>';
            foreach ($row as $value) {
                echo '<td>' . $value . '</td>';
            }
            echo '</tr>';
        }
        echo '</table>';
        ?>
    </p>
    </body>
</html>