<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../assets/style.css">
	<title>Регистрация</title>
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
		$res = $conn->query("SELECT `ID_user` FROM `users` WHERE `Login`= '" . $_POST['Login'] . "'");
		// узнаем количество строк, если не 0 - логин уже занят
		$result = $res->num_rows;
		if ($result > 0) {
			echo '<div class="container message">
						<h1>Логин уже занят!</h1>
						<a href="../index.html">Вернуться на главную</a>
					</div>';
		} else {
			$reg = $conn->query("INSERT INTO users (Name, Patronymic, Last_name, Phone, Login, Password) VALUES ('" . $_POST['Name'] . "','" . $_POST['Patronymic'] . "','" . $_POST['Last_name'] . "','" . $_POST['Phone'] . "','" . $_POST['Login'] . "', '" . $_POST['Password'] . "')");
			echo '<div class="container message">
						<h1>Вы успешно зарегистрировались!</h1>
						<a href="../index.html">Вернуться на главную</a>
					</div>';
		}
	} catch (Exception $e) {
		echo '<div class="container message">
					<h1>Ошибка регистрации!</h1>
					<a href="../index.html">Вернуться на главную</a>
				</div>';
	}

	// Закрытие соединения
	mysqli_close($conn);
	?>
</body>

</html>