<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Dodawanie sprzętu</title>
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
            position: relative;
            width: 300px;
            margin: 100px auto;
            padding: 30px;
            border: 1px solid #ccc;
            background-color: #FFFFFF;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .container h2 {
            text-align: center;
            margin-top: 0;
        }

        .container label {
            display: block;
            margin-bottom: 8px;
        }

        .container input[type="text"],
        .container textarea,
        .container input[type="date"],
        .container select {
            width: 100%;
            padding: 12px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 4px;
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

        .container button.shake {
            animation: shake 0.4s linear infinite;
        }

        @keyframes shake {
            0% { transform: translateX(0); }
            20% { transform: translateX(-10px); }
            40% { transform: translateX(10px); }
            60% { transform: translateX(-10px); }
            80% { transform: translateX(10px); }
            100% { transform: translateX(0); }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Dodawanie sprzętu</h2>
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
            $users_id = $_POST['users_id'];
            $rok_produkcji = $_POST['rok_produkcji'];
            $producent = $_POST['producent'];

            // Sprawdzenie czy wszystkie pola są wypełnione
            if (!empty($name) && !empty($opis) && !empty($users_id) && !empty($rok_produkcji) && !empty($producent)) {
                $insertQuery = "INSERT INTO sprzet (name, opis, users_idusers, rok_produkcji, producent)
                                VALUES ('$name', '$opis', '$users_id', '$rok_produkcji', '$producent')";

                if ($connection->query($insertQuery)) {
                    echo '<p>Sprzęt został dodany.</p>';
                } else {
                    echo '<p>Wystąpił błąd podczas dodawania sprzętu.</p>';
                }
            } else {
                echo '<p>Wszystkie pola muszą być wypełnione.</p>';
            }
        }
        ?>
        <form method="POST">
            <label for="name">Nazwa sprzętu:</label>
            <input type="text" name="name" required>

            <label for="opis">Opis sprzętu:</label>
            <textarea name="opis" required></textarea>

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

            <label for="rok_produkcji">Rok produkcji:</label>
            <input type="number" name="rok_produkcji" required>

            <label for="producent">Producent:</label>
            <input type="text" name="producent" required>

            <button type="submit">Dodaj sprzęt</button>
        </form>
    </div>
</body>
</html>
