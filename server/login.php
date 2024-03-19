<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../assets/style.css">
	<title>Авторизация</title>
</head>

<body>
	<?php
	try {
		$host = "127.0.0.1";
		$username = "root";
		$database = "mat_uchet_orgtehniki";
		$pass = "";
		$conn = new mysqli($host, $username, $pass, $database);
		// Проверка соединения
		if (!$conn) {
			die ("Connection failed: " . mysqli_connect_error());
		}
		$res = $conn->query("SELECT `Login` FROM `users` WHERE `Login`='" . $_POST['Login'] . "' AND `Password` = '" . $_POST['Password'] . "'");
		if ($result = $res->num_rows > 0) {
			echo '<div class="container message">
						<h1>Вы успешно авторизовались!</h1>
						<a href="../index.html">Вернуться на главную</a>
					</div>';
		} else {
			echo '<div class="container message">
						<h1>Пользователь не найден!</h1>
						<a href="../index.html">Вернуться на главную</a>
					</div>';
		}
	} catch (Exception $e) {
		echo '<div class="container message">
					<h1>Ошибка авторизации!</h1>
					<a href="../index.html">Вернуться на главную</a>
				</div>';
	}

	// Закрытие соединения
	mysqli_close($conn);
	?>
</body>

</html>