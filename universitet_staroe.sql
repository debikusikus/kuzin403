-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 02 2022 г., 18:21
-- Версия сервера: 10.4.22-MariaDB
-- Версия PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `universitet`
--

-- --------------------------------------------------------

--
-- Структура таблицы `fakultet`
--

CREATE TABLE `fakultet` (
  `kod_fakultet` int(11) NOT NULL,
  `nazvanie` varchar(50) NOT NULL,
  `dekan` varchar(50) NOT NULL,
  `spisok_grupp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `fakultet`
--

INSERT INTO `fakultet` (`kod_fakultet`, `nazvanie`, `dekan`, `spisok_grupp`) VALUES
(1, 'филологический', 'дмитревна', '101, 102, 103'),
(2, 'журналистики', 'ванькова', '202, 203, 204'),
(3, 'психологический', 'катьевна', '301, 302, 303'),
(4, 'физико-математический', 'елкина', '401,402,403');

-- --------------------------------------------------------

--
-- Структура таблицы `gruppa`
--

CREATE TABLE `gruppa` (
  `kod_grupp` int(11) NOT NULL,
  `kod_fakultet` int(50) NOT NULL,
  `nomer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `gruppa`
--

INSERT INTO `gruppa` (`kod_grupp`, `kod_fakultet`, `nomer`) VALUES
(1, 1, '101'),
(2, 2, '201'),
(3, 3, '301'),
(4, 4, '401');

-- --------------------------------------------------------

--
-- Структура таблицы `prepodovatel`
--

CREATE TABLE `prepodovatel` (
  `kod_prepodovatel` int(11) NOT NULL,
  `fio` varchar(50) NOT NULL,
  `aderes` text NOT NULL,
  `doljnost` varchar(50) NOT NULL,
  `uchenaya_stepen` varchar(50) NOT NULL,
  `komu_prepadart` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `prepodovatel`
--

INSERT INTO `prepodovatel` (`kod_prepodovatel`, `fio`, `aderes`, `doljnost`, `uchenaya_stepen`, `komu_prepadart`) VALUES
(1, 'Анжелика анжела ', 'тополева 80', 'старший преподаватель', 'Кандидат наук', '101, 103, 202'),
(2, 'Ангелина ангелин', 'комсомол 53', 'ассистент', 'Доктор наук', '203');

-- --------------------------------------------------------

--
-- Структура таблицы `student`
--

CREATE TABLE `student` (
  `kod_studenta` int(11) NOT NULL,
  `fio` varchar(50) NOT NULL,
  `kod_fakultet` int(50) NOT NULL,
  `kod_grupp` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `student`
--

INSERT INTO `student` (`kod_studenta`, `fio`, `kod_fakultet`, `kod_grupp`) VALUES
(1, 'Кузин Дмитрий Николаевич', 1, 1),
(2, 'Политыкин Владислав ', 2, 2),
(3, 'Елкин Палкин', 3, 3),
(4, 'Ветки Шишкина', 4, 4);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `fakultet`
--
ALTER TABLE `fakultet`
  ADD PRIMARY KEY (`kod_fakultet`);

--
-- Индексы таблицы `gruppa`
--
ALTER TABLE `gruppa`
  ADD PRIMARY KEY (`kod_grupp`),
  ADD KEY `kod_fakultet` (`kod_fakultet`);

--
-- Индексы таблицы `prepodovatel`
--
ALTER TABLE `prepodovatel`
  ADD PRIMARY KEY (`kod_prepodovatel`);

--
-- Индексы таблицы `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`kod_studenta`),
  ADD KEY `kod_fakultet` (`kod_fakultet`),
  ADD KEY `kod_grupp` (`kod_grupp`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `fakultet`
--
ALTER TABLE `fakultet`
  MODIFY `kod_fakultet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `gruppa`
--
ALTER TABLE `gruppa`
  MODIFY `kod_grupp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `prepodovatel`
--
ALTER TABLE `prepodovatel`
  MODIFY `kod_prepodovatel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `student`
--
ALTER TABLE `student`
  MODIFY `kod_studenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `gruppa`
--
ALTER TABLE `gruppa`
  ADD CONSTRAINT `gruppa_ibfk_1` FOREIGN KEY (`kod_fakultet`) REFERENCES `fakultet` (`kod_fakultet`);

--
-- Ограничения внешнего ключа таблицы `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`kod_fakultet`) REFERENCES `fakultet` (`kod_fakultet`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`kod_grupp`) REFERENCES `gruppa` (`kod_grupp`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
