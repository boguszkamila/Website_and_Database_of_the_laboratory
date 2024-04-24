<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Odzyskiwanie hasła</title>
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

        .container input[type="email"],
        .container input[type="tel"],
        .container input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 4px;
        }

        .container button {
            background-color: #9932CC;;
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

        .container a.button2 {
            display: block;
            text-align: center;
            color: blue;
            font-size: 14px;
            margin-top: 16px;
            text-decoration: none;
        }

        .container a.button2:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Odzyskiwanie hasła</h2>
        <?php
        $connection = new mysqli('localhost', 'root', '', 'nowa');

        if (mysqli_connect_errno()) {
            echo 'Błąd połączenia z bazą';
            header("Refresh: 1; URL=stronalogowania.php");
            exit;
        }

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $email = $_POST['email'];
            $telephone = $_POST['telephone'];
            $newPassword = $_POST['new_password'];

            // Sprawdzenie czy użytkownik istnieje w tabeli `contact_data` na podstawie maila i numeru telefonu
            $query = "SELECT users.idusers FROM users
                      INNER JOIN contact_data ON users.idusers = contact_data.users_idusers
                      WHERE contact_data.mail = '$email' AND contact_data.telephone = '$telephone'";

            $result = $connection->query($query);

            if ($result->num_rows === 1) {
                $row = $result->fetch_assoc();
                $userID = $row['idusers'];

                // Aktualizacja hasła w tabeli `users`
                $updateQuery = "UPDATE users SET haslo = '$newPassword' WHERE idusers = '$userID'";
                if ($connection->query($updateQuery)) {
                    echo 'Hasło zostało zmienione. Za chwilę zostaniesz przekierowany do strony logowania.';
                    header("Refresh: 3; URL=stronalogowania.php");
                    exit;
                } else {
                    echo 'Wystąpił błąd podczas zmiany hasła.';
                }
            } else {
                echo 'Nieprawidłowe dane kontaktowe.';
            }

            $result->free();
        }
        ?>

        <form method="POST">
            <label for="email">E-mail:</label>
            <input type="email" name="email" required>

            <label for="telephone">Numer telefonu:</label>
            <input type="tel" name="telephone" required>

            <label for="new_password">Nowe hasło:</label>
            <input type="password" name="new_password" required>

            <button type="submit">Zmień hasło</button>
        </form>
    </div>
</body>
</html>
