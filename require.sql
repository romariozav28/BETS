USE bet;

UPDATE championsheep
SET country_name_id=(SELECT id FROM country WHERE country_name='Испания')
WHERE championsheep_name='Ла Лига';

ALTER TABLE championsheep
ADD sport_name_id INT;

INSERT INTO championsheep
(championsheep_name)
VALUES ('1-й дивизион А');

ALTER TABLE bets 
CHANGE date_game date_game TIMESTAMP AFTER date_registration;