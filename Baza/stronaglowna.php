<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Strona główna</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('http://localhost/baza/zdj.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            font-size: 2em;
            color: black;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 10px;
            border-radius: 10px; 
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
        }

        .message {
            color: red;
            text-align: center;
            margin-bottom: 80px;
        }

        .link-list {
            list-style-type: none;
            padding: 0;
            display: flex; /* Dodany styl */
            justify-content: space-between; /* Dodany styl */
        }

        .link-list li {
            margin-bottom: 10px;
            position: relative;
            left: 0;
            opacity: 1;
            transition: transform 0.9s, opacity 0.9s; 
        }

        .link-list li a {
            display: block;
            background-color: #f2f2f2;
            padding: 10px;
            text-decoration: none;
            border-radius: 10px;
            color: #333;
        }

        
        .link-list li:hover {
            transform: translateX(20px); 
            opacity: 0.7; 
        }

        .footer-bar {
            background-color: #9932CC;
            padding: 10px;
            color: white;
            text-align: center;
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Strona główna</h1>

        <?php
        $connection = new mysqli('localhost', 'root', '', 'nowa');

        if (mysqli_connect_errno()){
            echo '<div class="message">UWAGA! Błąd połączenia z bazą</div>';
            header("Refresh: 1; URL=stronalogowania.php");
            exit;
        }
        ?>

        <ul class="link-list">
            <li><a href="projekty.php">Lista projektów</a></li>
            <li><a href="dodajprojekt.php">Dodaj projekt</a></li>
        </ul>   
        <ul class="link-list">
            <li><a href="uzytkownicy.php">Lista pracowników</a></li>
            <li><a href="dodajuzytkownicy.php">Dodaj pracownika</a></li>
        </ul>
        <ul class="link-list">
            <li><a href="sprzet.php">Lista sprzętu</a></li>
            <li><a href="dodajsprzet.php">Dodaj sprzęt</a></li>
        </ul>

        <div class="footer-bar">Wykonali: Kamila Bogusz 126083 ,Vadzim Krukouski 126212, Rafał Kęszycki 117421  </div>
    </div>
</body>
</html>
