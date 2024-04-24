<html>
    <head>
        <meta charset="UTF-8">
        <title>Logowanie</title>
    </head>


    <body>

        <?php
        $login = $_POST['login'];
        $pass = $_POST['password'];
        ?>


        <?php
        $connection = new mysqli('localhost', 'root', '', 'nowa');

        if (mysqli_connect_errno()){
            echo 'Błąd połączenia z bazą';
            header("Refresh: 1; URL=stronalogowania.php");
            exit;
        }
        ?>

        <p>
        <?php
        $login = $connection->real_escape_string($login);
        $pass = $connection->real_escape_string($pass);

        $sql = "SELECT * FROM users WHERE danelogowania = '$login' AND haslo = '$pass'";
        $wynik= $connection -> query($sql);

        if ($wynik && $wynik->num_rows > 0){
            
            header("Location: stronaglowna.php");
           
        } else {
            echo "Login lub hasło niepoprawne";
            header("Refresh: 10; URL=stronalogowania.php");
            exit();
        }


        

        $wynik->free();
        $connection->close();
        ?>
        </p>




        
    </body>


</html>