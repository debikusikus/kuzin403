ALTER TABLE users ALTER COLUMN city SET DEFAULT 'saintpetersburg';

ALTER TABLE users MODIFY COLUMN gender TINYINT(1) NOT NULL;
ALTER TABLE users ALTER COLUMN gender SET DEFAULT 1;

CREATE TABLE gender (
id TINYINT(1) PRIMARY KEY AUTO_INCREMENT,
rus VARCHAR(10) NOT NULL,
eng VARCHAR(10) NOT NULL
);

INSERT INTO gender (rus, eng) values
('мужчина', 'man'),
('женщина', 'woman');

CREATE TABLE company (
id INT(11) PRIMARY KEY AUTO_INCREMENT, 
name VARCHAR(60),
director VARCHAR(60),
NomerNalog VARCHAR(30) UNIQUE,
CompaniNomer VARCHAR(20) UNIQUE,
adres VARCHAR(100)
);

CREATE TABLE Gorod (
id INT(11) PRIMARY KEY AUTO_INCREMENT,
neyming VARCHAR(25)
);

INSERT INTO company (name) VALUES 
('Fred Hill'), ('Lawrence Richardson'), ('John Roberts'), ('Larry Lee'), ('Chad Montgomery'), ('Robert Campbell'),


INSERT INTO Gorod (name) VALUES
('Khamont'), ('Climbridge'), ('Chuham'), ('Khaappolis'), ('Chaedson'), ('Sey'), ('Zrans'), ('Ardbus'),
('Alemond')
