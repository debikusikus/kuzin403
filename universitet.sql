-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 09 2022 г., 21:00
-- Версия сервера: 10.4.24-MariaDB
-- Версия PHP: 8.1.6

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
  `dekan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `fakultet`
--

INSERT INTO `fakultet` (`kod_fakultet`, `nazvanie`, `dekan`) VALUES
(1, 'филологический', 'дмитревна'),
(2, 'журналистики', 'ванькова'),
(3, 'психологический', 'катьевна'),
(4, 'физико-математический', 'елкина'),
(5, 'инфантильнийский', 'александровнивича');

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
(2, 1, '102'),
(3, 1, '103'),
(4, 2, '201'),
(5, 2, '202'),
(6, 2, '203'),
(7, 3, '301'),
(8, 3, '302'),
(9, 3, '303'),
(10, 4, '401'),
(11, 4, '402'),
(12, 4, '403');

-- --------------------------------------------------------

--
-- Структура таблицы `gruppa_and_fakultet`
--

CREATE TABLE `gruppa_and_fakultet` (
  `kod_grupp` int(11) NOT NULL,
  `kod_fakultet` int(11) NOT NULL,
  `nazvanie_napravleniya` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `gruppa_and_fakultet`
--

INSERT INTO `gruppa_and_fakultet` (`kod_grupp`, `kod_fakultet`, `nazvanie_napravleniya`) VALUES
(3, 1, 'филолигия в обществе'),
(4, 2, 'общение с людьми'),
(6, 2, 'общение с богатыми'),
(10, 4, 'математика'),
(12, 4, 'информационные системы');

-- --------------------------------------------------------

--
-- Структура таблицы `gruppa_and_prepodovatel`
--

CREATE TABLE `gruppa_and_prepodovatel` (
  `kod_grupp` int(11) NOT NULL,
  `kod_prepodovatel` int(11) NOT NULL,
  `nazvanie_predmeta` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `gruppa_and_prepodovatel`
--

INSERT INTO `gruppa_and_prepodovatel` (`kod_grupp`, `kod_prepodovatel`, `nazvanie_predmeta`) VALUES
(1, 1, 'Информатика'),
(3, 3, 'химия'),
(8, 2, 'Математика'),
(11, 4, 'биология'),
(11, 5, 'обж');

-- --------------------------------------------------------

--
-- Структура таблицы `prepodovatel`
--

CREATE TABLE `prepodovatel` (
  `kod_prepodovatel` int(11) NOT NULL,
  `fio` varchar(50) NOT NULL,
  `aderes` text NOT NULL,
  `doljnost` varchar(50) NOT NULL,
  `uchenaya_stepen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `prepodovatel`
--

INSERT INTO `prepodovatel` (`kod_prepodovatel`, `fio`, `aderes`, `doljnost`, `uchenaya_stepen`) VALUES
(1, 'Анжелика анжела ', 'тополева 80', 'старший преподаватель', 'Кандидат наук'),
(2, 'Ангелина ангелин', 'комсомол 53', 'ассистент', 'Доктор наук'),
(3, 'Евгения Алексеевна', 'ешкина 43', 'лаборант', 'Бакалавр'),
(4, 'Никулина Елена', 'комсомольский 64', 'доцент', 'Магистр'),
(5, 'Шишкова Любовь', 'леннина 21', 'завкафедрой', 'Магистр');

-- --------------------------------------------------------

--
-- Структура таблицы `student`
--

CREATE TABLE `student` (
  `kod_studenta` int(11) NOT NULL,
  `fio` varchar(50) NOT NULL,
  `kod_grupp` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `student`
--

INSERT INTO `student` (`kod_studenta`, `fio`, `kod_grupp`) VALUES
(1, 'Кузин Дмитрий Николаевич', 2),
(2, 'Политыкин Владислав Александрович', 12),
(3, 'Елкин Палкин Евгеньевич', 4),
(4, 'Ветки Шишкина Николаевич', 7),
(5, 'Шмараев Матвей Романович', 7);

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
-- Индексы таблицы `gruppa_and_fakultet`
--
ALTER TABLE `gruppa_and_fakultet`
  ADD PRIMARY KEY (`kod_grupp`,`kod_fakultet`),
  ADD KEY `kod_fakultet` (`kod_fakultet`);

--
-- Индексы таблицы `gruppa_and_prepodovatel`
--
ALTER TABLE `gruppa_and_prepodovatel`
  ADD PRIMARY KEY (`kod_grupp`,`kod_prepodovatel`),
  ADD KEY `kod_prepodovatel` (`kod_prepodovatel`);

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
  ADD KEY `kod_grupp` (`kod_grupp`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `fakultet`
--
ALTER TABLE `fakultet`
  MODIFY `kod_fakultet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `gruppa`
--
ALTER TABLE `gruppa`
  MODIFY `kod_grupp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `prepodovatel`
--
ALTER TABLE `prepodovatel`
  MODIFY `kod_prepodovatel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `student`
--
ALTER TABLE `student`
  MODIFY `kod_studenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `gruppa`
--
ALTER TABLE `gruppa`
  ADD CONSTRAINT `gruppa_ibfk_1` FOREIGN KEY (`kod_fakultet`) REFERENCES `fakultet` (`kod_fakultet`);

--
-- Ограничения внешнего ключа таблицы `gruppa_and_fakultet`
--
ALTER TABLE `gruppa_and_fakultet`
  ADD CONSTRAINT `gruppa_and_fakultet_ibfk_1` FOREIGN KEY (`kod_fakultet`) REFERENCES `fakultet` (`kod_fakultet`),
  ADD CONSTRAINT `gruppa_and_fakultet_ibfk_2` FOREIGN KEY (`kod_grupp`) REFERENCES `gruppa` (`kod_grupp`);

--
-- Ограничения внешнего ключа таблицы `gruppa_and_prepodovatel`
--
ALTER TABLE `gruppa_and_prepodovatel`
  ADD CONSTRAINT `gruppa_and_prepodovatel_ibfk_1` FOREIGN KEY (`kod_grupp`) REFERENCES `gruppa` (`kod_grupp`),
  ADD CONSTRAINT `gruppa_and_prepodovatel_ibfk_2` FOREIGN KEY (`kod_prepodovatel`) REFERENCES `prepodovatel` (`kod_prepodovatel`);

--
-- Ограничения внешнего ключа таблицы `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`kod_grupp`) REFERENCES `gruppa` (`kod_grupp`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
