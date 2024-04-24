<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Dodawanie projektu</title>
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
        <h1>Dodawanie projektu</h1>
        <?php
        $connection = new mysqli('localhost', 'root', '', 'nowa');

        if (mysqli_connect_errno()) {
            echo 'Błąd połączenia z bazą';
            header("Refresh: 1; URL=stronalogowania.php");
            exit;
        }

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $name = $_POST['name'];
            $opis = $_POST['opis'];
            $data_poczatek = $_POST['data_poczatek'];
            $data_koniec = $_POST['data_koniec'];
            $users_id = $_POST['users_id'];

            // Sprawdzenie czy wszystkie pola są wypełnione
            if (!empty($name) && !empty($opis) && !empty($data_poczatek) && !empty($data_koniec) && !empty($users_id)) {
                $insertQuery = "INSERT INTO projekty (name, opis, data_poczatek, data_koniec, users_idusers)
                                VALUES ('$name', '$opis', '$data_poczatek', '$data_koniec', '$users_id')";

                if ($connection->query($insertQuery)) {
                    echo 'Projekt został dodany.';
                } else {
                    echo 'Wystąpił błąd podczas dodawania projektu.';
                }
            } else {
                echo 'Wszystkie pola muszą być wypełnione.';
            }
        }
        ?>

        <form method="POST">
            <label for="name">Nazwa projektu:</label>
            <input type="text" name="name" required>

            <label for="opis">Opis projektu:</label>
            <textarea name="opis" required></textarea>

            <label for="data_poczatek">Data rozpoczęcia projektu:</label>
            <input type="date" name="data_poczatek" required>

            <label for="data_koniec">Data zakończenia projektu:</label>
            <input type="date" name="data_koniec" required>

            <label for="users_id">Osoba odpowiedzialna:</label>
            <select name="users_id" required>
                <?php
                $usersQuery = "SELECT idusers, name, surname FROM users";
                $usersResult = $connection->query($usersQuery);

                if ($usersResult && $usersResult->num_rows > 0) {
                    while ($row = $usersResult->fetch_assoc()) {
                        $userId = $row['idusers'];
                        $userName = $row['name'];
                        $userSurname = $row['surname'];

                        echo "<option value='$userId'>$userName $userSurname</option>";
                    }
                }
                ?>
            </select>

            <button type="submit">Dodaj projekt</button>
        </form>
    </div>
</body>
</html>
