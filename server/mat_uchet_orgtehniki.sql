-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 19 2024 г., 09:57
-- Версия сервера: 10.4.27-MariaDB
-- Версия PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mat_uchet_orgtehniki`
--

-- --------------------------------------------------------

--
-- Структура таблицы `orgtehnika`
--

CREATE TABLE `orgtehnika` (
  `ID_orgtehnika` int(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Model` varchar(255) NOT NULL,
  `Seriyniy_nomer` varchar(255) NOT NULL,
  `Proizvoditel` varchar(255) NOT NULL,
  `God_vipuska` int(4) NOT NULL,
  `Sostoyanie` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE `role` (
  `ID_role` int(255) NOT NULL,
  `Role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `ID_user` int(255) NOT NULL,
  `Login` varchar(30) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Patronymic` varchar(30) NOT NULL,
  `Last_name` varchar(50) NOT NULL,
  `Phone` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`ID_user`, `Login`, `Password`, `Name`, `Patronymic`, `Last_name`, `Phone`) VALUES
(13, 'Mes1ze', 'Mes1ze_pass', 'Максим', 'Иванович', 'Васильев', '+7 (915) 997-64-98'),
(14, 'Smolin', 'smolin123', 'Иван', 'Юрьевич', 'Смолин', '+7 (999) 999-99-99'),
(15, 'Dima_2004', '123123', 'Дмитрий', 'Анатольевич', 'Иванов', '+7 (123) 123-12-33');

-- --------------------------------------------------------

--
-- Структура таблицы `user_orgtehnika`
--

CREATE TABLE `user_orgtehnika` (
  `ID_user_orgtehnika` int(11) NOT NULL,
  `ID_user` int(11) NOT NULL,
  `ID_orgtehnika` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `orgtehnika`
--
ALTER TABLE `orgtehnika`
  ADD PRIMARY KEY (`ID_orgtehnika`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`ID_role`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID_user`);

--
-- Индексы таблицы `user_orgtehnika`
--
ALTER TABLE `user_orgtehnika`
  ADD PRIMARY KEY (`ID_user_orgtehnika`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `orgtehnika`
--
ALTER TABLE `orgtehnika`
  MODIFY `ID_orgtehnika` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
  MODIFY `ID_role` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `ID_user` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `user_orgtehnika`
--
ALTER TABLE `user_orgtehnika`
  MODIFY `ID_user_orgtehnika` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
