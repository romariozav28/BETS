DROP DATABASE IF EXISTS bet;
CREATE DATABASE bet
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;


USE bet;
CREATE TABLE team ( /* Таблица с командами */
    id INT PRIMARY KEY AUTO_INCREMENT,
    team_name VARCHAR(30) /* Название команда */
);

CREATE TABLE sport ( /* Таблица с видами спорта */
    id INT PRIMARY KEY AUTO_INCREMENT,
    sport_name VARCHAR(30) /* Название вида спорта */
);

CREATE TABLE type_of_bet ( /* Таблица типов ставок (одинар, экспресс, система) */
    id INT PRIMARY KEY AUTO_INCREMENT,
    type_bet VARCHAR(40) /* Название типа ставки */
);

CREATE TABLE selection ( /* Таблица выборов пари */
    id INT PRIMARY KEY AUTO_INCREMENT,
    bet_selection VARCHAR(30) /* Название видов выбора пари (тотал, форма, победа, ничья) */
);

CREATE TABLE championsheep ( /* Таблица названий чемпионатов */
    id INT PRIMARY KEY AUTO_INCREMENT,
    championsheep_name VARCHAR(60) /* Название чемпионатов */
);


CREATE TABLE bets (
    id INT PRIMARY KEY AUTO_INCREMENT,
    date_registration TIMESTAMP DEFAULT CURRENT_TIMESTAMP, /* Дата и время проведения ставки */
    type_bet_id INT, /* Тип ставки, связана с таблицей bet */
    type_sport_id INT, /* Вид спорта, связана с таблицей sport */
    type_championsheep_id INT, /* Чемпионат, связана с таблицей championsheep */
    team_id_1 INT, /* Название команды 1,связана с таблицей team */
    team_id_2 INT, /* Название команды 2, связана с таблицей team */
    bet_selection_id INT, /* Выбор по ставке, связана с таблицей selection */
    bet_selection_sum FLOAT, /* Количественный показатель выбора ставки */
    bet_amount INT, /* Сумма ставки */
    ratio FLOAT, /* Коэффициент */
    amount_to_be_paid FLOAT, /* Сумма к выплате (Умножение суммы ставки на коэффициент) */
    winning FLOAT, /* Сумма выигрыша или проигрыша (разницы между суммы к выплате и суммы ставки) */
    event_selection VARCHAR(20), /* Счет в пределах временного отрезка выбора события */
    score_final VARCHAR(20), /* Итоговый счет матча (просто для статистик) */
    comment TEXT, /* Описание ставки, рассуждения, выводы */
    FOREIGN KEY (type_bet_id) REFERENCES type_of_bet(id),
    FOREIGN KEY (type_sport_id) REFERENCES sport(id),
    FOREIGN KEY (type_championsheep_id) REFERENCES championsheep(id),
    FOREIGN KEY (team_id_1) REFERENCES team(id),
    FOREIGN KEY (team_id_2) REFERENCES team(id),
    FOREIGN KEY (bet_selection_id) REFERENCES selection(id) 

);

CREATE TABLE country (
    id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(40) NOT NULL
);

ALTER TABLE team
ADD country_name_id INT,
ADD sport_name_id INT,
ADD FOREIGN KEY (country_name_id) REFERENCES country(id),
ADD FOREIGN KEY (sport_name_id) REFERENCES sport(id);

ALTER TABLE championsheep
ADD country_name_id INT,
ADD FOREIGN KEY (country_name_id) REFERENCES country(id);