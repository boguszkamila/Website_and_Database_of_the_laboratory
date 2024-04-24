<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="utf-8"/>
  <title>Nasza wspaniała baza</title>
 
  <style>
    body {
      font-family: Arial, sans-serif;
      background-image: url('zdj.jpg');
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
    <h2>Logowanie</h2>
    <form action="logowanie.php" method="post">
      <label for="login">Login:</label>
      <input type="text" id="login" name="login" required>

      <label for="password">Hasło:</label>
      <input type="password" id="password" name="password" required>

      <button type="submit" id="loginButton">Zaloguj</button>
      <a href="haslo.php" id="forgotPassword" class="button2">Nie pamiętasz hasła?</a>
    </form>
  </div>
</body>
</html>