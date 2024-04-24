<!DOCTYPE html>

<html lang="pl">
  <link rel = "stylesheet" href = "style.css">
    <head>
        <meta charset="UTF-8">
        <title>Personel</title>
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
        <br><b class = "empty-button">O pracowniku</b>
        <?php
       
        
        $connection = new mysqli('localhost', 'root', '', 'nowa');

        if (mysqli_connect_errno()){
            echo 'Błąd połączenia z bazą';
            header("Refresh: 1; URL=stronalogowania.php");
            exit;
        }
        
   

        $sql = "SELECT u.idusers AS 'ID',
                u.name AS 'Imię',
                u.surname AS 'Nazwisko',
                st.stanowisko AS 'Stanowisko',
                cd.telephone AS 'Numer telefonu',
                cd.mail AS 'Mail',
                cd.adres AS 'Adres'
                

                FROM users u
                JOIN contact_data cd ON u.idusers=cd.users_idusers  
                JOIN uprawnienia up ON u.idusers=up.users_idusers
                JOIN slownik_stanowisk st ON up.slownik_stanowisk_idslownik_stanowisk=st.idslownik_stanowisk 
                ";

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





    </body>
</html>