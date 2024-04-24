<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Dodawanie użytkownika</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('http://localhost/baza/zdj.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 400px;
            margin: 50px auto;
            background-color: #FFFFFF;
            padding: 20px;
            border: 1px solid #CCCCCC;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .container h1 {
            text-align: center;
        }

        .container form {
            margin-top: 20px;
        }

        .container label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        .container input[type="text"],
        .container textarea,
        .container input[type="date"],
        .container select {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            border: 1px solid #CCCCCC;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .container button {
            background-color: #9932CC;
            color: white;
            padding: 14px 20px;
            margin-top: 16px;
            border: none;
            cursor: pointer;
            width: 100%;
            border-radius: 4px;
            font-size: 16px;
            transition: transform 0.3s;
        }

        .container button:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Dodawanie użytkownika</h1>
        <?php
        $connection = new mysqli('localhost', 'root', '', 'nowa');

        if (mysqli_connect_errno()) {
            echo 'Błąd połączenia z bazą';
            header("Refresh: 1; URL=stronalogowania.php");
            exit;
        }

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $name = $_POST['name'];
            $surname = $_POST['surname'];
            $haslo = $_POST['password'];
            $danelogowania = $_POST['danelogowania'];
            $pesel = $_POST['pesel'];
            $telephone = $_POST['telephone'];
            $adres = $_POST['adres'];
            $mail = $_POST['mail'];

            // Sprawdzenie czy wszystkie pola są wypełnione
            if (!empty($name) && !empty($surname) && !empty($haslo) && !empty($danelogowania) && !empty($pesel) && !empty($telephone) && !empty($adres) && !empty($mail)) {
                $insertUserQuery = "INSERT INTO users (name, surname, haslo, danelogowania, pesel)
                                    VALUES ('$name', '$surname', '$haslo', '$danelogowania', '$pesel')";

                if ($connection->query($insertUserQuery)) {
                    echo 'Użytkownik został dodany.';
                } else {
                    echo 'Wystąpił błąd podczas dodawania użytkownika.';
                }
            } else {
                echo 'Wszystkie pola muszą być wypełnione.';
            }
        }
        ?>
        <form method="POST">
            <label for="name">Imię:</label>
            <input type="text" id="name" name="name" required>

            <label for="surname">Nazwisko:</label>
            <input type="text" id="surname" name="surname" required>

            <label for="password">Hasło:</label>
            <input type="password" id="password" name="password" required>

            <label for="danelogowania">Dane logowania:</label>
            <input type="text" id="danelogowania" name="danelogowania" required>

            <label for="pesel">PESEL:</label>
            <input type="text" id="pesel" name="pesel" required>

            <label for="telephone">Telefon:</label>
            <input type="text" id="telephone" name="telephone" required>

            <label for="adres">Adres:</label>
            <textarea id="adres" name="adres" required></textarea>

            <label for="mail">E-mail:</label>
            <input type="email" id="mail" name="mail" required>

            <button type="submit">Dodaj użytkownika</button>
        </form>
    </div>
</body>
</html>
